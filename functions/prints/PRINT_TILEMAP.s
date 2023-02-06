#########################################################
#	Imprime um dado tilemap numa dada posição no bitmap	#
#########################################################
#	- Inputs -				#
#	a0 = label do tilemap	#
#	a1 = x no bmp			#
#	a2 = y no bmp			#
#	a3 = frame do bmp		#
#############################
#	- Outputs -			#
#	tilemap impresso	#
#################################
#	! Modifica a5, a6, s11 !	#
#################################
PRINT_TILEMAP:	
	addi	sp, sp, -16
	sw		ra, 0(sp)
	sw		a1, 4(sp)
	sw		a2, 8(sp)
	
	lbu		a4, 0(a0)	# largura em tiles
	lbu		a5, 1(a0)	# altura em tiles
	lbu		a6, 2(a0)	# lado de 1 tile
	
	sw		a4, 12(sp)
	
	addi	a0, a0, 3
WHILE_TILES:
	# a principio cada tile deve ser impressa normalmente
	# => flags de impressões modificadas zeradas
	la		t0, inversoH_TLM
	sb		zero, 0(t0)
	la		t0, inversoV_TLM
	sb		zero, 0(t0)
	la		t0, inversoHV_TLM
	sb		zero, 0(t0)
	la		t0, transposto_TLM
	sb		zero, 0(t0)
	la		t0, transpostoH_TLM
	sb		zero, 0(t0)
	
	# carrega em a0 a label da tile de acordo com o número no tilemap
	mv		s11, a0
	lbu		a0, 0(a0)
	call	FETCH_TILE	# também decide se a impressão deve ser não-padrão
	
	# verifica se a impressão deve ser não-padrão
	la		t0, inversoH_TLM
	lbu		t0, 0(t0)
	bnez	t0, tileEspelhadaH	
	la		t0, inversoV_TLM
	lbu		t0, 0(t0)
	bnez	t0, tileEspelhadaV	
	la		t0, inversoHV_TLM
	lbu		t0, 0(t0)
	bnez	t0, tileEspelhadaHV	
	la		t0, transposto_TLM
	lbu		t0, 0(t0)
	bnez	t0, tileTransposta	
	la		t0, transpostoH_TLM
	lbu		t0, 0(t0)
	bnez	t0, tileTranspostaH
	
	# impressão padrão
	call	PRINT
	j		NEXT_TILE
	
tileEspelhadaH:
	call	PRINT_INVERSEH
	j		NEXT_TILE
tileEspelhadaV:
	call	PRINT_INVERSEV
	j		NEXT_TILE
tileEspelhadaHV:
	call	PRINT_INVERSEHV
	j		NEXT_TILE
tileTransposta:
	call	PRINT_TRANSPOSE
	j		NEXT_TILE
tileTranspostaH:
	call	PRINT_TRANSPOSEH
	
NEXT_TILE:
	# atualiza a posição para impressão da próxima tile
	mv		a0, s11
	addi	a0, a0, 1
	add		a1, a1, a6
	addi	a4, a4, -1
	bgtz	a4, WHILE_TILES
	
	lw		a1, 4(sp)
	add		a2, a2, a6
	lw		a4, 12(sp)
	addi	a5, a5, -1
	bgtz	a5, WHILE_TILES
	
	# sem mais tiles, a função está terminada
	lw		ra, 0(sp)
	lw		a1, 4(sp)
	lw		a2, 8(sp)
	lw		a4, 12(sp)
	addi	sp, sp, 16
	ret	
