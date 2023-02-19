#########################################
# 		Argumentos		#
#					#
# a0 =  end flag indicando movimento  	#
#					#
#	   n�o retorna nada		#
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
	la	t0, POSITION_MAP		# carrego o endere�o da posi��o incial do mapa em t0
	lw 	t2, 0(t0)			# coloco o valor da largura da posi��o inicial em t2
	addi 	t2, t2, -1			# adiciono -4 em t2 para movermos a posi��o inicial do mapa 
	sw 	t2, 0(t0)			# salvo t2 no endere�o da posi��o inicial do mapa para efetivar a mudan�a
	ret					# retorna para a fun��o que chamou key pool que est� indicada no reg ra
MOVE_RGT:
	la 	t0, POSITION_MAP		# carrego o endere�o da posi��o incial do mapa em t0
	lw 	t2, 0(t0)			# coloco o valor da largura da posi��o inicial em t2
	addi 	t2, t2, 1			# adiciono 4 em t2 para movermos a posi��o inicial do mapa 
	sw 	t2, 0(t0)			# salvo t2 no endere�o da posi��o inicial do mapa para efetivar a mudan�a	
	ret					# retorna para a fun��o que chamou key pool que est� indicada no reg ra
MOVE_UP:
	la 	t0, POSITION_MAP		# carrego o endere�o da posi��o incial do mapa em t0
	lw 	t2, 4(t0)			# coloco o valor da altura da posi��o inicial em t2
	addi 	t2, t2, -1			# adiciono -4 em t2 para movermos a posi��o inicial do mapa 
	sw 	t2, 4(t0)			# salvo t2 no endere�o da posi��o inicial do mapa para efetivar a mudan�a
	ret					# retorna para a fun��o que chamou key pool que est� indicada no reg ra
MOVE_LOW:
	la 	t0, POSITION_MAP		# carrego o endere�o da posi��o incial do mapa em t0	
	lw 	t2, 4(t0)			# coloco o valor da altura da posi��o inicial em t2
	addi 	t2, t2, 1			# adiciono 4 em t2 para movermos a posi��o inicial do mapa 
	sw 	t2, 4(t0)			# salvo t2 no endere�o da posi��o inicial do mapa para efetivar a mudan�a
	ret