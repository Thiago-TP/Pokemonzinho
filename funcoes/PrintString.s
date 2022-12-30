#####################################
#  PrintSring                       #
#  a0    =  endereco da string      #
#  a1    =  x                       #
#  a2    =  y                       #
#  a3    =  cor		    	    #
#  a4 	 =  frame (0 ou 1)	    #
#####################################

PrintString:	addi 	sp, sp, -20
		sw	ra, 0(sp)
		sw	s0, 4(sp)
		sw	a0, 8(sp)
		sw	a1, 12(sp)
		sw	a2, 16(sp)
		
    		mv	s0, a0              		# s0 = endereco do caractere na string

loopprintString:lb	a0, 0(s0)                 	# le em a0 o caracter a ser impresso

    		beq     a0, zero, fimloopprintString	# string ASCIIZ termina com NULL

    		jal     PrintChar       		# imprime char
    		
		addi    a1, a1, 8                 	# incrementa a coluna
		li 	t0, 300		
		blt	a1, t0, NaoPulaLinha	    	# se ainda tiver lugar na linha
    		addi    a2, a2, 10                 	# incrementa a linha
    		li    	a1, 10				# volta a coluna 10 (x=10)
NaoPulaLinha:	addi    s0, s0, 1			# proximo caractere
    		j       loopprintString       		# volta ao loop

fimloopprintString:	lw	ra, 0(sp)
			lw	s0, 4(sp)
			lw	a0, 8(sp)
			lw	a1, 12(sp)
			lw	a2, 16(sp)
			addi 	sp, sp, 20
			ret      	    		# retorna