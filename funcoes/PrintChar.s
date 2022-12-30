#########################################################
#  PrintChar                                            #
#  a0 = char(ASCII)                                     #
#  a1 = x                                               #
#  a2 = y                                               #
#  a3 = cores (0x0000bbff) 	b = fundo, f = frente	#
#  a4 = frame (0 ou 1)					#
#########################################################
#   t0 = i                                             	#
#   t1 = j                                             	#
#   t2 = endereco do char na memoria                   	#
#   t3 = metade do char (2a e depois 1a)               	#
#   t4 = endereco para impressao                       	#
#   t5 = background color                              	#
#   t6 = foreground color                              	#
#########################################################
#	t9 foi convertido para s9 pois nao ha registradores temporarios sobrando dentro desta funcao

PrintChar:	
		addi 	sp, sp, -28
		
		sw	a0, 0(sp)
		sw	a1, 4(sp)
		sw	a2, 8(sp)
		sw	a3, 12(sp)
		sw	a4, 16(sp)
		sw	a7, 20(sp)
		sw	ra, 24(sp)
		
		li 	t4, 0xFF	# t4 temporario
		slli 	t4, t4, 8	# t4 = 0x0000FF00 (no RARS, nao podemos fazer diretamente "andi rd, rs1, 0xFF00")
		and    	t5, a3, t4   	# t5 obtem cor de fundo
    		srli	t5, t5, 8	# numero da cor de fundo
		andi   	t6, a3, 0xFF    # t6 obtem cor de frente

		li 	tp, ' '
		blt 	a0, tp, printChar.NAOIMPRIMIVEL	# ascii menor que 32 nao eh imprimivel
		li 	tp, '~'
		bgt	a0, tp, printChar.NAOIMPRIMIVEL	# ascii Maior que 126  nao eh imprimivel
    		j       printChar.IMPRIMIVEL
    
printChar.NAOIMPRIMIVEL: li      a0, 32		# Imprime espaco

printChar.IMPRIMIVEL:	li	tp, 320		# Num colunas 320
			mul     t4, tp, a2			# multiplica a2x320  t4 = coordenada y
			add     t4, t4, a1               	# t4 = 320*y + x
			addi    t4, t4, 7                 	# t4 = 320*y + (x+7)
			li      tp, 0xFF000000           	# Endereco de inicio da memoria VGA0
			beq 	a4, zero, printChar.PULAFRAME		# Verifica qual o frame a ser usado em a4
			li      tp, 0xFF100000           	# Endereco de inicio da memoria VGA1
printChar.PULAFRAME:	add     t4, t4, tp               	# t4 = endereco de impressao do ultimo pixel da primeira linha do char
			addi    t2, a0, -32               	# indice do char na memoria
			slli    t2, t2, 3                 	# offset em bytes em relacao ao endereco inicial
			la      t3, LabelTabChar		# endereco dos caracteres na memoria
			add     t2, t2, t3               	# endereco do caractere na memoria
			lw      t3, 0(t2)                 	# carrega a primeira word do char
			li 	t0, 4				# i=4

printChar.forChar1I:	beq     t0, zero, printChar.endForChar1I # if(i == 0) end for i
    			addi    t1, zero, 8               	# j = 8

printChar.forChar1J:	beq     t1, zero, printChar.endForChar1J # if(j == 0) end for j
        		andi    a7, t3, 0x001			# primeiro bit do caracter
        		srli    t3, t3, 1             		# retira o primeiro bit
        		beq     a7, zero, printChar.printCharPixelbg1	# pixel eh fundo?
        		sb      t6, 0(t4)             		# imprime pixel com cor de frente
        		j       printChar.endCharPixel1
printChar.printCharPixelbg1:	sb      t5, 0(t4)                # imprime pixel com cor de fundo
printChar.endCharPixel1: addi    t1, t1, -1                	# j--
    			addi    t4, t4, -1                	# t4 aponta um pixel para a esquerda
    			j       printChar.forChar1J		# volta novo pixel

printChar.endForChar1J: addi    t0, t0, -1 		# i--
    			addi    t4, t4, 328           	# 2**12 + 8
    			j       printChar.forChar1I	# volta ao loop

printChar.endForChar1I:	lw      t3, 4(t2)           	# carrega a segunda word do char
			li 	t0, 4			# i = 4
printChar.forChar2I:    beq     t0, zero, printChar.endForChar2I  # if(i == 0) end for i
    			addi    t1, zero, 8             # j = 8

printChar.forChar2J:	beq	t1, zero, printChar.endForChar2J # if(j == 0) end for j
        		andi    t2, t3, 0x001	    		# pixel a ser impresso
        		srli    t3, t3, 1                 	# desloca para o proximo
        		beq     t2, zero, printChar.printCharPixelbg2 # pixel eh fundo?
        		sb      t6, 0(t4)			# imprime cor frente
        		j       printChar.endCharPixel2		# volta ao loop

printChar.printCharPixelbg2:	sb      t5, 0(t4)		# imprime cor de fundo

printChar.endCharPixel2:	addi    t1, t1, -1		# j--
    				addi    t4, t4, -1              # t4 aponta um pixel para a esquerda
    				j       printChar.forChar2J

printChar.endForChar2J:	addi	t0, t0, -1 		# i--
    			addi    t4, t4, 328		#
    			j       printChar.forChar2I	# volta ao loop

printChar.endForChar2I:	
			li	a0, 30
			call	Sleep
			lw	a0, 0(sp)
			lw	a1, 4(sp)
			lw	a2, 8(sp)
			lw	a3, 12(sp)
			lw	a4, 16(sp)
			lw	a7, 20(sp)
			lw	ra, 24(sp)
			addi 	sp, sp, 28
			ret				# retorna
