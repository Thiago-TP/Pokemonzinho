SetupGame:
	addi	sp, sp, -4
	sw	ra, 0(sp)
		
GameLoop:																									
	la	t0, fim_da_fase
	lbu	t0, 0(t0)
	bnez	t0, fimGameLoop		# acabou a fase ?
	
	call	Musica
	call	WildEncounter
	
	li	t0, 0xFF200000	
	lw	t1, 0(t0)
	andi	t1, t1, 1
	beqz	t1, voltaGameLoop
	
	la	a0, player
	lhu	a1, 0(a0)		# x atual
	lhu	a2, 2(a0)		# y atual
	
	la	t2, item
	lbu	t2, 0(t2)
	beqz	t2, normalStep
	li	t2, run_step
	j	TrataInput
normalStep:
	li	t2, normal_step	
	
TrataInput:	
	lw	t0, 4(t0)
	li	t1, '\n'
	beq	t0, t1, DecideAcao
	li	t1, 'a'
	beq	t0, t1, MoveEsq
	li	t1, 'd'
	beq	t0, t1, MoveDir
	li	t1, 'w'
	beq	t0, t1, MoveCima
	li	t1, 's'
	beq	t0, t1, MoveBaixo
	
voltaGameLoop:
	call	AnimaHero		# haverao anims dos inimigos tbm
	j	GameLoop
fimGameLoop:			
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret

MoveEsq:
	sub	a1, a1, t2
	call	VerificaColisao
	la	t0, bateu
	lbu	t0, 0(t0)
	bgtz	t0, voltaGameLoop
	
	bltz	a1, voltaGameLoop
	sh	a1, 4(a0)
	call	AtualizaEstadoHero
	j	voltaGameLoop	
MoveDir:
	add	a1, a1, t2
	call	VerificaColisao
	la	t0, bateu
	lbu	t0, 0(t0)
	bgtz	t0, voltaGameLoop
	
	li	t0, 308
	bgeu	a1, t0, voltaGameLoop
	sh	a1, 4(a0)
	call	AtualizaEstadoHero
	j	voltaGameLoop
MoveBaixo:
	add	a2, a2, t2
	call	VerificaColisao
	la	t0, bateu
	lbu	t0, 0(t0)
	bgtz	t0, voltaGameLoop
	
	li	t0, 220
	bgeu	a2, t0, voltaGameLoop
	sh	a2, 6(a0)
	call	AtualizaEstadoHero
	j	voltaGameLoop
MoveCima:
	sub	a2, a2, t2
	call	VerificaColisao
	la	t0, bateu
	lbu	t0, 0(t0)
	bgtz	t0, voltaGameLoop
	
	li	t0, 240
	bgeu	a2, t0, voltaGameLoop
	sh	a2, 6(a0)
	call	AtualizaEstadoHero	
	j	voltaGameLoop
	
DecideAcao:
	call	EscolheInicial	# particular da fase 1
	la	t0, menu_pkmn
	lbu	t0, 0(t0)
	bgtz	t0, GameLoop
	
	call	ChecaSaida
	la	t0, fim_da_fase
	lbu	t0, 0(t0)
	bnez	t0, fimGameLoop
	
	call	SetupMenu	# interacao com o user	
	j	GameLoop

ChecaSaida:
	la	t0, player
	lhu	a1, 0(t0)
	lhu	a2, 2(t0)
	
	la	t1, fase	
	lbu	t1, 0(t1)
	beqz	t1, saida0
	li	t2, 1
	beq	t1, t2, saida1
	li	t2, 2
	beq	t1, t2, saida2

fimChecaSaida:
	ret

saida0:
	la	t0, player
	lbu	t1, 8(t0)
	beqz	t1, fimChecaSaida	# escolheu pokemon ?
	
	li	t0, 206	#240-24-10
	blt	a2, t0, fimChecaSaida
	
	li	t0, 144	#160 - 16
	blt	a1, t0, fimChecaSaida
	li	t0, 160	#160 + 16 - 16
	bgt	a1, t0, fimChecaSaida
	
	la	t0, fim_da_fase
	li	t1, 1
	sb	t1, 0(t0)
	j	fimChecaSaida
	
saida1:
	li	t0, 8	# 0 + tol	
	bgt	a2, t0, fimChecaSaida	
	li	t0, 160	
	blt	a1, t0, fimChecaSaida
	
	la	t0, fim_da_fase
	li	t1, 1
	sb	t1, 0(t0)
	j	fimChecaSaida
saida2:
	j	fimChecaSaida
