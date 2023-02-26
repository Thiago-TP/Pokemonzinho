#########################################
# 					#
#					#
#	Não recebe nada como arg	#
#	e  não retorna nada		#
#					#
#########################################
SETTING_EFFECTS:
	la	t6,BIG_ROUTE01
	la	t0,POSITION_MAP
	lw	t1,0(t0)
	lw	t2,4(t0)
	addi	t1,t1,144
	la	t0,MOVEMENT
	li	t3,2
	lb	t5,0(t0)
	bne	t5,t3,JUMP_LIMIT_H
	addi	t1,t1,16
JUMP_LIMIT_H:
	addi	t2,t2,112
	li	t3,4
	bne	t5,t3,JUMP_LIMIT_V
	addi	t2,t2,16
JUMP_LIMIT_V:
	li	t3,16
	lw	t5,0(t6)
	addi	t6,t6,8
	div	t4,t1,t3
	add	t0,t6,t4
	div	t4,t2,t3
	mul	t4,t4,t5
	add	t0,t0,t4
	li	t3,16
	div	t2,t2,t3
	mul	t2,t2,t3
	div	t1,t1,t3
	mul	t1,t1,t3
	lb	t4,0(t0)
	
	#################################################################
	# fazer a mesma comparação para qualquer tile que tenha efeito  #
	li	t3,16						      	#
	#################################################################
	
	beq	t4,t3,BEGIN_EFFECT_GRAMA
	li	t3,26
	blt	t4,t3,JUMP_SET_EFFECT
	li	t3,31
	ble	t4,t3,BEGIN_EFFECT_JUMP
	li	t3,58
	blt	t4,t3,JUMP_SET_EFFECT
	li	t3,59
	ble	t4,t3,BEGIN_EFFECT_JUMP
	j	JUMP_SET_EFFECT
BEGIN_EFFECT_JUMP:
	li	a1,1
	j	BEGIN_SET_EFFECT
BEGIN_EFFECT_GRAMA:
	mv	a1,zero
BEGIN_SET_EFFECT:	
	la	t0,INFO_EFFECT1
	lb	t4,0(t0)
	bnez	t4,JUMP_SET_FIRST_EFFECT
	lw	t4,4(t0)
	lw	t5,8(t0)
	la	t6,INFO_EFFECT2
	lw	t3,4(t6)
	bne	t3,t1,END_CHOOSE_SET_EFFECT
	lw	t4,8(t6)
	bne	t4,t2,END_CHOOSE_SET_EFFECT
	j	JUMP_SET_EFFECT
JUMP_SET_FIRST_EFFECT:
	la	t0,INFO_EFFECT2
	lw	t4,0(t0)
	bnez	t4,JUMP_SET_EFFECT
	lw	t4,4(t0)
	lw	t5,8(t0)
	la	t6,INFO_EFFECT1
	lw	t3,4(t6)
	bne	t3,t1,END_CHOOSE_SET_EFFECT
	lw	t4,8(t6)
	bne	t4,t2,END_CHOOSE_SET_EFFECT
	j	JUMP_SET_EFFECT
END_CHOOSE_SET_EFFECT:

############ esse trecho de código so leva em consideração a grama ######
#	csrr	t3,time							#
#	li	t4,100							#
#	rem	t3,t3,t4						#
#	li	t4,5							#
#	bgt	t3,t4,JUMP_BATTLE					#
#	sw	zero,0(t0)						#
#	sw	zero,4(t0)	# seto a largura			#
#	sw	zero,8(t0)	# seto a altura				#
#	la	t0,SETTING_BATTLE_ANIMATION				#
#	li	t1,1							#
#	sb	t1,0(t0)						#
#	j	JUMP_EFFECT						#
#JUMP_BATTLE:								#
#########################################################################

	li	t3,1
	sb	t3,0(t0)	# seto o bit de efeito para um
	sb	t3,1(t0)	# pose do efeito
	sb	zero,2(t0)	# qntd de frames que ficaram na pose
	# Essa linha vai variar com o tipo de efeito escolhido 	#
	sb	a1,3(t0)	# tipo de efeito		#
	#########################################################
	sw	t1,4(t0)	# seto a largur
	sw	t2,8(t0)	# seto a altura
JUMP_SET_EFFECT:
	ret


