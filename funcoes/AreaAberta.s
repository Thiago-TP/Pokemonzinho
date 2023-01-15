.data
tilemap_rota1:	.byte 20, 15, 16,
14, 15, 14, 15, 14, 15, 14, 15, 14, 15, 16, 16, 16, 16, 16, 16, 48, 42, 42, 43,
21, 22, 21, 22, 21, 22, 21, 22, 21, 22, 16, 16, 16, 16, 16, 16, 48, 42, 42, 43,
23, 24, 23, 24, 23, 24, 23, 24, 23, 24, 16, 16, 16, 16, 16, 16, 25, 27, 27, 26,
20, 28, 20, 28, 20, 18, 19, 18, 19, 18, 16, 16, 16, 16, 16, 16, 48, 42, 42, 43,
28, 19, 28, 20, 20, 17, 20, 17, 20, 17, 16, 16, 16, 16, 16, 16, 48, 42, 42, 43,
40, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 50, 42, 42, 43,
44, 45, 45, 45, 45, 45, 45, 45, 45, 46, 42, 42, 47, 45, 45, 45, 45, 45, 45, 49,
29, 31, 31, 30, 18, 19, 19, 32, 29, 25, 27, 27, 26, 31, 31, 31, 31, 31, 31, 30,
19, 18, 16, 16, 16, 16, 16, 16, 16, 48, 42, 42, 43, 19, 18, 16, 16, 16, 16, 16,
19, 17, 16, 16, 16, 16, 16, 16, 16, 48, 42, 42, 43, 19, 17, 16, 16, 16, 16, 16,
16, 16, 16, 16, 16, 16, 16, 18, 28, 44, 45, 45, 49, 16, 16, 16, 16, 16, 28, 19,
16, 16, 16, 16, 16, 16, 16, 28, 19, 18, 16, 16, 19, 16, 16, 16, 16, 16, 18, 28,
33, 33, 33, 33, 33, 33, 33, 33, 33, 34, 16, 16, 35, 33, 33, 33, 33, 33, 33, 33,
14, 15, 14, 15, 14, 15, 14, 15, 14, 36, 16, 16, 37, 15, 14, 15, 14, 15, 14, 15,
21, 22, 21, 22, 21, 22, 21, 22, 21, 38, 16, 16, 39, 22, 21, 22, 21, 22, 21, 22

.text
AreaAberta:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	t0, fase
	li	t1, 1
	sb	t1, 0(t0)

	call	InicializaMacros
	
	# imprime o laboratorio + prof oak + pokeballs nos dois frames
	li	t0, frameAddress
	lw	a3, 0(t0)	
	xori	a3, a3, 1		
	call	ImprimeRota1	
	
	li	t0, frameAddress
	sw	a3, 0(t0)	
	xori	a3, a3, 1		
	call	ImprimeRota1
	
	# ajusta a posicao em x do player para a cutscene
	la	t0, player
	lhu	t1, 0(t0)
	li	t1, 160
	sh	t1, 0(t0)
	sh	t1, 4(t0)
	
	call	Cutscene	# Oak e TRN entram em cena
	call	Dialogo

	call	SetupGame
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
###


###
ImprimeRota1:	
	addi	sp, sp, -4
	sw	ra, 0(sp)
		
	la	a0, tilemap_rota1	# a0 <- tilemap do laboratorio
	li	a1, 0			# x
	li	a2, 0			# y
	li	t0, frameAddress
	call	PrintTilemap	
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
