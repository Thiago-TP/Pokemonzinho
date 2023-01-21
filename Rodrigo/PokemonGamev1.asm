.data
	.include "./Sprites/tile.s"
	.include "./Sprites/char.s"
	.include "./Sprites/tile_grass1.s"
	.include "./Sprites/tile_grass2.s"
	.include "./Sprites/tile_grass3.s"
	.include "./Sprites/tile_grass4.s"

MAPATEST: .word 30,40 # 640/16; 480/16
.byte	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,
	0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,
	0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,
	0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,
	0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,
	0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,
	0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,
	0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,
	0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,
	0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,0,0,4,3,4,3,0,0,0,0,1,2,1,2,1,2,1,2,0,0,
	0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,0,0,1,2,1,2,0,0,0,0,3,4,3,4,3,4,3,4,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 
POSICAO_INICIAL_P: .word 0,0

POSICAO_INICIAL_MAPEAMENTO_FR0: .word -1,-1

POSICAO_INICIAL_MAPEAMENTO_FR1: .word -1,-1

.text

################################################################################################
# Registradores comprometidos apos uma impressão de mapa = Todos menos os salvos de (s7 a s11) #
################################################################################################

#########################################
# 					#
#					#
#	Não recebe nada como arg	#
#	e  não retorna nada		#
#					#
#########################################
GAME_LOOP:
	xori 	s0, s0, 1				# inverte o valor frame atual (somente o registrador)
	call	KEY_POOL				# chama a função keypool para ver se alguma das teclas a,s,d,w foram
							# clicadas e se não retorna para o gameloop sem mudar posicao inicial p
	la 	a0, MAPATEST 				# a0 endereço do mapa que iremos utilizar para essa fase
	la 	t0, POSICAO_INICIAL_P			# carrego em t0 o endereço de posicao inicial p
	lw 	t1, 0(t0) 				# carrega em t1 a altura da posicao inicial p
	lw 	t2, 4(t0) 				# carrega em t2 a largura da posicao inicial p
	bnez	s0,PULA_MAPEAMENTO_FR0_3		# verifica se s0 é diferente de zero para saber qual frame utilizar
	la	t3, POSICAO_INICIAL_MAPEAMENTO_FR0	# se s0 for == 0 carrega em t3 a posicao incial relativa ao frame 0
	j	FIM_ESCOLHE_MAPEAMENTO_3		# pula as escolhas de frame uma vez que já achamos a posição correta
PULA_MAPEAMENTO_FR0_3:	
	la	t3, POSICAO_INICIAL_MAPEAMENTO_FR1	# se s0 for != 0 carrega em t3 a posicao incial relativa ao frame 1
FIM_ESCOLHE_MAPEAMENTO_3:
	lw	t4, 0(t3)				# carrega em t4 a altura da posicao relativa ao frame que colocamos em t3
	lw	t5, 4(t3)				# carrega em t5 a largura da posicao relativa ao frame que colocamos em t3
	bne	t1, t4, PULA_VERIFICA_ALTURA_LARGURA	# condição feita para printarmos os mapas somente quando a posicao muda
	bne	t2, t5, PULA_VERIFICA_ALTURA_LARGURA	# condição feita para printarmos os mapas somente quando a posicao muda
	j	PULA_PRINT_MAPA				# como t1 == t4 e t2 == t5 não printamos o mapa e continuamos o fluxo
PULA_VERIFICA_ALTURA_LARGURA:
	sw	t1, 0(t3)				# se t1 != t4 ou t2 != t5 salvamos em t3 que é o frame escolhido a altura 
	sw	t2, 4(t3)				# se t1 != t4 ou t2 != t5 salvamos em t3 que é o frame escolhido a largura 
	mv 	a4, s0					# movo para a4 o valor em s0 que é relativo ao frame da posicao t3
	call 	PRINT_MAPA				# chamo a função print mapa com o frame em a4 como argumento essa função
							# imprime o mapa 640 x 480 no bitmap 320 x 240 lidando com os possiveis
							# valores quebrados das tiles onde devemos printar uma parte de cada uma
PULA_PRINT_MAPA:

	############################################################
	# a minha ideia é que a primeira coisa que devemos fazer é #
	# imprimir o mapa se ele tiver se movido do local anterior #
	############################################################
	
	li 	t0, 0xFF200604				# carrego em t0 o endereco de controle do frame mostrado no bitmap
	sw 	s0, 0(t0)				# coloco s0 no valor de controle da frame mostrada pelo bitmap
	j GAME_LOOP					# volta para o inicio do programa para fazer o loop principal do jogo	
	
