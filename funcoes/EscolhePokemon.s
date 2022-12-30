.data
tilemap_lab:	.byte 20, 15, 16,
13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13,
12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12,
 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
 0,  0,  0,  0,  0,  0,  0,  0,  0, 10, 11,  0,  0,  0,  0,  0,  0,  0,  0,  0

.text
EscolhePokemon:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	t0, fase
	sb	zero, 0(t0)

	call	InicializaMacros
	
	# imprime o laboratorio + prof oak + pokeballs nos dois frames
	li	t0, frameAddress
	sw	zero, 0(t0)	
	li	a3, 1		# frame 1
	call	ImprimeLab	# vai virar imprime mapa
	
	li	t0, frameAddress
	sw	a3, 0(t0)	
	li	a3, 0		# frame 0
	call	ImprimeLab
	
	call	Cutscene	# Oak e TRN entram em cena
	call	Dialogo

	call	SetupGame
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
###

ImprimeLab:	
	addi	sp, sp, -4
	sw	ra, 0(sp)
		
	la	a0, tilemap_lab	# a0 <- tilemap do laboratorio
	li	a1, 0		# x
	li	a2, 0		# y
	call	PrintTilemap
	
	# imprime a mesa
	la	a0, mesa
	li	a1, 136
	li	a2, 108
	call	Print
	addi	a1, a1, 24
	call	PrintInversoH
	
	# imprime pokebolas
	la	a0, pokeball_red	
	li	a1, 154
	li	a2, 80
	addi	a2, a2, 32	
	call	Print
	addi	a1, a1, -16	
	call	Print
	addi	a1, a1, 32	
	call	Print	
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret