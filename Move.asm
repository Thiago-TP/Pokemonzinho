#########################################
# 		Argumentos		#
#					#
# a0 =  end flag indicando movimento  	#
#					#
#	   não retorna nada		#
#					#
#########################################
MOVE:
	la	t0,TIMER_HERO
	csrr	t1,time
	sw	t1,0(t0)
	la	t3,INFO_HERO
	lb	t0,(a0)
	li	t1,1
	beq	t0,t1,MOVE_LFT
	li	t1,2
	beq	t0,t1,MOVE_RGT
	li	t1,3
	beq	t0,t1,MOVE_UP
	li	t1,4
	beq	t0,t1,MOVE_LOW
MOVE_LFT:
	la	t0, POSITION_MAP		# carrego o endereço da posição incial do mapa em t0
	lw 	t2, 0(t0)			# coloco o valor da largura da posição inicial em t2
	addi 	t2, t2, -1			# adiciono -4 em t2 para movermos a posição inicial do mapa 
	sw 	t2, 0(t0)			# salvo t2 no endereço da posição inicial do mapa para efetivar a mudança
	lb	t4, 0(t3)
	li	t1,1
	beq	t4,t1,JUMP_CHANGE_DIR_LFT
	sb	t1,0(t3)
	sb	zero,1(t3)
	li	s7,0
JUMP_CHANGE_DIR_LFT:
	li	t4,8
	rem	t4,s7,t4
	addi	s7,s7,1
	bnez	t4,JUMP_LFT
	lb	t4,1(t3)
	addi	t4,t4,1
	sb	t4,1(t3)
JUMP_LFT:
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
MOVE_RGT:
	la 	t0, POSITION_MAP		# carrego o endereço da posição incial do mapa em t0
	lw 	t2, 0(t0)			# coloco o valor da largura da posição inicial em t2
	addi 	t2, t2, 1			# adiciono 4 em t2 para movermos a posição inicial do mapa 
	sw 	t2, 0(t0)			# salvo t2 no endereço da posição inicial do mapa para efetivar a mudança	
	lb	t4, 0(t3)
	li	t1,2
	beq	t4,t1,JUMP_CHANGE_DIR_RGT
	sb	zero,1(t3)
	sb	t1, 0(t3)
	li	s7,0
JUMP_CHANGE_DIR_RGT:
	li	t4,8
	rem	t4,s7,t4
	addi	s7,s7,1
	bnez	t4,JUMP_RGT
	lb	t4,1(t3)
	addi	t4,t4,1
	sb	t4,1(t3)
JUMP_RGT:
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
MOVE_UP:
	la 	t0, POSITION_MAP		# carrego o endereço da posição incial do mapa em t0
	lw 	t2, 4(t0)			# coloco o valor da altura da posição inicial em t2
	addi 	t2, t2, -1			# adiciono -4 em t2 para movermos a posição inicial do mapa 
	sw 	t2, 4(t0)			# salvo t2 no endereço da posição inicial do mapa para efetivar a mudança
	lb	t4, 0(t3)
	li	t1,3
	beq	t4,t1,JUMP_CHANGE_DIR_UP
	sb	t1,0(t3)
	sb	zero,1(t3)
	li	s7,0
JUMP_CHANGE_DIR_UP:
	li	t4,8
	rem	t4,s7,t4
	addi	s7,s7,1
	bnez	t4,JUMP_UP
	lb	t4,1(t3)
	addi	t4,t4,1
	sb	t4,1(t3)
JUMP_UP:
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
MOVE_LOW:
	la 	t0, POSITION_MAP		# carrego o endereço da posição incial do mapa em t0	
	lw 	t2, 4(t0)			# coloco o valor da altura da posição inicial em t2
	addi 	t2, t2, 1			# adiciono 4 em t2 para movermos a posição inicial do mapa 
	sw 	t2, 4(t0)			# salvo t2 no endereço da posição inicial do mapa para efetivar a mudança
	lb	t4, 0(t3)
	li	t1,4
	beq	t4,t1,JUMP_CHANGE_DIR_LOW
	sb	t1,0(t3)
	sb	zero,1(t3)
	li	s7,0
JUMP_CHANGE_DIR_LOW:
	li	t4,8
	rem	t4,s7,t4
	addi	s7,s7,1
	bnez	t4,JUMP_LOW
	lb	t4,1(t3)
	addi	t4,t4,1
	sb	t4,1(t3)
JUMP_LOW:
	ret