#########################################
# 		Argumentos		#
#					#
# a0 = mapeamento do mapa em questão	#
# a4 = frame que vamos operar		#
#					#
#	   não retorna nada		#
#					#
#########################################

#########################################################################
# 				  ATENÇÃO				#
#########################################################################
# uma nova feature planejavel é imprimir preto quando os limites do	#
# do mapa forem atingidos tanto de maneira negativa quanto de 		#
# maneira positiva (Ainda pensando em algo)				#
#########################################################################

PRINT_MAPA:
	addi 	sp, sp, -8				# aloca 8 espacos de memoria na pilha
	sw 	ra, 0(sp)				# salva ra na pilha
	sw	a0, 4(sp)				# sal a0 que é relativo ao mapeamento do mapa na pilha
	bnez	a4, PULA_MAPEAMENTO_FR0_2		# verifica se a4 é diferente de zero para saber qual frame utilizar
	la 	t0, POSICAO_INICIAL_MAPEAMENTO_FR0	# se a4 for == 0 carrega em t0 a posicao incial relativa ao frame 0
	j	FIM_ESCOLHE_MAPEAMENTO_2		# pula as escolhas de frame uma vez que já achamos a posição correta
PULA_MAPEAMENTO_FR0_2:
	la 	t0, POSICAO_INICIAL_MAPEAMENTO_FR1	# se a4 for != 0 carrega em t0 a posicao incial relativa ao frame 1
FIM_ESCOLHE_MAPEAMENTO_2:
	lw	t1, 0(t0) 				# carrega em t1 a altura da posicao relativa ao frame que colocamos em t0
	lw	t2, 4(t0) 				# carrega em t2 a largura da posicao relativa ao frame que colocamos em t0
	lw	t3, 0(a0) 				# carrega em t3 a altura do mapeamento do mapa que colocamos em a0
	lw	t4, 4(a0) 				# carrega em t4 a largura do mapeamento do mapa que colocamos em a0
	li	t5, 0					# inicializa em t5 o contador de tiles passados horizontalmente 
	li	t6, 0					# inicializa em t6 o contador de tiles passados verticalmente
	addi	a0, a0, 8				# faço a0 = a0 + 8 para irmos para o endereço relativo de fato ao mapeamento
	li	s1, 0					# inicializa em s1 a largura (0) utilizada para printarmos as tiles no bitmap
	li	s2, 0					# inicializa em s2 a altura (0) utilizada para printarmos as tiles no bitmap
LOOP_PRINT_MAPA:
	
	###################################################################################
	#     				faltando implementação 				  #
	###################################################################################
	# faço uma condição para verificar se já chegamos no final do bitmap == 320 e 240 #
	###################################################################################
	
	li	a7, 16					# carrega em a7 o valor de altura de uma tile (fixado)
	mul	t0, t6, a7				# faço t0 = t6 (Contador de altura de tiles passados) * a7 
	addi	t0, t0, 16				# faço t0 = t0 + 16 para sabermos se essa tile tem interseção com o mapa
	slt	a6, t0, t1				# a6 = 1 se t0 (que é a altura incial do tile + limite) for menor que t1 
							# ( que é a altura inicial do mapa) e a6 = 0 caso contario
	bnez	a6, PULA_LINHA_MAPA			# se a6 != 0 pula essa linha do mapeamento de tiles 
	addi	t0, t1, 240				# faço t0 = t1 + 240 para sabermos se essa tile tem interseção com o mapa
	mul	a7, t6, a7				# faço a7 = t6 (Contador de altura de tiles passados) * a7  
	slt	a6, t0, a7				# a6 = 1 se t0 (que é a altura incial do mapa + limite) for menor que a7 
							# ( que é a altura inicial do tile) e a6 = 0 caso contario  
	bnez	a6, PULA_LINHA_MAPA			# se a6 != 0 pula essa linha do mapeamento de tiles 
	li	a7, 16					# carrega em a7 o valor de altura de uma tile (fixado)
	mul	t0, t5, a7				# faço t0 = t5 (Contador de largura de tiles passados) * a7 
	addi	t0, t0, 16				# faço t0 = t0 + 16 para sabermos se essa tile tem interseção com o mapa
	slt	a6, t0, t2				# a6 = 1 se t0 (que é a largura incial do tile + limite) for menor que t2 
							# ( que é a largura inicial do mapa) e a6 = 0 caso contario
	bnez	a6, PULA_COLUNA_MAPA			# se a6 != 0 pula essa coluna do mapeamento de tiles
	addi	t0, t2, 320				# faço t0 = t2 + 320 para sabermos se essa tile tem interseção com o mapa
	mul	a7, t5, a7				# faço a7 = t5 (Contador de largura de tiles passados) * a7 
	slt	a6, t0, a7				# a6 = 1 se t0 (que é a largura incial do mapa + limite) for menor que a7 
							# ( que é a largura inicial do tile) e a6 = 0 caso contario  
	bnez	a6, PULA_COLUNA_MAPA			# se a6 != 0 pula essa coluna do mapeamento de tiles
	jal	ra, DECIDE_TILE				# se tiver interseção com o tile chama a função decide tile que retorna em a1
	mv	a2, s1					# faço a2 = s1 para colocarmos a largura como argumento para a função tile
	mv	a3, s2					# faço a3 = s2 para colocarmos a altura como argumento para a função tile
	jal	ra, TILE				# chamo a função tile que é encarregada de printar no bitmap o tile
