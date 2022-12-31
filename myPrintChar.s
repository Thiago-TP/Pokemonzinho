.data
myCharTable:	# sprites ajustadas para 6x10 (6x11 passa dos 64 bits contidos em 2 words)
		# a metade superior é a word da esquerda, e a inferior a da direita
		# bit da word: 0 => fundo, 1 => frente 
#	' '	    		'!'			'"'			'#'
.word 	0x00000000, 0x00000000, 0x10101010, 0x00100010, 0x00002828, 0x00000000, 0x28FE2828, 0x002828FE,
#	'$'			'%'			'&'			''' 
	0x38503C10, 0x00107814, 0x10686400, 0x00004C2C, 0x28102818, 0x003A4446, 0x00001010, 0x00000000,
#	'('			')'			'*'			'+' 
	0x20201008, 0x00081020, 0x08081020, 0x00201008, 0x38549210, 0x00109254, 0xFE101010, 0x00101010,
#	','			'-'			'.'			'/' 
	0x00000000, 0x10081818, 0xFE000000, 0x00000000, 0x00000000, 0x18180000, 0x10080402, 0x00804020, 
#	'0'			'1'			'2'			'3'
	0x54444438, 0x00384444, 0x10103010, 0x00381010, 0x0841144e, 0x007c1084, 0x18044438, 0x00384404, 
#	'4'			'5'			'6'			'7'
	0x7C482818, 0x001C0808, 0x7840407C, 0x00384404, 0x78404438, 0x00384444, 0x1008047C, 0x00202020, 
#	'8'			'9'			':'			';'
	0x38444438, 0x00384444, 0x3C444438, 0x00384404, 0x00181800, 0x00001818, 0x00181800, 0x10081818,
#	'<'			'='			'>'			'?' 
	0x20100804, 0x00040810, 0x00FE0000, 0x000000FE, 0x04081020, 0x00201008, 0x08044438, 0x00100010,
#	'@'			'A'			'B'			'C' 
	0x545C4438, 0x0038405C, 0x7C444438, 0x00444444, 0x78444478, 0x00784444, 0x40404438, 0x00384440,
#	'D'			'E'			'F'			'G'
	0x44444478, 0x00784444, 0x7840407C, 0x007C4040, 0x7C40407C, 0x00404040, 0x5C404438, 0x00384444,
#	'H'			'I'			'J'			'K' 
	0x7C444444, 0x00444444, 0x10101038, 0x00381010, 0x0808081C, 0x00304848, 0x70484444, 0x00444448, 
#	'L'			'M'			'N'			'O'
	0x20202020, 0x003C2020, 0x92AAC682, 0x00828282, 0x54546444, 0x0044444C, 0x44444438, 0x00384444,
#	'P'			'Q'			'R'			'S' 
	0x38242438, 0x00202020, 0x44444438, 0x0C384444, 0x78444478, 0x00444850, 0x38404438, 0x00384404, 
#	'T'			'U'			'V'			'W'
	0x1010107C, 0x00101010, 0x44444444, 0x00384444, 0x28444444, 0x00101028, 0x54828282, 0x00282854,
#	'X'			'Y'			'Z'			'[' 
	0x10284444, 0x00444428, 0x10284444, 0x00101010, 0x1008047C, 0x007C4020, 0x20202038, 0x00382020,
#	'\'			']'			'^'			'_' 
	0x10204080, 0x00020408, 0x08080838, 0x00380808, 0x00442810, 0x00000000, 0x00000000, 0xFE000000, 
#	'`'			'a'			'b'			'c'
	0x00000810, 0x00000000, 0x3C043800, 0x003A4444, 0x24382020, 0x00582424, 0x201C0000, 0x001C2020,
#	'd'			'e'			'f'			'g' 
	0x48380808, 0x00344848, 0x44380000, 0x0038407C, 0x70202418, 0x00202020, 0x443A0000, 0x38043C44,
#	'h'			'i'			'j'			'k' 
	0x64584040, 0x00444444, 0x10001000, 0x00101010, 0x10001000, 0x60101010, 0x28242020, 0x00242830,