#########################################
# 					#
#					#
# a4 = frame que vamos operar		#
#					#
#	não retorna nada		#
#					#
#########################################
PRINT_EFFECTS_AND_HERO:
	addi	sp,sp,-4
	sw	ra,0(sp)
	la	t0,INFO_EFFECT1
	la	t1,INFO_EFFECT2
	lb	t2,0(t0)
	bnez	t2,JUMP_FIRST_PRINT
	li	a1,-1	# indicando que não existe efeito para se imprimir
JUMP_FIRST_PRINT:
	lb	t3,0(t1)
	bnez	t3,JUMP_SECOND_PRINT
	li	a2,-1	# indicando que não existe efeito para se imprimir
JUMP_SECOND_PRINT:
	lw	t4,8(t1)
	lw	t5,8(t0)
	la	t2,POSITION_MAP
	lw	t6,4(t2)
	addi	t6,t6,112
	bge	t5,t6,JUMP_FIRST_EFFECT_LOW
	mv	a1,zero
	j	END_CHOOSE_ORDER_FIRST_EFFECT
JUMP_FIRST_EFFECT_LOW:
	lb	t5,1(t0)
	li	t2,1
	bne	t5,t2,JUMP_FIRST_POSE_EFFECT_1
	mv	a1,zero
	j	END_CHOOSE_ORDER_FIRST_EFFECT
JUMP_FIRST_POSE_EFFECT_1:
	li	a1,1
END_CHOOSE_ORDER_FIRST_EFFECT:
	bge	t4,t6,JUMP_SECOND_EFFECT_LOW
	mv	a2,zero
	j	END_CHOOSE_ORDER_SECOND_EFFECT
JUMP_SECOND_EFFECT_LOW:
	lb	t5,1(t1)
	li	t2,1
	bne	t5,t2,JUMP_FIRST_POSE_EFFECT_2
	mv	a2,zero
	j	END_CHOOSE_ORDER_SECOND_EFFECT
JUMP_FIRST_POSE_EFFECT_2:
	li	a2,1
END_CHOOSE_ORDER_SECOND_EFFECT:
	li	a0,2
	mv	a3,zero
	jal	ra,BEGIN_LOOP_EFFECT
	mv	s6,a1
	mv	s5,a2
	li	a1,144
	li	a2,108
	jal	ra,PRINT_HERO
	li	a0,2
	li	a3,1
	mv	a1,s6
	mv	a2,s5
	jal	ra,BEGIN_LOOP_EFFECT
	lw	ra,0(sp)
	addi	sp,sp,4
	ret	
	
#########################################
# 					#
#					#
# a0 = qntd de interaçoes do loop	#
# a1 = valor booleano indicando se 	#
# o efeito 1 está na frente do heroi	#
# a2 = valor booleano indicando se 	#
# o efeito 2 está na frente do heroi	#
# a3 = indicando o que vamos procurar	#
# para imprimir (os maiores ou menores)	#
# a4 = frame que vamos operar		#
#					#
#	e  não retorna nada		#
#					#
#########################################
BEGIN_LOOP_EFFECT:
	mv	a6,a0
LOOP_EFFECT:
	li	t0,2
	bne	a6,t0,JUMP_FIRST_EFFECT
	bltz	a1,JUMP_EFFECT
	bne	a3,a1,JUMP_EFFECT
	la	t0,INFO_EFFECT1
	lb	t2,0(t0)
	beqz	t2,JUMP_EFFECT
	j	END_CHOOSE_EFFECT
JUMP_FIRST_EFFECT:
	bltz	a2,JUMP_EFFECT
	bne	a3,a2,JUMP_EFFECT
	la	t0,INFO_EFFECT2
	lb	t2,0(t0)
	beqz	t2,JUMP_EFFECT
END_CHOOSE_EFFECT:
	
	
	
#########################################################################
##			Codigo de teste					##
	
	lb	t2,3(t0)	
	bnez	t2,JUMP_CHOOSE_EFFECT_GRASS
	lb	t1,1(t0)
	li	t3,1
	bne	t1,t3,JUMP_EFFECT_GRASS1
	la	a0,TallGrassAnimated5
	j	JUMP_CHOOSE_EFFECT