PULA_COLUNA_MAPA:
	addi	t5, t5, 1				# faço t5 = t5 + 1 para incrementar a quantidade da largura de tiles passadas
	addi	a0, a0, 1				# faço a0 = a0 + 1 para irmos para o mapeamento da proxima tile
	blt	t5, t4, LOOP_PRINT_MAPA			# se t5 < t4 ele volta para a label fazendo assim um loop na largura
PULA_LINHA_MAPA:
	lw	a0, 4(sp)				# carrego em a0 o endereço inicial do mapeamento que salvamos na pilha
	addi	t6, t6, 1				# faço t6 = t6 + 1 para incrementar a quantidade da altura de tiles passadas
	li	t5, 0					# reinicializo a contagem da largura de tiles passadas para a nova linha
	mul	t0, t6, t4				# faço t0 = t6 (contador de altura tiles passadas) * t4 (largura mapeamento)
	addi	a0, a0, 8				# faço a0 = a0 + 8 para irmos para o endereço relativo de fato ao mapeamento
	add	a0, a0, t0				# faço a0 = a0 + t0 adicionando assim em a0 o valor das tiles ja percorridas
	blt	t6, t3, LOOP_PRINT_MAPA			# se t6 < t3 ele volta para a label fazendo assim um loop na altura
	lw 	ra, 0(sp)				# carrego em ra o valor de retorno da função que salvamos na pilha 
	addi 	sp, sp, 8				# libera espaco da pilha
	ret						# retorna para a função que chamou print mapa que está indicada no reg ra

#########################################
# 		Argumentos		#
#					#
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
	addi	sp, sp, -4				# aloca 4 espaços de memoria
	sw	a1, 0(sp)				# salva o endereço inicial do tile 
	addi	a1, a1, 8				# incrementa a1 em 8 para obetermos os endereços dos pixels
	li 	a7, 0xFF0				# coloca em a7 o numero base do calculo do bitmap
	add 	a7, a7, a4 				# faz a7 = a7 + a4 
	slli 	a7, a7, 20				# desloca os bites para esquerda vintes vezes
	add 	a7, a7, a2 				# adiciona a largura do ponto incial de impressão			
	li 	t0, 320 				# faz t0 = t0 + 320 para utilizar no calculo da altura
	mul 	t0, t0, a3				# faz t0 = t0 * a3 para calcular a altura incial de impressão
	add 	a7, a7, t0				# adiciona a altura incial de impressão
	bnez	a4, PULA_MAPEAMENTO_FR0_1		# verifica se a4 é diferente de zero para saber qual frame utilizar
	la 	t0, POSICAO_INICIAL_MAPEAMENTO_FR0	# se a4 for == 0 carrega em t0 a posicao incial relativa ao frame 0
	j	FIM_ESCOLHE_MAPEAMENTO_1		# pula as escolhas de frame uma vez que já achamos a posição correta
PULA_MAPEAMENTO_FR0_1:
	la 	t0, POSICAO_INICIAL_MAPEAMENTO_FR1	# se a4 for != 0 carrega em t0 a posicao incial relativa ao frame 1
