.data
myCharTable:	# sprites ajustadas para 6x10 (6x11 passa dos 64 bits contidos em 2 words)
		# a metade superior é a word da esquerda, e a inferior a da direita
		# bit da word: 0 => fundo, 1 => frente 
.word
#	' '	    		'!'			'"'			'#'
 	0x00000000, 0x00000000, 0x04104104, 0x00104004, 0x006db252, 0x00000000, 0x0a7ca280, 0x0028a7ca,
#	'$'			'%'			'&'			''' 
	0x0239248e, 0x0009f09f, 0x0430f557, 0x01756784, 0x1410a284, 0x0058924a, 0x000420c3, 0x00000000,
#	'('			')'			'*'			'+' 
	0x02082084, 0x00102082, 0x04104102, 0x00084104, 0x0e7ce544, 0x00000115, 0x1f104000, 0x00000104,
#	','			'-'			'.'			'/' 
	0x00000000, 0x00084186, 0x1f000000, 0x00000000, 0x00000000, 0x0030c000, 0x04208410, 0x01042084, 
#	'0'			'1'			'2'			'3'
	0x1145144e, 0x00391451, 0x04104184, 0x00384104, 0x0841144e, 0x007c1084, 0x0c41044e, 0x00391410, 
#	'4'			'5'			'6'			'7'
	0x0924a28c, 0x002087c9, 0x0f04105f, 0x00391410, 0x0f04144e, 0x00391451, 0x0841041f, 0x00104108, 
#	'8'			'9'			':'			';'
	0x0e45144e, 0x00391451, 0x1e45144e, 0x00391410, 0x0000c300, 0x0000c300, 0x0000c300, 0x0420c300,
#	'<'			'='			'>'			'?' 
	0x01084210, 0x10204081, 0x007c0000, 0x000007c0, 0x10204081, 0x01084210, 0x0c45144e, 0x00104004,
#	'@'			'A'			'B'			'C' 
	0x25e61f80, 0x00781e65, 0x1f45144e, 0x00011451, 0x113d144f, 0x0000f451, 0x0104144e, 0x0000e441,
#	'D'			'E'			'F'			'G'
	0x1145144f, 0x0000f451, 0x013c105f, 0x0001f041, 0x013c105f, 0x00001041, 0x1905144e, 0x0000e451,
#	'H'			'I'			'J'			'K' 
	0x117d1451, 0x00011451, 0x0410411f, 0x0001f104, 0x10410410, 0x0000e450, 0x030c5251, 0x00011245, 
#	'L'			'M'			'N'			'O'
	0x01041041, 0x0001f041, 0x1555b6d1, 0x00011451, 0x195534d1, 0x00011459, 0x1145144e, 0x0000e451,
#	'P'			'Q'			'R'			'S' 
	0x0f45144f, 0x00001041, 0x1145144e, 0x0002e657, 0x0f45144f, 0x00011449, 0x0818144e, 0x0000e450, 
#	'T'			'U'			'V'			'W'
	0x0410411f, 0x00004104, 0x11451451, 0x0000e451, 0x0a451451, 0x0000410a, 0x15555451, 0x000116db,
#	'X'			'Y'			'Z'			'[' 
	0x0410a451, 0x0001144a, 0x0428a451, 0x00004104, 0x0410841f, 0x0001f042, 0x02082086, 0x00182082,
#	'\'			']'			'^'			'_' 
	0x04082041, 0x10408204, 0x10410418, 0x00610410, 0x00011284, 0x00000000, 0x00000000, 0x1f000000, 
#	'`'			'a'			'b'			'c'
	0x00208104, 0x00000000, 0x1e000000, 0x00599451, 0x0f041040, 0x003d1451, 0x0e000000, 0x00391051,
#	'd'			'e'			'f'			'g' 
	0x1e410400, 0x00791451, 0x0e000000, 0x007817d1, 0x1e104600, 0x00104104, 0x11380000, 0x0e41e451,
#	'h'			'i'			'j'			'k' 
	0x0f041040, 0x00451451, 0x06000100, 0x00384104, 0x10001000, 0x60101010, 0x28242020, 0x00242830,
#	'l'			'm'			'n'			'o' 
	0x08080818, 0x00080808, 0x49B60000, 0x00414149, 0x24580000, 0x00242424, 0x44380000, 0x00384444,
#	'p'			'q'			'r'			's' 
	0x24580000, 0x20203824, 0x48340000, 0x08083848, 0x302C0000, 0x00202020, 0x201C0000, 0x00380418,
#	't'			'u'			'v'			'w' 
	0x10381000, 0x00101010, 0x48480000, 0x00344848, 0x44440000, 0x00102844, 0x82820000, 0x0044AA92,
#	'x'			'y'			'z'			'{' 
	0x28440000, 0x00442810, 0x24240000, 0x38041C24, 0x043C0000, 0x003C1008, 0x02104108, 0x00204104,
#	'|'			'}'			'~' 
	0x04104104, 0x00104104, 0x08104102, 0x00084104, 0x26000000, 0x00000019
#	para futuras expansões:	https://theasciicode.com.ar
	
.text
MAIN:
	li	a0, 'i'		# char de teste
	li	a1, 157
	li	a2, 110
	li	a3, 0xFF200000
	lw	a3, 0(a3)	# frame atual
	li	a4, 0x0000FF07	# fundo branco, letra vermelha
	jal	myPrintChar	# resultado
	
	fpg:	j fpg		# fim do programa (loop inf)










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
	sw	s0, 8(sp)		# guarda s1 (será modificado)
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

	ret			# fim da função		
	
	
	
	
	
	
	
