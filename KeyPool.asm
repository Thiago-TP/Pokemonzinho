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
  	beqz	t0,END_CHAR 	# se nao tiver input, zera as entradas
	lw	t2, 4(t1)	# se houver input, pega o valor que ta no buffer pra comparacao	
	li 	t0, 'w'				# carrega em to o valor do char 'w'
	beq 	t2, t0, CHAR_UP			# se tecla pressionada for 'w', chama CHAR_CIMA	
	li 	t0, 'a'				# carrega em to o valor do char 'a'
	beq 	t2, t0, CHAR_LFT		# se tecla pressionada for 'a', chama CHAR_CIMA
	li 	t0, 's'				# carrega em to o valor do char 's'
	beq 	t2, t0, CHAR_LOW		# se tecla pressionada for 's', chama CHAR_CIMA
	li 	t0, 'd'				# carrega em to o valor do char 'd'
	beq 	t2, t0, CHAR_RGT		# se tecla pressionada for 'd', chama CHAR_CIMA
	li 	t0, 'z'				# carrega em to o valor do char 'd'
	beq 	t2, t0, TESTE_ANIMATION		# se tecla pressionada for 'd', chama CHAR_CIMA
END_CHAR:
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
CHAR_LFT:
	la	t0,MOVEMENT
	li	t1,1
	sb	t1,0(t0)
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
CHAR_RGT:
	la	t0,MOVEMENT
	li	t1,2
	sb	t1,0(t0)
	ret
CHAR_UP:
	la	t0,MOVEMENT
	li	t1,3
	sb	t1,0(t0)
	ret					# retorna para a função que chamou key pool que está indicada no reg ra
CHAR_LOW:
	la	t0,MOVEMENT
	li	t1,4
	sb	t1,0(t0)
	ret
	
TESTE_ANIMATION:
	la	t0,SETTING_ANIMATION
	li	t1,1
	sb	t1,0(t0)
	ret