FIM_ESCOLHE_MAPEAMENTO_1:
	lw 	a6, 0(t0)				# carrega em a6 a altura da posicao relativa ao frame que colocamos em t0
	lw	a5, 4(t0)				# carrega em a5 a largura da posicao relativa ao frame que colocamos em t0
	li	t0, 16					# faço t0 = 16 para utilizarmos na obtenção do limite superior
	mul	t0, t0, t6				# faço t0 = t6 (contador de altura tiles passadas) * t0
	bge	a6, t0, PULA_ESCOLHA_LIMITE_SUP		# se a6 > t0 pula para pula escolha limite superior
	mv	s3, t0					# já que a6 é < que t0 faço s3 = t0 estabelecendo o limite superior
	j	FIM__ESCOLHA_LIMITE_SUP			# pula a escolha do limite sup uma vez que já achamos o limite correto
PULA_ESCOLHA_LIMITE_SUP:
	mv	s3, a6					# já que a6 é >= t0 faço s3 = a6 estabelecendo o limite superior
FIM__ESCOLHA_LIMITE_SUP:
	li	t0, 240					# faço t0 = 240 para utilizarmos na obtenção do limite inferior
	add	a6, a6, t0				# faço a6 = a6 + t0 para utilizarmos na obtenção do limite inferior
	li	t0, 16					# faço t0 = 16 para utilizarmos na obtenção do limite inferior
	mul	t0, t0, t6				# faço t0 = t6 (contador de altura tiles passadas) * t0
	addi	s4, t0, 16				# faço s4 = t0 + 16 (já é uma possibilidade de limite)
	ble	s4, a6, PULA_ESCOLHA_LIMITE_INF		# se s4 <= a6 o limite já está correto e eu pulo para a label em questão
	mv	s4, a6					# se s4 > a6 então concerto o limite fazendo s4 = a6 
PULA_ESCOLHA_LIMITE_INF:
	li	t0, 16					# faço t0 = 16 para utilizarmos na obtenção do limite esquerdo				
	mul	t0, t0, t5				# faço t0 = t5 (contador de largura tiles passadas) * t0
	bge	a5, t0, PULA_ESCOLHA_LIMITE_ESQ		# se a5 > t0 pula para pula escolha limite esquerdo		
	mv	s5, t0					# já que a5 é < que t0 faço s5 = t0 estabelecendo o limite esquerdo
	j	FIM__ESCOLHA_LIMITE_ESQ			# pula a escolha do limite esq uma vez que já achamos o limite correto
PULA_ESCOLHA_LIMITE_ESQ:
	mv	s5, a5					# já que a5 é >= t0 faço s5 = a5 estabelecendo o limite esquerdo				
FIM__ESCOLHA_LIMITE_ESQ:
	li	t0, 320					# faço t0 = 320 para utilizarmos na obtenção do limite direito
	add	a5, a5, t0				# faço a5 = a5 + t0 para utilizarmos na obtenção do limite direito
	li	t0, 16					# faço t0 = 16 para utilizarmos na obtenção do limite direito
	mul	t0, t0, t5				# faço t0 = t5 (contador de largura tiles passadas) * t0
	addi	s6, t0, 16				# faço s6 = t0 + 16 (já é uma possibilidade de limite)
	ble	s6, a5, PULA_ESCOLHA_LIMITE_DIR		# se s6 <= a5 o limite já está correto e eu pulo para a label em questão
	mv	s6, a5					# se s6 > a5 então concerto o limite fazendo s6 = a5 
PULA_ESCOLHA_LIMITE_DIR:
	sub 	t0, s6, s5				# faço t0 = s6 - s5 (calculando a diferença entre os limites de largura)
	add 	s1, s1, t0				# faço s1 = s1 + t0 incrementando a proxima posição de impressão na largura
	slti 	t0, s1, 320				# se s1 < 320 então t0 = 1 e caso contrario t0 = 0 
	bnez	t0, PULA_INCREMENTA_LINHA_BITMAP	# se t0 != 0 pula para incrementa linha bitmap 
	li	s1, 0					# faço s1 = 0 já que ultrapassei a qntd de largura do bitmap
	sub 	t0, s4, s3				# faço t0 = s4 - s3 (calculando a diferença entre os limites de altura)
	add 	s2, s2, t0				# faço s2 = s2 + t0 incrementando a proxima posição de impressão na altura