JUMP_EFFECT_GRASS1:
	li	t3,2
	bne	t1,t3,JUMP_EFFECT_GRASS2
	la	a0,TallGrassAnimated4
	j	JUMP_CHOOSE_EFFECT
JUMP_EFFECT_GRASS2:
	li	t3,3
	bne	t1,t3,JUMP_EFFECT_GRASS3
	la	a0,TallGrassAnimated3
	j	JUMP_CHOOSE_EFFECT
JUMP_EFFECT_GRASS3:
	li	t3,4
	bne	t1,t3,JUMP_EFFECT_GRASS4
	la	a0,TallGrassAnimated2
	j	JUMP_CHOOSE_EFFECT
JUMP_EFFECT_GRASS4:
	la	a0,TallGrassAnimated1
	lw	t6,4(t0)
	lw	t2,8(t0)
	la	t3,POSITION_MAP
	lw	t4,0(t3)
	lw	t5,4(t3)
	addi	t4,t4,144
	addi	t5,t5,112
	bne	t6,t4,JUMP_CONTINUE_EFFECT	
	bne	t2,t5,JUMP_CONTINUE_EFFECT
	j	JUMP_CHANGE_POSE_EFFECT
JUMP_CONTINUE_EFFECT:
	sw	zero,0(t0)
	sw	zero,4(t0)
	sw	zero,8(t0)
	j	JUMP_EFFECT
JUMP_CHOOSE_EFFECT_GRASS:
	li	t1,1
	bne	t2,t1,JUMP_CHOOSE_EFFECT_JUMP
	lw	t2,8(t0)
	la	t1,POSITION_MAP
	lw	t3,4(t1)	
	addi	t3,t3,112
	sub	t3,t2,t3
	bgtz	t3,JUMP_MOD_Y
	sub	t3,zero,t3
JUMP_MOD_Y:
	li	t2,16
	la	t1,MOVEMENT
	blt	t3,t2,JUMP_END_EFFECT_JUMP
	sb	zero,0(t1)
	sw	zero,0(t0)
	sw	zero,4(t0)
	sw	zero,8(t0)
JUMP_END_EFFECT_JUMP:
	j	JUMP_EFFECT # indicando que não preciso do loop para esse efeito	
JUMP_CHOOSE_EFFECT_JUMP:
	j	JUMP_EFFECT
JUMP_CHOOSE_EFFECT:

	############################################################
	# vou deixar por enquanto hard coded mesmo a tile de grama #
	############################################################
	
	lb	t3,2(t0)
	addi	t3,t3,1
	li	t2,8
	rem	t2,t3,t2
	sb	t2,2(t0)
	bnez	t2,JUMP_CHANGE_POSE_EFFECT
	sb	zero,2(t0)
	addi	t1,t1,1
	sb	t1,1(t0)
JUMP_CHANGE_POSE_EFFECT:
	lw	t1,4(t0)
	lw	t2,8(t0)
	la	t0,POSITION_MAP
	lw	t3,0(t0)
	lw	t4,4(t0)
	sub	t1,t1,t3 
	sub	t2,t2,t4
	li 	t3, 0xFF0				# coloca em a7 o numero base do calculo do bitmap
	add 	t3, t3,a4				# faz a7 = a7 + a4 
	slli 	t3, t3, 20				# desloca os bites para esquerda vintes vezes
	add 	t3, t3, t1				# adiciona a largura do ponto incial de impressão			
	li 	t4, 320 				# faz t0 = t0 + 320 para utilizar no calculo da altura
	mul 	t2, t2, t4				# faz t0 = t0 * a3 para calcular a altura incial de impressão
	add 	t3, t3, t2				# adiciona a altura incial de impressão
	addi	a0,a0,8
	li	t1,16
	li	t2,16
LOOP_PRINT_EFFECT:
	lb	t0,0(a0)
	sb	t0,0(t3)
	addi	a0,a0,1
	addi	t3,t3,1
	addi	t1,t1,-1
	bgtz	t1,LOOP_PRINT_EFFECT
	li	t1,16
	addi	t3,t3,320
	addi	t3,t3,-16
	addi	t2,t2,-1
	bgtz	t2,LOOP_PRINT_EFFECT
JUMP_EFFECT:
	addi	a6,a6,-1
	bgtz	a6,LOOP_EFFECT
	ret