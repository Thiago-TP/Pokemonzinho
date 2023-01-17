.data
.include "CharTable.data"
# para futuras expansões: https://theasciicode.com.ar

str_lower:	.string	"So, you're here. I'm BROCK."
str_upper:	.string	"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
str_numbers:	.string	"0123456789"
str_symbols:	.string	"!?=+- $%&*()[]{}/|~<>,.;:^'`_@"
	
.text
.macro test_set(%x, %y, %color)
	la	a0, str_symbols	# char de teste
	li	a1, %x
	li	a2, %y
	li	a3, 0xFF200000
	lw	a3, 0(a3)	# frame atual
	li	a4, %color	
	jal	PrintString	# resultado
	
	la	a0, str_lower
	addi	a2, a2, 11
	jal	PrintString	# resultado
	
	la	a0, str_upper
	addi	a2, a2, 11
	jal	PrintString	# resultado
	
	la	a0, str_numbers
	addi	a2, a2, 11
	jal	PrintString	# resultado
.end_macro

MAIN:	
	test_set(80,  20, 0x0025ff00)	# letra preta, fundo branco, sombra amarelo escuro
	test_set(80, 100, 0x0054c7f8)	# letra azul neon, fundo invisível, sombra cinza avermelhado 
	test_set(80, 180, 0x00000038)	# letra verde, fundo preto, sombra preta
	
	fpg:	j fpg			# fim do programa (loop inf)







#####################################
#  PrintSring                       #
#  a0    =  endereco da string      #
#  a1    =  x                       #
#  a2    =  y                       #
#  a3    =  cor		    	    #
#####################################

PrintString:	addi	sp, sp, -12			# aloca espaco
    		sw	ra, 0(sp)			# salva ra
    		sw	s0, 4(sp)			# salva s0
    		sw	a1, 8(sp)			# salva a1
    		mv	s0, a0              		# s0 = endereco do caractere na string

loopprintString:lb	a0, 0(s0)                 	# le em a0 o caracter a ser impresso

    		beq     a0, zero, fimloopprintString	# string ASCIIZ termina com NULL

    		jal     myPrintChar       		# imprime char
    		
		addi    a1, a1, 6                 	# incrementa a coluna
		li 	t6, 318				# 314 = 320 - 6		
		blt	a1, t6, NaoPulaLinha	    	# se ainda tiver lugar na linha
    		addi    a2, a2, 10                 	# incrementa a linha
    		mv    	a1, zero			# volta a coluna zero

NaoPulaLinha:	addi    s0, s0, 1			# proximo caractere
    		j       loopprintString       		# volta ao loop

fimloopprintString:	lw      ra, 0(sp)    		# recupera ra
			lw 	s0, 4(sp)		# recupera s0
			lw 	a1, 8(sp)		# recupera a1
    			addi    sp, sp, 12		# libera espaco
fimprintString:	ret      	    			# retorna







#	- Args -		#
#	a0 = ascii char		#
#	a1 = x no bmp		#
#	a2 = y no bmp		#
#	a3 = frame no bmp	#
#	a4 = 0x00ssbbff 	# (0xff=frente/foreground, 0xbb=fundo/background, 0xss=sombra/shadow)
	