PULA_INCREMENTA_LINHA_BITMAP:
	li	t0, 16					# faço t0 = 16 que é a dimensão da tile (fixado)
	rem	s6, s6, t0				# faço s6 = s6 % t0 para limitar os numeros para o escopo de uma tile
	bnez	s6, PULA_SETA_LIMITE_COLUNA		# se s6 != 0 então eu terminei a setagem do limite no escopo de tile
	li	s6, 16					# se s6 == 0 e s6 é tido como limite direito s6 só pode ser 16
PULA_SETA_LIMITE_COLUNA:			
	rem	s5, s5, t0				# faço s5 = s5 % t0 para limitar os numeros para o escopo de uma tile
	rem	s4, s4, t0				# faço s4 = s4 % t0 para limitar os numeros para o escopo de uma tile
	bnez	s4, PULA_SETA_LIMITE_LINHA		# se s4 != 0 então eu terminei a setagem do limite no escopo de tile
	li	s4, 16					# se s4 == 0 e s4 é tido como limite superior s4 só pode ser 16
PULA_SETA_LIMITE_LINHA:
	rem	s3, s3, t0				# faço s3 = s3 % t0 para limitar os numeros para o escopo de uma tile
	li	a5, 0					# inicializo um contador em a5 
	li	a6, 0					# inicializo um contador em a6
LOOP_IMPRIME_TILE:
	blt 	a6, s3, PULA_LINHA_TILE			# se a6 < limite inferior altura então pula a impressão dessa linha
	blt 	a5, s5, PULA_COLUNA_TILE		# se a5 < limite inferior largura então pula a impressão dessa coluna
	lw 	t0, 0(a1)				# carrego uma word do tile em t0 (Note que carregamos 4 bytes por vez)
	sw 	t0, 0(a7)				# escreve no bitmap o conteudo de t0 (4 bytes)
	addi 	a7, a7, 4				# incrementa o endereço do bitmap em 4
PULA_COLUNA_TILE:
	addi 	a5, a5, 4				# incrementa o contador de largura em 4
	addi 	a1, a1, 4				# incrementa o endereço do tile em 4
	blt 	a5, s6, LOOP_IMPRIME_TILE		# se a5 < limite superior largura então volta fazendo o loop da largura
	
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
PULA_LINHA_TILE:
	addi 	a6, a6, 1				# incrementa o contador de altura em 1
	lw	a1, 0(sp)				# carrega o endereço inicial do tile que estava salvo na pilha em a1
	lw	a5, 4(a1)				# carrego a largura do tile (fixado) em a5 
	mul 	a5, a5, a6				# faço a5 = a5 * a6 para utilzar no calculo da proxima linha do tile
	addi 	a1, a1, 8				# faço a1 = a1 + 8 para irmos para o endereço dos pixels do tile de fato
	add 	a1, a1, a5				# faço a1 = a1 + a5 para irmos para a linha que queremos analisar em questão
	li 	a5, 0					# reinicializo o contador de largura em a5
	blt 	a6, s4, LOOP_IMPRIME_TILE		# se a6 < s4 então volta para a label fazendo o loop altura
	addi	sp, sp, 4				# desaloca o espaço de memoria da pilha
	ret						# retorna para a função que chamou decide tile que está indicada no reg ra

#########################################
# 		Argumentos		#
#					#
# a0 = mapeamento do tile		#
#					#
#	   	Retorno			#
#					#
# a1 = endereço da tile do mapeamento	#
#					#
#########################################
DECIDE_TILE:
	lb 	t0, 0(a0)				# carrego em t0 o valor do endereço em a0
	bne 	t0, zero, PULA_TILE0			# se t0 != 0 pula para a label pula tile 0
	la 	a1, tile				# carrega em a1 o tile correto para retornar da função como argumento
	j 	FIM_DECIDE_TILE				# pula as escolhas de tile uma vez que já achamos a tile correta
PULA_TILE0:
	li 	a6, 1					# faz a6 = 1 para compararmos com o valor em t0
	bne 	t0, a5, PULA_TILE1			# se t0 != a6 pula para a label pula tile 1
	la 	a1, tile_grass1				# carrega em a1 o tile correto para retornar da função como argumento
	j 	FIM_DECIDE_TILE				# pula as escolhas de tile uma vez que já achamos a tile correta
