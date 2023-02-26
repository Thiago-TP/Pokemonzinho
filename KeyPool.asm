#########################################
# 					#
#					#
#	Não recebe nada como arg	#
#	e  não retorna nada		#
#					#
#########################################
KEY_POOL:
	li	t1, 0xFF210000
	lw	t0, 0(t1)
	andi	t0, t0, 1
  	beqz	t0,END_CHAR 			# se nao tiver input, zera as entradas
	lw	t2, 4(t1)			# se houver input, pega o valor que ta no buffer pra comparacao	W
	la	t0,POSITION_MAP
	lw	t1,0(t0)
	lw	t3,4(t0)
	addi	t1,t1,144
	addi	t3,t3,112
	li	t4,16
	div	t1,t1,t4
	div	t3,t3,t4
	la	t6,BIG_ROUTE01
	lw	t5,0(t6)
	li 	t0, 'w'				# carrega em to o valor do char 'w'
	beq 	t2, t0, CHAR_UP			# se tecla pressionada for 'w', chama CHAR_CIMA	
	li 	t0, 'a'				# carrega em to o valor do char 'a'
	beq 	t2, t0, CHAR_LFT		# se tecla pressionada for 'a', chama CHAR_CIMA
	li 	t0, 's'				# carrega em to o valor do char 's'
	beq 	t2, t0, CHAR_LOW		# se tecla pressionada for 's', chama CHAR_CIMA
	li 	t0, 'd'				# carrega em to o valor do char 'd'
	beq 	t2, t0, CHAR_RGT		# se tecla pressionada for 'd', chama CHAR_CIMA
END_CHAR:
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
CHAR_LFT:
	addi	t1,t1,-1
	bltz	t1,END_CHAR_LFT
	addi	t6,t6,8
	mul	t3,t3,t5
	add	t6,t6,t3
	add	t6,t6,t1
	lb	t0,0(t6)
	li	t1,22
	blt	t0,t1,START_MOVEMENT_LFT
	li	t1,39
	ble	t0,t1,END_CHAR_LFT
	li	t1,58
	blt	t0,t1,START_MOVEMENT_LFT
	li	t1,59
	ble	t0,t1,END_CHAR_LFT
START_MOVEMENT_LFT:
	la	t0,MOVEMENT
	li	t1,1
	sb	t1,0(t0)
END_CHAR_LFT:
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
CHAR_RGT:
	addi	t1,t1,1
	bge	t1,t5,END_CHAR_RGT
	addi	t6,t6,8
	mul	t3,t3,t5
	add	t6,t6,t3
	add	t6,t6,t1
	lb	t0,0(t6)
	li	t1,22
	blt	t0,t1,START_MOVEMENT_RGT
	li	t1,39
	ble	t0,t1,END_CHAR_RGT
	li	t1,58
	blt	t0,t1,START_MOVEMENT_RGT
	li	t1,59
	ble	t0,t1,END_CHAR_RGT
START_MOVEMENT_RGT:
	la	t0,MOVEMENT
	li	t1,2
	sb	t1,0(t0)
END_CHAR_RGT:
	ret
CHAR_UP:
	addi	t3,t3,-1
	bltz	t3,END_CHAR_UP
	addi	t6,t6,8
	mul	t3,t3,t5
	add	t6,t6,t3
	add	t6,t6,t1
	lb	t0,0(t6)
	li	t1,22
	blt	t0,t1,START_MOVEMENT_UP
	li	t1,39
	ble	t0,t1,END_CHAR_UP
	li	t1,58
	blt	t0,t1,START_MOVEMENT_UP
	li	t1,59
	ble	t0,t1,END_CHAR_UP
START_MOVEMENT_UP:
	la	t0,MOVEMENT
	li	t1,3
	sb	t1,0(t0)
END_CHAR_UP:
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
CHAR_LOW:
	addi	t3,t3,1
	lw	t4,4(t6)
	bge	t3,t4,END_CHAR_LOW
	addi	t6,t6,8
	mul	t3,t3,t5
	add	t6,t6,t3
	add	t6,t6,t1
	lb	t0,0(t6)
	li	t1,22
	blt	t0,t1,START_MOVEMENT_LOW
	li	t1,25
	ble	t0,t1,END_CHAR_LOW
	li	t1,32
	blt	t0,t1,START_MOVEMENT_LOW
	li	t1,39
	ble	t0,t1,END_CHAR_LOW
START_MOVEMENT_LOW:
	la	t0,MOVEMENT
	li	t1,4
	sb	t1,0(t0)
END_CHAR_LOW:
	ret