#	- Internas -		#
#	t0 = end do char na tab	#
#	t1 = end de impressao	#
#	t2 = cor de fundo	#
#	t3 = cor da frente	#
#	t4 = cont de colunas	#
#	t5 = cont de linhas	#
#	t6 = cont de bits	#
#	s0 = flag de frontbit	#
#	s1 = cor da sombra	# 
myPrintChar: 
	addi	sp, sp, -20		# expande a pilha
	sw	ra, 0(sp)		# guarda ra (funcoes serao chamadas)
	sw	a0, 4(sp)		# guarda a0 (será modificado)
	sw	a2, 8(sp)		# guarda a2 (será modificado)
	sw	s0, 12(sp)		# guarda s0 (será modificado)	
	sw	s1, 16(sp)		# guarda s1 (será modificado)
	
	la	t0, CharTable
	#addi	t1, a0, -32
	slli	t1, a0, 3		# t1 = offset em relação à tabela
	add	t0, t0, t1		# t0 <- endereco da 1a word do char
	
	jal	GetBMPaddress		# t1 = endereco de bitmap dado por a1, a2, e a3
	
	# pega sombra
	srli	s1, a4, 16	# s1 = 0x000000ss
	# pega a cor de fundo
	srli	t2, a4, 8	# t2 = 0x000000bb	
	# pega a cor de frente
	andi	t3, a4, 0xFF	# t3 = 0x000000ff
	
	lw	a0, 0(t0)		# a0 <- 1a word que desenha o char
	jal	PrintWordContents	# colore o bmp conforme o endereco t1 e o conteudo da primeira 1a word
	
	lw	a0, 4(t0)		# a0 <- 2a word que desenha o char
	addi	a2, a2, 5		# 2a word deve completar a metade de baixo, 5 pixels abaixo
	jal	GetBMPaddress		# atualiza o end de impressao, t1
	jal	PrintWordContents	# colore o bmp conforme o endereco t1 e o conteudo da primeira 1a word
	
	lw	ra, 0(sp)		# recupera ra 
	lw	a0, 4(sp)		# recupera a0 
	lw	a2, 8(sp)		# recupera a2 
	lw	s0, 12(sp)		# recupera s0 
	lw	s1, 16(sp)		# recupera s1 
	addi	sp, sp, 20		# fecha a pilha
	ret				# fim da função
	
GetBMPaddress:
	li	t1, 0xFF0
	add	t1, t1, a3
	slli	t1, t1, 20	# end base, 0xFF0_00000 ou 0xFF1_00000
	
	add	t1, t1, a1	# t1 = base + x
	li	t4, 320		# t4 para não usar t0 a t3
	mul	t4, t4, a2	# offset vertical = 320*y
	add	t1, t1, t4	# t1 = base + x + 320*y = end do primeiro pixel
	
	ret			# fim da funcao			
	
PrintWordContents:	
	# inicializa contadores
	li	t4, 6		# da coluna/largura
	li	t5, 5		# da linha/altura (5=10/2)
	li	t6, 0		# de bits
lineLoop:
	# s0 <- bit da word em a0
	li	s0, 0x80000000	# inicializado como 0b_1000...0
	srl	s0, s0, t6	# ajuste para o and
	and	s0, s0, a0 	# s0 <- 0b_00...0 ou 1...0
	sll	s0, s0, t6	# s0 <- 0b_00...0 ou 0b_10...0
	srli    s0, s0, 31  # s0 <- 0b_00...0 ou 1
	
	addi	t6, t6, 1	# bit_cont++
	bnez	s0, printFront	# bit = 1 => cor da frente
	
	lb	s0, 0(t1)
	beq	s0, s1, nextByte	# lugar da sombra ? não imprime fundo : imprime fundo
	sb	t2, 0(t1)	# imprime byte de fundo
	j	nextByte
printFront:
	sb	t3, 0(t1)	# imprime byte de frente
	sb	s1, 1(t1)	# imprime sombra na direita
	sb	s1, 320(t1)	# imprime sombra abaixo
	sb	s1, 321(t1)	# imprime sombra abaixo na direita
nextByte:	
	addi	t1, t1, 1	# endereço do próximo byte
	addi	t4, t4, -1	# col_cont--
	bgtz	t4, lineLoop	# não terminou a linha? continua impressão : próxima linha
	
	addi	t1, t1, 320	# desce uma linha no bmp
	addi	t1, t1, -6	# volta à primeira coluna
	li	t4, 6		# reinicia o cont de colunas
	addi	t5, t5, -1	# len_cont--	
	bgtz	t5, lineLoop	# não acabaram as linhas? continua impressão : fim da impressão

	ret			# fim da função		
	
	
	
	
	
	
	
