#########################################
# 		Argumentos		#
#					#
# a0 = mapeamento do mapa em questão	#
# a4 = frame que vamos operar		#
#					#
#	   não retorna nada		#
#					#
#########################################
PRINT_MAP:
	addi 	sp, sp, -8				# aloca 8 espacos de memoria na pilha
	sw 	ra, 0(sp)				# salva ra na pilha
	sw	a0, 4(sp)				# sal a0 que é relativo ao mapeamento do mapa na pilha
	call	CHOOSE_MAP_FR
	mv	t0,a1
	lw	t1, 4(t0) 				# carrega em t1 a altura da posicao relativa ao frame que colocamos em t0
	lw	t2, 0(t0) 				# carrega em t2 a largura da posicao relativa ao frame que colocamos em t0
	lw	t3, 4(a0) 				# carrega em t3 a altura do mapeamento do mapa que colocamos em a0
	lw	t4, 0(a0) 				# carrega em t4 a largura do mapeamento do mapa que colocamos em a0
	li	s1, 0					# inicializa em s1 a largura (0) utilizada para printarmos as tiles no bitmap
	li	s2, 0					# inicializa em s2 a altura (0) utilizada para printarmos as tiles no bitmap
	bgez	t2,JUMP_LOOP_BLACK_LFT
	li 	a7, 0xFF0				# coloca em a7 o numero base do calculo do bitmap
	add 	a7, a7, a4 				# faz a7 = a7 + a4 
	slli 	a7, a7, 20				# desloca os bites para esquerda vintes vezes
	add 	a7, a7, s1 				# adiciona a largura do ponto incial de impressão			
	li 	t0, 320 				# faz t0 = t0 + 320 para utilizar no calculo da altura
	mul 	t0, t0, s2				# faz t0 = t0 * a3 para calcular a altura incial de impressão
	add 	a7, a7, t0				# adiciona a altura incial de impressão
	mv	t5, t2
	li	t6, 240
LOOP_BLACK_ONE:
	li	t0, 0x00
	sb	t0, 0(a7)
	addi	a7, a7, 1
	addi	t5, t5, 1
	bltz	t5, LOOP_BLACK_ONE
	addi	a7, a7, 320
	add	a7, a7, t2
	mv	t5, t2
	addi	t6, t6, -1
	bgtz	t6, LOOP_BLACK_ONE
JUMP_LOOP_BLACK_LFT:
	bgez	t1, JUMP_LOOP_BLACK_UP
	li 	a7, 0xFF0				# coloca em a7 o numero base do calculo do bitmap
	add 	a7, a7, a4 				# faz a7 = a7 + a4 
	slli 	a7, a7, 20				# desloca os bites para esquerda vintes vezes
	add 	a7, a7, s1 				# adiciona a largura do ponto incial de impressão			
	li 	t0, 320 				# faz t0 = t0 + 320 para utilizar no calculo da altura
	mul 	t0, t0, s2				# faz t0 = t0 * a3 para calcular a altura incial de impressão
	add 	a7, a7, t0				# adiciona a altura incial de impressão
	li	t5, 320
	mv	t6, t1
LOOP_BLACK_TWO:
	li	t0, 0x00
	sb	t0, 0(a7)
	addi	a7, a7, 1
	addi	t5, t5, -1
	bgtz	t5, LOOP_BLACK_TWO
	li	t5, 320
	addi	t6, t6, 1
	bltz	t6, LOOP_BLACK_TWO
	sub	s2, s2, t1
JUMP_LOOP_BLACK_UP:
	li	t5, 0					# inicializa em t5 o contador de tiles passados horizontalmente 
	li	t6, 0					# inicializa em t6 o contador de tiles passados verticalmente
	addi	a0, a0, 8				# faço a0 = a0 + 8 para irmos para o endereço relativo de fato ao mapeamento
LOOP_PRINT_MAP:
	li	a7, 320
	bne	s1, a7, JUMP_CHECKS_END_PRINT
	li	a7, 240
	bne	s2, a7, JUMP_CHECKS_END_PRINT
	j	END_LOOP_PRINT_MAP
