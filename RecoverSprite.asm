#########################################
# 					#
#					#
#	a0 = mapeamento de tiles	#
#	a4 = frame que vamos operar	#
#	e  não retorna nada		#
#					#
#########################################
RECOVER_SPRITE:
	addi	sp,sp,-4
	sw	ra,0(sp)
	la	t0,POSITION_MAP
	lw	t1,0(t0)
	lw	t2,4(t0)
	addi	t1,t1,144
	addi	t2,t2,112
	li	t3,16
	lw	t5,0(a0)
	addi	a0,a0,8
	div	t1,t1,t3
	div	t2,t2,t3
	mul	t2,t2,t5
	add	a0,a0,t2
	add	a0,a0,t1
	call	DecideTile
	addi	a1,a1,8
	li 	t3, 0xFF0				# coloca em a7 o numero base do calculo do bitmap
	add 	t3, t3,a4				# faz a7 = a7 + a4 
	slli 	t3, t3, 20				# desloca os bites para esquerda vintes vezes
	addi 	t3, t3, 144 				# adiciona a largura do ponto incial de impressão			
	li 	t2, 320 				# faz t0 = t0 + 320 para utilizar no calculo da altura
	li	t1,112
	mul 	t2, t2, t1				# faz t0 = t0 * a3 para calcular a altura incial de impressão
	add 	t3, t3, t2				# adiciona a altura incial de impressão
	li	t1,16
	li	t2,16
	beqz	a5,LOOP_RECOVER_SPRITE
	addi	a1,a1,16
LOOP_RECOVER_SPRITE:
	beqz	a5,JUMP_INV_SPRITE1
	addi	a1,a1,-1
JUMP_INV_SPRITE1:
	lb	t0,0(a1)
	sb	t0,0(t3)
	bnez	a5,JUMP_DEFAULT_SPRITE
	addi	a1,a1,1
JUMP_DEFAULT_SPRITE:	
	addi	t3,t3,1
END_INCREMENT_TILE:
	addi	t1,t1,-1
	bgtz	t1,LOOP_RECOVER_SPRITE
	addi	t3,t3,320
	addi	t3,t3,-16
	beqz	a5,JUMP_INV_SPRITE2
	addi	a1,a1,32
JUMP_INV_SPRITE2:
	li	t1,16
	addi	t2,t2,-1
	bgtz	t2,LOOP_RECOVER_SPRITE
	lw	ra,0(sp)
	addi	sp,sp,4
	ret
