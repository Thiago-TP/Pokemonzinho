InicializaMacros:
	# flag de fim de fase
	la	t0, fim_da_fase
	sb	zero, 0(t0)	
	# flag de impressao inversa
	la	t0, inversoH	
	sb	zero, 0(t0)
	# flag de item
	#la	t0, item
	#sb	zero, 0(t0)
	# flag de colisao
	la	t0, bateu
	sb	zero, 0(t0)
	# posicao do player (repetida na cutscene)
	la	t0, player
	li	t1, 152		# x0 do play
	li	t2, 220		# y0 do player
	sh	t1, 0(t0)	# x atual
	sh	t2, 2(t0)	# y atual
	sh	t1, 4(t0)	# x novo
	sh	t2, 6(t0)	# y novo
	# sprite neutra (quando sem input)
	la	t0, neutro
	la	t1, hero_n1
	sw	t1, 0(t0)
	# estado do hero (0 = parado, 1 e 2 = movendo)
	li	s0, 0		
	# contador de notas tocadas
	la	t0, noteCount	
	sb	zero, 0(t0)
	# registro de tempo da última nota tocada
	la	t0, lastTimeMsc
	csrr	t1, time
	sw	t1, 0(t0)
	# registro de tempo da última sprite do player impressa	
	la	t0, lastTime
	sw	t1, 0(t0)
	
	ret