JUMP_CHECKS_END_PRINT:
	li	a7, 16					# carrega em a7 o valor de altura de uma tile (fixado)
	mul	t0, t6, a7				# faço t0 = t6 (Contador de altura de tiles passados) * a7 
	addi	t0, t0, 16				# faço t0 = t0 + 16 para sabermos se essa tile tem interseção com o mapa
	slt	a6, t0, t1				# a6 = 1 se t0 (que é a altura incial do tile + limite) for menor que t1 
							# ( que é a altura inicial do mapa) e a6 = 0 caso contario
	bnez	a6, JUMP_LINE_MAP			# se a6 != 0 pula essa linha do mapeamento de tiles 
	addi	t0, t1, 240				# faço t0 = t1 + 240 para sabermos se essa tile tem interseção com o mapa
	mul	a7, t6, a7				# faço a7 = t6 (Contador de altura de tiles passados) * a7  
	slt	a6, t0, a7				# a6 = 1 se t0 (que é a altura incial do mapa + limite) for menor que a7 
							# ( que é a altura inicial do tile) e a6 = 0 caso contario  
	bnez	a6, JUMP_LINE_MAP			# se a6 != 0 pula essa linha do mapeamento de tiles 
	li	a7, 16					# carrega em a7 o valor de altura de uma tile (fixado)
	mul	t0, t5, a7				# faço t0 = t5 (Contador de largura de tiles passados) * a7 
	addi	t0, t0, 16				# faço t0 = t0 + 16 para sabermos se essa tile tem interseção com o mapa
	slt	a6, t0, t2				# a6 = 1 se t0 (que é a largura incial do tile + limite) for menor que t2 
							# ( que é a largura inicial do mapa) e a6 = 0 caso contario
	bnez	a6, JUMP_COLUMN_MAP			# se a6 != 0 pula essa coluna do mapeamento de tiles
	addi	t0, t2, 320				# faço t0 = t2 + 320 para sabermos se essa tile tem interseção com o mapa
	mul	a7, t5, a7				# faço a7 = t5 (Contador de largura de tiles passados) * a7 
	slt	a6, t0, a7				# a6 = 1 se t0 (que é a largura incial do mapa + limite) for menor que a7 
							# ( que é a largura inicial do tile) e a6 = 0 caso contario  
	bnez	a6, JUMP_COLUMN_MAP			# se a6 != 0 pula essa coluna do mapeamento de tiles
	jal	ra, DecideTile				# se tiver interseção com o tile chama a função decide tile que retorna em a1
	bgez	t2, JUMP_BLACK_LFT
	bnez	s1, JUMP_BLACK_LFT
	sub	s1, s1, t2
JUMP_BLACK_LFT:
	mv	a2, s1					# faço a2 = s1 para colocarmos a largura como argumento para a função tile
	mv	a3, s2					# faço a3 = s2 para colocarmos a altura como argumento para a função tile
	jal	ra, TILE				# chamo a função tile que é encarregada de printar no bitmap o tile
JUMP_COLUMN_MAP:
	addi	t5, t5, 1				# faço t5 = t5 + 1 para incrementar a quantidade da largura de tiles passadas
	addi	a0, a0, 1				# faço a0 = a0 + 1 para irmos para o mapeamento da proxima tile
	blt	t5, t4, LOOP_PRINT_MAP			# se t5 < t4 ele volta para a label fazendo assim um loop na largura
	
	##########################################################################
	# Se o fluxo do codigo passou por aqui então a linha é valida e com isso #
	# obrigatoriamente precisamos printar alguma coluna e por isso somos 	 #
	# obrigados a aumentar o s2 e imprimir preto até completar o bitmap	 #
	##########################################################################
	
	beqz	s1, JUMP_LINE_MAP
	li	t0,16
	mul	t0,t4,t0
	sub	t0,t0,t2
	li	a7,320
	bge	t0,a7, JUMP_LINE_MAP
	li 	a7, 0xFF0				# coloca em a7 o numero base do calculo do bitmap
	add 	a7, a7, a4 				# faz a7 = a7 + a4 
	slli 	a7, a7, 20				# desloca os bites para esquerda vintes vezes
	add 	a7, a7, s1 				# adiciona a largura do ponto incial de impressão			
	li 	t0, 320 				# faz t0 = t0 + 320 para utilizar no calculo da altura
	mul 	t0, t0, s2				# faz t0 = t0 * a3 para calcular a altura incial de impressão
	add 	a7, a7, t0				# adiciona a altura incial de impressão
	li	a5, 320
	mv	a6, s2
	sub	t0, s4, s3
	add	s2, s2, t0	
