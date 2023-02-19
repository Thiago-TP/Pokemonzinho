#########################################
# 		Argumentos		#
#					#
# a0 =  end flag indicando movimento  	#
#					#
#	   não retorna nada		#
#					#
#########################################
MOVE:
	lb	t0,(a0)
	li	t1,1
	beq	t0,t1,MOVE_LFT
	li	t1,2
	beq	t0,t1,MOVE_RGT
	li	t1,3
	beq	t0,t1,MOVE_UP
	li	t1,4
	beq	t0,t1,MOVE_LOW
	ret
MOVE_LFT:
	la	t0, POSITION_MAP		# carrego o endereço da posição incial do mapa em t0
	lw 	t2, 0(t0)			# coloco o valor da largura da posição inicial em t2
	addi 	t2, t2, -1			# adiciono -4 em t2 para movermos a posição inicial do mapa 
	sw 	t2, 0(t0)			# salvo t2 no endereço da posição inicial do mapa para efetivar a mudança
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
MOVE_RGT:
	la 	t0, POSITION_MAP		# carrego o endereço da posição incial do mapa em t0
	lw 	t2, 0(t0)			# coloco o valor da largura da posição inicial em t2
	addi 	t2, t2, 1			# adiciono 4 em t2 para movermos a posição inicial do mapa 
	sw 	t2, 0(t0)			# salvo t2 no endereço da posição inicial do mapa para efetivar a mudança	
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
MOVE_UP:
	la 	t0, POSITION_MAP		# carrego o endereço da posição incial do mapa em t0
	lw 	t2, 4(t0)			# coloco o valor da altura da posição inicial em t2
	addi 	t2, t2, -1			# adiciono -4 em t2 para movermos a posição inicial do mapa 
	sw 	t2, 4(t0)			# salvo t2 no endereço da posição inicial do mapa para efetivar a mudança
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
MOVE_LOW:
	la 	t0, POSITION_MAP		# carrego o endereço da posição incial do mapa em t0	
	lw 	t2, 4(t0)			# coloco o valor da altura da posição inicial em t2
	addi 	t2, t2, 1			# adiciono 4 em t2 para movermos a posição inicial do mapa 
	sw 	t2, 4(t0)			# salvo t2 no endereço da posição inicial do mapa para efetivar a mudança
	ret