#	'l'			'm'			'n'			'o' 
	0x08080818, 0x00080808, 0x49B60000, 0x00414149, 0x24580000, 0x00242424, 0x44380000, 0x00384444,
#	'p'			'q'			'r'			's' 
	0x24580000, 0x20203824, 0x48340000, 0x08083848, 0x302C0000, 0x00202020, 0x201C0000, 0x00380418,
#	't'			'u'			'v'			'w' 
	0x10381000, 0x00101010, 0x48480000, 0x00344848, 0x44440000, 0x00102844, 0x82820000, 0x0044AA92,
#	'x'			'y'			'z'			'{' 
	0x28440000, 0x00442810, 0x24240000, 0x38041C24, 0x043C0000, 0x003C1008, 0x2010100C, 0x000C1010,
#	'|'			'}'			'~' 
	0x10101010, 0x00101010, 0x04080830, 0x00300808, 0x92600000, 0x0000000C
#	para futuras expansões:	https://theasciicode.com.ar
	
.text
MAIN:
	li	a0, ' '		# char de teste
	li	a1, 157
	li	a2, 110
	li	a3, 0xFF200000
	lw	a3, 0(a3)	# frame atual
	li	a4, 0x0000FF07	# fundo branco, letra preta
	jal	myPrintChar	# resultado
	
	li	a7, 11
	ecall			# esperado
	
	fpg:	j fpg		# fim do programa (loop inf)
	li	a7, 10		# fim do programa (syscall)
	ecall



#	- Args -		#
#	a0 = ascii char		#
#	a1 = x no bmp		#
#	a2 = y no bmp		#
#	a3 = frame no bmp	#
#	a4 = 0x0000bbff 	# (0xff=frente/foreground, 0xbb=fundo/background)
	
#	- Internas -		#
#	t0 = end do char na tab	#
#	t1 = end de impressao	#
#	t2 = cor de fundo	#
#	t3 = cor da frente	#
#	t4 = cont de colunas	#
#	t5 = cont de linhas	#
#	t6 = cont de bits	#
#	s0 = flag de frontbit	# 
myPrintChar: 
	addi	sp, sp, -12		# expande a pilha
	sw	ra, 0(sp)		# guarda ra (funcoes serao chamadas)
	sw	a0, 4(sp)		# guarda a0 (será modificado)
	sw	s0, 8(sp)		# guarda s0 (será modificado)
	
	la	t0, myCharTable
	addi	t1, a0, -32
	slli	t1, t1, 3		# t1 = offset em relação à tabela 
	add	t0, t0, t1		# t0 <- endereco da 1a word do char
	
	jal	GetBMPaddress		# t1 = endereco de bitmap dado por a1, a2, e a3
	
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
	lw	s0, 8(sp)		# recupera s0 
	addi	sp, sp, 12		# fecha a pilha
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
	li	t5, 5		# da linha/altura (10/5)
	li	t6, 0		# de bits
lineLoop:
	# s0 <- bit da word em a0
	li	s0, 0x00000001	# inicializado como 1
	sll	s0, s0, t6	# ajuste para o and
	and	s0, s0, a0 	# s0 <- 0b 00...0 ou 1...0
	srl	s0, s0, t6	# s0 <- 0 ou 1
	
	addi	t6, t6, 1	# bit_cont++
	bnez	s0, printFront	# bit = 1 => cor da frente
	sb	t2, 0(t1)	# imprime byte de fundo
	j	nextByte
printFront:
	sb	t3, 0(t1)	# imprime byte de frente
nextByte:	
	addi	t1, t1, 1	# endereço do próximo byte
	addi	t4, t4, -1	# col_cont--
	bgtz	t4, lineLoop	# não terminou a linha? continua impressão : próxima linha
	
	addi	t1, t1, 320	# desce uma linha no bmp
	addi	t1, t1, -6	# volta à primeira coluna
	li	t4, 6		# reinicia o cont de colunas
	addi	t5, t5, -1	# len_cont--	
	bgtz	t5, lineLoop	# não acabaram as linhas? continua impressão : fim da impressão

	ret			# fim da funcao		
	
	
	
	
	
	
	