LOOP_BLACK_FOUR:
	li	t0, 0x00
	sb	t0, 0(a7)
	addi	a7, a7, 1
	addi	a5, a5, -1
	bgt	a5, s1, LOOP_BLACK_FOUR
	li	a5, 320
	addi	a7, a7, 320
	sub	t0, a5, s1
	sub	a7, a7, t0
	addi	a6, a6, 1
	blt	a6, s2, LOOP_BLACK_FOUR
	li	s1, 0
JUMP_LINE_MAP:
	lw	a0, 4(sp)				# carrego em a0 o endereço inicial do mapeamento que salvamos na pilha
	addi	t6, t6, 1				# faço t6 = t6 + 1 para incrementar a quantidade da altura de tiles passadas
	li	t5, 0					# reinicializo a contagem da largura de tiles passadas para a nova linha
	mul	t0, t6, t4				# faço t0 = t6 (contador de altura tiles passadas) * t4 (largura mapeamento)
	addi	a0, a0, 8				# faço a0 = a0 + 8 para irmos para o endereço relativo de fato ao mapeamento
	add	a0, a0, t0				# faço a0 = a0 + t0 adicionando assim em a0 o valor das tiles ja percorridas
	blt	t6, t3, LOOP_PRINT_MAP			# se t6 < t3 ele volta para a label fazendo assim um loop na altura
	li	t0,240
	bgt	s2,t0,END_LOOP_PRINT_MAP
	li 	a7, 0xFF0				# coloca em a7 o numero base do calculo do bitmap
	add 	a7, a7, a4 				# faz a7 = a7 + a4 
	slli 	a7, a7, 20				# desloca os bites para esquerda vintes vezes
	add 	a7, a7, s1 				# adiciona a largura do ponto incial de impressão			
	li 	t0, 320 				# faz t0 = t0 + 320 para utilizar no calculo da altura
	mul 	t0, t0, s2				# faz t0 = t0 * a3 para calcular a altura incial de impressão
	add 	a7, a7, t0				# adiciona a altura incial de impressão
	li	t5, 320
	li	t6, 240
LOOP_BLACK_THREE:
	li	t0, 0x00
	sb	t0, 0(a7)
	addi	a7, a7, 1
	addi	t5, t5, -1
	bgtz	t5, LOOP_BLACK_THREE
	li	t5, 320
	addi	t6, t6, -1
	bge	t6, s2, LOOP_BLACK_THREE
END_LOOP_PRINT_MAP:
	lw 	ra, 0(sp)				# carrego em ra o valor de retorno da função que salvamos na pilha 
	addi 	sp, sp, 8				# libera espaco da pilha		
	ret						# retorna para a função que chamou print mapa que está indicada no reg ra

#########################################
# 		Argumentos		#
#					#
# a5 = modo de utilização da print	#
# a4 = frame que queremos operar	#
# a1 = endereço tile			#
# a2 = largura incial do bitmap		#
# a3 = altura inicial do bitmap		#
#					#
#	   não retorna nada		#
#					#
#########################################
# Note que a TILE é somente uma 	#
# extensão da PRINT_MAPA,isto é ela não #
# funciona fora da função PRINT_MAPA	#
# decidi por esse caminho porque está é	#
# função altamente especializada em	#
# lidar somente com a impressão do mapa	#
#########################################
TILE:
	addi	sp, sp, -20				# aloca 12 espaços de memoria
	sw	a1, 0(sp)				# salva o endereço inicial do tile 
	sw	ra, 12(sp)
	sw	a5, 16(sp)
	li 	a7, 0xFF0				# coloca em a7 o numero base do calculo do bitmap
	add 	a7, a7, a4 				# faz a7 = a7 + a4 
	slli 	a7, a7, 20				# desloca os bites para esquerda vintes vezes
	add 	a7, a7, a2 				# adiciona a largura do ponto incial de impressão			
	li 	t0, 320 				# faz t0 = t0 + 320 para utilizar no calculo da altura
	mul 	t0, t0, a3				# faz t0 = t0 * a3 para calcular a altura incial de impressão
	add 	a7, a7, t0				# adiciona a altura incial de impressão
	call	CHOOSE_MAP_FR
	mv	t0,a1
	lw	a1,0(sp)
	addi	a1,a1,8
	lw 	a6, 4(t0)				# carrega em a6 a altura da posicao relativa ao frame que colocamos em t0
	lw	a5, 0(t0)				# carrega em a5 a largura da posicao relativa ao frame que colocamos em t0
	li	t0, 16					# faço t0 = 16 para utilizarmos na obtenção do limite superior
	mul	t0, t0, t6				# faço t0 = t6 (contador de altura tiles passadas) * t0
	bge	a6, t0, JUMP_CHOOSE_LIMIT_HIG		# se a6 > t0 pula para pula escolha limite superior
	mv	s3, t0					# já que a6 é < que t0 faço s3 = t0 estabelecendo o limite superior
	j	END_CHOOSE_LIMIT_HIG			# pula a escolha do limite sup uma vez que já achamos o limite correto
