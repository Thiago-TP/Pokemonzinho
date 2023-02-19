#########################################
# 		Argumentos		#
#					#
#					#
#	   não retorna nada		#
#					#
#########################################
ANIMATIONS:
	sw	ra,0(sp)
	la	s1,SETTING_ANIMATION
	lb	t1,0(s1)
	bnez	t1,JUMP_ANIMMATION
	la	t0, TIMER_ANIMATION
	csrr	t1,time
	sw	t1,0(t0)
	j	END_ANIMATION
JUMP_ANIMMATION:
	mv	a4,s0
	call	ANIMATION_BATTLE
	la	t0, TIMER_ANIMATION
	lw	t1,0(t0)
	csrr	t2,time
	sub	t1,t2,t1
	li	t2,1400
	blt	t1,t2,END_ANIMATION
	sb	zero,0(s1)	
END_ANIMATION:
	lw	ra,0(sp)
	ret

#########################################
# 		Argumentos		#
#					#
# a4 = frame que vamos operar		#
#					#
#	   não retorna nada		#
#					#
#########################################	
ANIMATION_BATTLE:
	li 	a7, 0xFF0				# coloca em a7 o numero base do calculo do bitmap
	add 	a7, a7, a4 				# faz a7 = a7 + a4 
	slli 	a7, a7, 20				# desloca os bites para esquerda vintes vezes
	li	t0,320
	li	t2,0
	li	t3,122
LOOP_ANIMATION_BATTLE_LFT:
	lw	t4,0(a7)
	bnez	t2,JUMP_BLACK_ANIMATION_LFT
	sw	t2,0(a7)
	sw	t2,4(a7)
JUMP_BLACK_ANIMATION_LFT:
	mv	t2,t4
	addi	a7,a7,8
	addi	t0,t0,-8
	bgtz	t0,LOOP_ANIMATION_BATTLE_LFT
	mv	a6,a7
	addi	a7,a7,320
	li	t2,0
LOOP_ANIMATION_BATTLE_RGT:
	lw	t4,0(a7)
	bnez	t2,JUMP_BLACK_ANIMATION_RGT
	sw	t2,0(a7)
	addi	a7,a7,-4
	sw	t2,0(a7)
JUMP_BLACK_ANIMATION_RGT:
	mv	t2,t4
	addi	a7,a7,-4
	bge	a7,a6,LOOP_ANIMATION_BATTLE_RGT
	addi	a7,a7,320
	li	t2,0
	li	t0,320
	addi	t3,t3,-1
	bgtz	t3,LOOP_ANIMATION_BATTLE_LFT
	ret