PULA_TILE1:
	li 	a6, 2					# faz a6 = 2 para compararmos com o valor em t0
	bne 	t0, a5, PULA_TILE2			# se t0 != a6 pula para a label pula tile 2
	la 	a1, tile_grass2				# carrega em a1 o tile correto para retornar da função como argumento
	j 	FIM_DECIDE_TILE				# pula as escolhas de tile uma vez que já achamos a tile correta
PULA_TILE2:
	li 	a6, 3					# faz a6 = 3 para compararmos com o valor em t0
	bne 	t0, a5, PULA_TILE3			# se t0 != a6 pula para a label pula tile 3
	la 	a1, tile_grass3				# carrega em a1 o tile correto para retornar da função como argumento
	j 	FIM_DECIDE_TILE				# pula as escolhas de tile uma vez que já achamos a tile correta
PULA_TILE3:
	la 	a1, tile_grass4				# carrega em a1 o tile correto para retornar da função como argumento
							# a ideia aqui é se nenhuma das condições que foram avaliadas
							# anteriormente deu certo então só nos sobra essa ultima opção para a tile
FIM_DECIDE_TILE:
	ret						# retorna para a função que chamou decide tile que está indicada no reg ra

#########################################
# 					#
#					#
#	Não recebe nada como arg	#
#	e  não retorna nada		#
#					#
#########################################
KEY_POOL:	
	li 	t1, 0xFF200000			# carrega o endereco de controle do KDMMIO em t1
	lw 	t0, 0(t1)			# Le bit de Controle Teclado
	andi 	t0, t0, 0x0001			# mascara o bit menos significativo
   	beq 	t0, zero, FIM_CHAR 	   	# Se nao ha tecla pressionada entao vai para FIM
  	lw 	t2, 4(t1)  			# le o valor da tecla tecla
	li 	t0, 'w'				# carrega em to o valor do char 'w'
	beq 	t2, t0, CHAR_CIMA		# se tecla pressionada for 'w', chama CHAR_CIMA	
	li 	t0, 'a'				# carrega em to o valor do char 'a'
	beq 	t2, t0, CHAR_ESQ		# se tecla pressionada for 'a', chama CHAR_CIMA
	li 	t0, 's'				# carrega em to o valor do char 's'
	beq 	t2, t0, CHAR_BAIXO		# se tecla pressionada for 's', chama CHAR_CIMA
	li 	t0, 'd'				# carrega em to o valor do char 'd'
	beq 	t2, t0, CHAR_DIR		# se tecla pressionada for 'd', chama CHAR_CIMA
FIM_CHAR:	
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
CHAR_ESQ:
	la	t0, POSICAO_INICIAL_P		# carrego o endereço da posição incial do mapa em t0
	lw 	t2, 4(t0)			# coloco o valor da largura da posição inicial em t2
	addi 	t2, t2, -4			# adiciono -4 em t2 para movermos a posição inicial do mapa 
	sw 	t2, 4(t0)			# salvo t2 no endereço da posição inicial do mapa para efetivar a mudança
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
CHAR_DIR:
	la 	t0, POSICAO_INICIAL_P		# carrego o endereço da posição incial do mapa em t0
	lw 	t2, 4(t0)			# coloco o valor da largura da posição inicial em t2
	addi 	t2, t2, 4			# adiciono 4 em t2 para movermos a posição inicial do mapa 
	sw 	t2, 4(t0)			# salvo t2 no endereço da posição inicial do mapa para efetivar a mudança
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
CHAR_CIMA:
	la 	t0, POSICAO_INICIAL_P		# carrego o endereço da posição incial do mapa em t0
	lw 	t2, 0(t0)			# coloco o valor da altura da posição inicial em t2
	addi 	t2, t2, -4			# adiciono -4 em t2 para movermos a posição inicial do mapa 
	sw 	t2, 0(t0)			# salvo t2 no endereço da posição inicial do mapa para efetivar a mudança
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
CHAR_BAIXO:
	la 	t0, POSICAO_INICIAL_P		# carrego o endereço da posição incial do mapa em t0	
	lw 	t2, 0(t0)			# coloco o valor da altura da posição inicial em t2
	addi 	t2, t2, 4			# adiciono 4 em t2 para movermos a posição inicial do mapa 
	sw 	t2, 0(t0)			# salvo t2 no endereço da posição inicial do mapa para efetivar a mudança
	ret					# retorna para a função que chamou key pool que está indicada no reg ra