JUMP_CHOOSE_LIMIT_HIG:
	mv	s3, a6					# já que a6 é >= t0 faço s3 = a6 estabelecendo o limite superior
END_CHOOSE_LIMIT_HIG:
	li	t0, 240					# faço t0 = 240 para utilizarmos na obtenção do limite inferior
	add	a6, a6, t0				# faço a6 = a6 + t0 para utilizarmos na obtenção do limite inferior
	li	t0, 16					# faço t0 = 16 para utilizarmos na obtenção do limite inferior
	mul	t0, t0, t6				# faço t0 = t6 (contador de altura tiles passadas) * t0
	addi	s4, t0, 16				# faço s4 = t0 + 16 (já é uma possibilidade de limite)
	ble	s4, a6, JUMP_CHOOSE_LIMIT_BTTM		# se s4 <= a6 o limite já está correto e eu pulo para a label em questão
	mv	s4, a6					# se s4 > a6 então concerto o limite fazendo s4 = a6 
JUMP_CHOOSE_LIMIT_BTTM:
	li	t0, 16					# faço t0 = 16 para utilizarmos na obtenção do limite esquerdo				
	mul	t0, t0, t5				# faço t0 = t5 (contador de largura tiles passadas) * t0
	bge	a5, t0, JUMP_CHOOSE_LIMIT_LFT		# se a5 > t0 pula para pula escolha limite esquerdo		
	mv	s5, t0					# já que a5 é < que t0 faço s5 = t0 estabelecendo o limite esquerdo
	j	END_CHOOSE_LIMIT_LFT			# pula a escolha do limite esq uma vez que já achamos o limite correto
JUMP_CHOOSE_LIMIT_LFT:
	mv	s5, a5					# já que a5 é >= t0 faço s5 = a5 estabelecendo o limite esquerdo				
END_CHOOSE_LIMIT_LFT:
	li	t0, 320					# faço t0 = 320 para utilizarmos na obtenção do limite direito
	add	a5, a5, t0				# faço a5 = a5 + t0 para utilizarmos na obtenção do limite direito
	li	t0, 16					# faço t0 = 16 para utilizarmos na obtenção do limite direito
	mul	t0, t0, t5				# faço t0 = t5 (contador de largura tiles passadas) * t0
	addi	s6, t0, 16				# faço s6 = t0 + 16 (já é uma possibilidade de limite)
	ble	s6, a5, JUMP_CHOOSE_LIMIT_RGT		# se s6 <= a5 o limite já está correto e eu pulo para a label em questão
	mv	s6, a5					# se s6 > a5 então concerto o limite fazendo s6 = a5 
JUMP_CHOOSE_LIMIT_RGT:
	sub 	t0, s6, s5				# faço t0 = s6 - s5 (calculando a diferença entre os limites de largura)
	add 	s1, s1, t0				# faço s1 = s1 + t0 incrementando a proxima posição de impressão na largura
	slti 	t0, s1, 320				# se s1 < 320 então t0 = 1 e caso contrario t0 = 0 
	bnez	t0, JUMP_INCREASE_LINE_BITMAP		# se t0 != 0 pula para incrementa linha bitmap 
	li	s1, 0					# faço s1 = 0 já que ultrapassei a qntd de largura do bitmap
	sub 	t0, s4, s3				# faço t0 = s4 - s3 (calculando a diferença entre os limites de altura)
	add 	s2, s2, t0				# faço s2 = s2 + t0 incrementando a proxima posição de impressão na altura
JUMP_INCREASE_LINE_BITMAP:
	li	t0, 16					# faço t0 = 16 que é a dimensão da tile (fixado)
	rem	s6, s6, t0				# faço s6 = s6 % t0 para limitar os numeros para o escopo de uma tile
	bnez	s6, JUMP_SETTING_LIMIT_COLUMN		# se s6 != 0 então eu terminei a setagem do limite no escopo de tile
	li	s6, 16					# se s6 == 0 e s6 é tido como limite direito s6 só pode ser 16
