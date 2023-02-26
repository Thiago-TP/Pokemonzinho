#########################################
# 		Argumentos		#
#					#
# a4 = frame que iremos operar		#
#					#
#	   não retorna nada		#
#					#
#########################################
PRINT_HERO:
	la	t0 INFO_HERO
	lb	t1, 0(t0)
	lb	t2, 1(t0)
	li	t4,1
	bne	t1,t4,JUMP_POSES_LFT
	li	t3, 3
	rem	t2, t2, t3
	sb	t2, 1(t0)
	bnez	t2, JUMP_FIRST_POSE_LFT
	la	t6, hero_e1
	j	PRINT_POSE
JUMP_FIRST_POSE_LFT:
	li	t3, 1
	bne	t2, t3, JUMP_SECOND_POSE_LFT
	la	t6, hero_e2
	j	PRINT_POSE	
JUMP_SECOND_POSE_LFT:
	la	t6, hero_e3
	j	PRINT_POSE
JUMP_POSES_LFT:
	li	t4,2
	bne	t1,t4,JUMP_POSES_RGT
	li	t3, 3
	rem	t2, t2, t3
	sb	t2, 1(t0)
	bnez	t2, JUMP_FIRST_POSE_RGT
	la	t6, hero_e1
	j	PRINT_POSE
JUMP_FIRST_POSE_RGT:
	li	t3, 1
	bne	t2, t3, JUMP_SECOND_POSE_RGT
	la	t6, hero_e2
	j	PRINT_POSE	
JUMP_SECOND_POSE_RGT:
	la	t6, hero_e3
	j	PRINT_POSE
JUMP_POSES_RGT:
	li	t4,3
	bne	t1,t4,JUMP_POSES_UP
	li	t3, 3
	rem	t2, t2, t3
	sb	t2, 1(t0)
	bnez	t2, JUMP_FIRST_POSE_UP
	la	t6, hero_n1
	j	PRINT_POSE
JUMP_FIRST_POSE_UP:
	li	t3, 1
	bne	t2, t3, JUMP_SECOND_POSE_UP
	la	t6, hero_n2
	j	PRINT_POSE	
JUMP_SECOND_POSE_UP:
	la	t6, hero_n2
	j	PRINT_POSE
JUMP_POSES_UP:
	li	t4,4
	bne	t1,t4,PRINT_POSE
	li	t3, 3
	rem	t2, t2, t3
	sb	t2, 1(t0)
	bnez	t2, PULA_PRIMEIRA_POSE_BAIXO
	la	t6, hero_s1
	j	PRINT_POSE
PULA_PRIMEIRA_POSE_BAIXO:
	li	t3, 1
	bne	t2, t3, PULA_SEGUNDA_POSE_BAIXO
	la	t6, hero_s2
	j	PRINT_POSE	
PULA_SEGUNDA_POSE_BAIXO:
	la	t6, hero_s2
	j	PRINT_POSE
PRINT_POSE:
	lb	t3,0(t0)
	lb	t5,1(t0)
	li	t0,2
	li	t4,0
	bne	t3,t0,PULA_ALGO
	li	t4,1
	j	FIM_ALGO
PULA_ALGO:
	addi	t3,t3,-1
	beqz	t3,FIM_ALGO
	bne	t5,t0,FIM_ALGO
	li	t4,1
FIM_ALGO:
	mv	t0,a1
	mv	t1,a2
	li 	a7, 0xFF0				# coloca em a7 o numero base do calculo do bitmap
	add 	a7, a7, a4 				# faz a7 = a7 + a4 
	slli 	a7, a7, 20				# desloca os bites para esquerda vintes vezes
	add 	a7, a7, t0 				# adiciona a largura do ponto incial de impressão			
	li 	t0, 320 				# faz t0 = t0 + 320 para utilizar no calculo da altura
	mul 	t0, t0, t1				# faz t0 = t0 * a3 para calcular a altura incial de impressão
	add 	a7, a7, t0				# adiciona a altura incial de impressão
	lw	t0,0(t6)
	lw	t1,4(t6)
	mv	t2,t6
	addi	t2,t2,8
	beqz	t4,LOOP_PRINT_HERO
	add	t2,t2,t0
	addi	t2,t2,-1
	mv	t5,t2
LOOP_PRINT_HERO:
	lb	t3, 0(t2)
	sb	t3, 0(a7)
	addi	a7, a7, 1
	beqz	t4, PULA_INCREMENTA_INVERSO
	addi	t2, t2, -1
	j	FIM_INCREMENTA
PULA_INCREMENTA_INVERSO:
	addi	t2, t2, 1
FIM_INCREMENTA:
	addi	t0,t0,-1
	blt	zero,t0,LOOP_PRINT_HERO
	addi	a7,a7,320
	lw	t0,0(t6)
	beqz	t4,PULA_REINICIALIZA_INVERSO
	add	t5,t5,t0
	mv	t2,t5
PULA_REINICIALIZA_INVERSO:
	sub	a7,a7,t0
	addi	t1,t1,-1
	blt	zero,t1,LOOP_PRINT_HERO
FIM_PRINT_HERO:
	ret