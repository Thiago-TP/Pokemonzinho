.data
tilemap_menu_starter:	.byte 20, 4, 8,
1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3,
4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6,
4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6,
7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9
BULBASAUR: 	.string "BULBASAUR"
CHARMENDER: 	.string "CHARMENDER"
SQUIRTLE:	.string "SQUIRTLE"
CHOOSE:	.string "CHOOSE"
YES:	.string "YES"
NO:	.string "NO"

.text
EscolheInicial:	
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	t0, menu_pkmn
	sb	zero, 0(t0)
	
	la	t0, fase
	lbu	t0, 0(t0)
	bnez	t0, fimEscolheInicial
	
	la	t0, bateu
	lbu	t0, 0(t0)
	beqz	t0, fimEscolheInicial
	
	la	t0, menu_pkmn
	li	t1, 1
	sb	t1, 0(t0)
	la	t0, player
	lh	a1, 0(t0)
	lh	a2, 2(t0)
	
	li	t0, 88	# 112 - 20 - tolerancia
	blt	a2, t0, fimEscolheInicial
	
	li	t0, 168
	bgeu	a1, t0, talvezCharm
	li	t0, 144
	bleu	a1, t0, talvezBulba
	j	talvezSquirtle
	
fimEscolheInicial:	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret

talvezBulba:	
	la	a0, bulbasaur_front
	la	a1, BULBASAUR
	call	ApresentaInicial
	li	s11, 1			# pokedex ID
	call	SetupStarter
	j	fimEscolheInicial
talvezCharm:
	la	a0, charmender_front
	la	a1, CHARMENDER
	call	ApresentaInicial
	li	s11, 4
	call	SetupStarter
	j	fimEscolheInicial
talvezSquirtle:	
	la	a0, squirtle_front
	la	a1, SQUIRTLE
	call	ApresentaInicial
	li	s11, 7
	call	SetupStarter
	j	fimEscolheInicial
###

ApresentaInicial:
	addi	sp, sp, -12
	sw	ra, 0(sp)
	sw	a0, 4(sp)
	sw	a1, 8(sp)
	
	li	s10, frameAddress
	lw	a3, 0(s10)
	xori	a3, a3, 1
	la	a0, tilemap_menu_starter
	li	a1, 80
	li	a2, 148
	call	PrintTilemap		# usa s11
	
	lw	a0, 4(sp)
	li	a1, 180
	li	a2, 152
	call	Print
	sw	a3, 0(s10)
	
	la	a0, CHOOSE
	li	a1, 88
	li	a2, 156
	mv	a4, a3
	li	a3, 0x0000ff00
	call	PrintString
	
	lw	a0, 8(sp)
	addi	a1, a1, 56
	call	PrintString

	addi	a1, a1, 80
	li	a0, '?'
	call	PrintChar
	
	la	a0, YES
	li	a1, 128
	addi	a2, a2, 8
	call	PrintString
	
	li	a0, '>'
	addi	a1, a1, -8
	li	a3, 0x0000ff07
	call	PrintChar
	
	la	a0, NO
	li	a1, 168
	li	a3, 0x0000ff00
	call	PrintString

	lw	ra, 0(sp)
	lw	a0, 4(sp)
	lw	a1, 8(sp)
	addi	sp, sp, 12
	ret
###

SetupStarter:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	s10, 1		# flag de YES
StarterLoop:	
	li	t0, 0xFF200000
	lw	t1, 0(t0)
	andi	t1, t1, 1
	beqz	t1, StarterLoop
	
	lw	t0, 4(t0)
	li	t1, '\n'
	beq	t0, t1, escolheu
	li	t1, 'd'
	beq	t0, t1, gotoNO
	li	t1, 'a'
	beq	t0, t1, gotoYES
	
	j	StarterLoop
fimSetupStarter:
	li	t0, frameAddress
	lw	a3, 0(t0)
	xori	a3, a3, 1
	sw	a3, 0(t0)
	
	li	a1, 80
	li	a2, 148
	xori	a3, a3, 1
	li	a4, 160
	li	a5, 64
	call	EscondeSprite
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret

escolheu:
	beqz	s10, fimSetupStarter	# escolheu NO
	la	t0, player
	sb	s11, 8(t0)
	
	j	fimSetupStarter
gotoNO:
	li	a0, '>'
	li	a1, 160
	li	a2, 164
	li	a3, 0x0000ff07
	li	a4, frameAddress
	lw	a4, 0(a4)
	call	PrintChar
	li	a1, 120
	li	a3, 0x0000ffff
	call	PrintChar
	
	li	s10, 0
	j	StarterLoop
gotoYES:
	li	a0, '>'
	li	a1, 120
	li	a2, 164
	li	a3, 0x0000ff07
	li	a4, frameAddress
	lw	a4, 0(a4)
	call	PrintChar
	li	a1, 160
	li	a3, 0x0000ffff
	call	PrintChar
	
	li	s10, 1
	j	StarterLoop
