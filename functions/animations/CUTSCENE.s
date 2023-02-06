CUTSCENE:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	t0, fase		
	lbu	t0, 0(t0)		# t0 <- num da fase atual
	beqz	t0, cutscene0		# cutscene da fase 0
	li	t1, 1
	beq	t0, t1, cutscene1	# cutscene da fase 1
	li	t1, 2
	beq	t0, t1, cutscene2	# cutscene da fase 2
fimCutscene:
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret

cutscene0:
	call	OakAnda
	call	TrnAnda
	j	fimCutscene
cutscene1:
	call	TrnAnda
	j	fimCutscene
cutscene2:
	call	TrnAnda
	j	fimCutscene

OakAnda:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	t0, neutro
	la	t1, oak_n1
	sw	t1, 0(t0)
	
	la	t0, oak_struct
	lhu	a1, 4(t0)
	lhu	a2, 6(t0)
loopOakAnda1:
	la	t0, oak_struct
	sh	a1, 4(t0)
	
	addi	s0, s0, 1
	li	t0, 4
	remu	s0, s0, t0
	call	AnimaOak
	
	li	a0, idleTime
	call	Sleep
	
	li	t0, run_step
	sub	a1, a1, t0
	li	t0, 118
	bgt	a1, t0, loopOakAnda1
		
loopOakAnda2:
	la	t0, oak_struct
	sh	a2, 6(t0)
	
	addi	s0, s0, 1
	li	t0, 4
	remu	s0, s0, t0
	call	AnimaOak
	
	li	a0, idleTime
	call	Sleep
	
	li	t0, run_step
	sub	a2, a2, t0
	li	t0, 80
	bgt	a2, t0, loopOakAnda2	

loopOakAnda3:
	la	t0, oak_struct
	sh	a1, 4(t0)
	
	addi	s0, s0, 1
	li	t0, 4
	remu	s0, s0, t0
	call	AnimaOak
	
	li	a0, idleTime
	call	Sleep
	
	li	t0, run_step
	add	a1, a1, t0
	li	t0, 152
	blt	a1, t0, loopOakAnda3
	
	li	a1, 148 
	li	t0, FRAME_ADDRESS
	lw	a3, 0(t0)
	xori	a3, a3, 1
	sw	a3, 0(t0)		# mostra o outro frame
	xori	a3, a3, 1		
	li	a4, 16
	li	a5, 20
	call	EscondeSprite		# limpa a pose errada no oculto
	
	li	a1, 152
	la	a0, oak_s1		# imprime a certa no oculto
	call	PRINT
	li	t0, FRAME_ADDRESS
	sw	a3, 0(t0)		# mostra a pose certa
	xori	a3, a3, 1
	call	PRINT			# repete a pose no outro frame
	
	li	s0, 0
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
	
TrnAnda:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	t0, player
	lhu	a1, 4(t0)
	lhu	a2, 6(t0)
loopTrnAnda:
	la	t0, player
	sh	a2, 6(t0)
	addi	s0, s0, 1
	li	t0, 4
	remu	s0, s0, t0
	call	AnimaHero
	
	li	a0, idleTime
	call	Sleep
	
	li	t0, normal_step
	sub	a2, a2, t0
	li	t0, 200
	bgt	a2, t0, loopTrnAnda	

	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
