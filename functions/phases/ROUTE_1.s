ROUTE_1:
	addi	sp, sp, -4
	sw		ra, 0(sp)
	
	la		t0, fase
	li		t1, 1
	sb		t1, 0(t0)

	call	INITIALIZE_MACROS
	
	# imprime o laboratorio + prof oak + pokeballs nos dois frames
	li		t0, FRAME_ADDRESS
	lw		a3, 0(t0)	
	xori	a3, a3, 1		
	la		a0, TILEMAP_ROUTE1	# a0 <- tilemap da rota 1
	li		a1, 0				# x
	li		a2, 0				# y
	call	PRINT_TILEMAP	
	
	li		t0, FRAME_ADDRESS
	sw		a3, 0(t0)	
	xori	a3, a3, 1    
	la		a0, TILEMAP_ROUTE1	# a0 <- tilemap da rota 1
	call	PRINT_TILEMAP
	
	# ajusta a posicao em x do player para a cutscene
	la		t0, player
	lhu		t1, 0(t0)
	li		t1, 160
	sh		t1, 0(t0)
	sh		t1, 4(t0)
	
	call	CUTSCENE	# OAK e TRN entram em cena
	call	DIALOGUE	# placa explana

	call	SETUP_GAME
	
	lw		ra, 0(sp)
	addi	sp, sp, 4
	ret
