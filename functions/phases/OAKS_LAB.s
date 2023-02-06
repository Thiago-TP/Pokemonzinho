#####################################################################################
#	Primeira fase do jogo. Começa com o OAK andando para a mesa, e termina quando	#
#	o jogador escolhe seu pokémon inicial e sai do laboratório.						#
#####################################################################################
OAKS_LAB:
	addi	sp, sp, -4
	sw		ra, 0(sp)
	
	# inicializa macros de controle
	la		t0, fase
	sb		zero, 0(t0)			# fase = 0
	call	INITIALIZE_MACROS	# resto das macros
	
	# imprime o laboratorio + prof oak + pokeballs nos dois frames
	li		t0, FRAME_ADDRESS
	sw		zero, 0(t0)	
	li		a3, 1		# frame 1
	call	PRINT_LAB	# vai virar imprime mapa
	
	li		t0, FRAME_ADDRESS
	sw		a3, 0(t0)	# mostra o frame 1
	li		a3, 0		# repete a impressão no frame 0
	call	PRINT_LAB
	
	call	CUTSCENE	# OAK e TRN entram em cena
	call	DIALOGUE	# OAK conversa com TRN (tutorial)

	call	SETUP_GAME	# interação USER-GAME se inicia
	
	lw		ra, 0(sp)
	addi	sp, sp, 4
	ret


#########################################################
#	Imprime o mapa da fase 1, lab do OAK, no frame a3	#
#########################################################
PRINT_LAB:	
	addi	sp, sp, -4
	sw		ra, 0(sp)
		
	la		a0, TILEMAP_LAB	# a0 <- tilemap do laboratorio
	li		a1, 0			# x
	li		a2, 0			# y
	call	PRINT_TILEMAP
	
	# imprime a mesa
	la		a0, mesa
	li		a1, 136
	li		a2, 108
	call	PRINT
	addi	a1, a1, 24
	call	PRINT_INVERSEH
	
	# imprime pokebolas
	la		a0, pokeball_red	
	li		a1, 154
	li		a2, 80
	addi	a2, a2, 32	
	call	PRINT
	addi	a1, a1, -16	
	call	PRINT
	addi	a1, a1, 32	
	call	PRINT	
	
	lw		ra, 0(sp)
	addi	sp, sp, 4
	ret