JUMP_SETTING_LIMIT_COLUMN:			
	rem	s5, s5, t0				# faço s5 = s5 % t0 para limitar os numeros para o escopo de uma tile
	sw	s4, 4(sp)				# guardo para restaurar o valor dele no final porque precisamos no print mapa
	rem	s4, s4, t0				# faço s4 = s4 % t0 para limitar os numeros para o escopo de uma tile
	bnez	s4, JUMP_SETTING_LIMIT_LINE		# se s4 != 0 então eu terminei a setagem do limite no escopo de tile
	li	s4, 16					# se s4 == 0 e s4 é tido como limite superior s4 só pode ser 16
JUMP_SETTING_LIMIT_LINE:
	sw	s3, 8(sp)				# guardo para restaurar o valor dele no final porque precisamos no print mapa
	rem	s3, s3, t0				# faço s3 = s3 % t0 para limitar os numeros para o escopo de uma tile
	li	a5, 0					# inicializo um contador em a5 
	li	a6, 0					# inicializo um contador em a6
LOOP_PRINT_TILE:
	blt 	a6, s3, JUMP_LINE_TILE			# se a6 < limite inferior altura então pula a impressão dessa linha
	blt 	a5, s5, JUMP_COLUMN_TILE		# se a5 < limite inferior largura então pula a impressão dessa coluna
	lw	t0,16(sp) 				# recupero o modo de utilização
	beqz	t0,JUMP_SPECIAL_PRINT
	li	t0,15
	sub	t0,t0,a5
	sub	t0,t0,a5
	add	t0,a1,t0
	lb	t0,0(t0)
	j	END_SPECIAL_PRINT
JUMP_SPECIAL_PRINT:
	lb 	t0, 0(a1)				# carrego uma word do tile em t0 (Note que carregamos 4 bytes por vez)
END_SPECIAL_PRINT:
	sb 	t0, 0(a7)				# escreve no bitmap o conteudo de t0 (4 bytes)
	addi 	a7, a7, 1				# incrementa o endereço do bitmap em 4
JUMP_COLUMN_TILE:
	addi 	a5, a5, 1				# incrementa o contador de largura em 4
	addi 	a1, a1, 1				# incrementa o endereço do tile em 4
	blt 	a5, s6, LOOP_PRINT_TILE			# se a5 < limite superior largura então volta fazendo o loop da largura
	
	#############################################################################
	# se passou por aqui é que o loop da coluna terminou e era uma linha valida #
	# então faz sentido recalcularmos o endereço do bitmap já que precisamos ir #
	# para a proxima linha para continuar printando o tile			    #
	#############################################################################
	
	li	t0, 16					# faço t0 = 16 que é a dimensão do tile (fixado)
	sub	t0, t0, s6				# faço t0 = t0 - s6 que seria a qntd que falta para imprimir da tile
	add	a1, a1, t0				# faço a1 = a1 + t0 indo para o final daquela linha da tile
	addi	a7, a7, 320				# faço a7 = a7 + 320 pulando para a proxima linha do bitmap
	sub	t0, s6, s5				# faço t0 = s6 - s5 para saber quanto eu imprimi em largura da ultima linha
	sub	a7, a7, t0				# faço a7 = a7 - t0 para colocar no lugar exato da largura da proxima linha
JUMP_LINE_TILE:
	addi 	a6, a6, 1				# incrementa o contador de altura em 1
	lw	a1, 0(sp)				# carrega o endereço inicial do tile que estava salvo na pilha em a1
	lw	a5, 0(a1)				# carrego a largura do tile (fixado) em a5 
	mul 	a5, a5, a6				# faço a5 = a5 * a6 para utilzar no calculo da proxima linha do tile
	addi 	a1, a1, 8				# faço a1 = a1 + 8 para irmos para o endereço dos pixels do tile de fato
	add 	a1, a1, a5				# faço a1 = a1 + a5 para irmos para a linha que queremos analisar em questão
	li 	a5, 0					# reinicializo o contador de largura em a5
	blt 	a6, s4, LOOP_PRINT_TILE			# se a6 < s4 então volta para a label fazendo o loop altura
	lw	s4,4(sp)
	lw	s3,8(sp)
	lw	ra,12(sp)
	addi	sp, sp, 20				# desaloca o espaço de memoria da pilha
	ret						# retorna para a função que chamou decide tile que está indicada no reg ra
