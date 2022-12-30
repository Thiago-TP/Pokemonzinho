PrintTilemap:	
	addi	sp, sp, -16
	sw	ra, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	
	lbu	a4, 0(a0)	# largura em tiles
	lbu	a5, 1(a0)	# altura em tiles
	lbu	a6, 2(a0)	# lado de 1 tile
	
	sw	a4, 12(sp)
	
	addi	a0, a0, 3
whileTiles:
	la	t0, inversoH_TLM
	sb	zero, 0(t0)
	la	t0, inversoV_TLM
	sb	zero, 0(t0)
	la	t0, inversoHV_TLM
	sb	zero, 0(t0)
	la	t0, transposto_TLM
	sb	zero, 0(t0)
	la	t0, transpostoH_TLM
	sb	zero, 0(t0)
	
	mv	s11, a0
	lbu	a0, 0(a0)
	call	DecideTile
	
	la	t0, inversoH_TLM
	lbu	t0, 0(t0)
	bnez	t0, tileEspelhadaH
	
	la	t0, inversoV_TLM
	lbu	t0, 0(t0)
	bnez	t0, tileEspelhadaV
	
	la	t0, inversoHV_TLM
	lbu	t0, 0(t0)
	bnez	t0, tileEspelhadaHV
	
	la	t0, transposto_TLM
	lbu	t0, 0(t0)
	bnez	t0, tileTransposta
	
	la	t0, transpostoH_TLM
	lbu	t0, 0(t0)
	bnez	t0, tileTranspostaH
	
	call	Print
	j	proximaTile
	
tileEspelhadaH:
	call	PrintInversoH
	j	proximaTile
tileEspelhadaV:
	call	PrintInversoV
	j	proximaTile
tileEspelhadaHV:
	call	PrintInversoHV
	j	proximaTile
tileTransposta:
	call	PrintTransposto
	j	proximaTile
tileTranspostaH:
	call	PrintTranspostoH
	j	proximaTile
	
proximaTile:
	mv	a0, s11
	addi	a0, a0, 1
	add	a1, a1, a6
	addi	a4, a4, -1
	bgtz	a4, whileTiles
	
	lw	a1, 4(sp)
	add	a2, a2, a6
	lw	a4, 12(sp)
	addi	a5, a5, -1
	bgtz	a5, whileTiles
	
	lw	ra, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a4, 12(sp)
	
	addi	sp, sp, 16
	ret	
	
	
