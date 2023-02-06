# Verifica colisoes finas
VerificaColisao:	# a1 = candidato a x, a2 = candidato a y
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	s10, player
	lhu	s10, 2(s10)
	slt	s10, s10, a2		# flag de descida
	
	la	t0, bateu
	li	a3, 0			# flag de colisao
	li	a4, 0			# flag de ledge
	sb	a3, 0(t0)
	la	t0, fase
	lbu	t0, 0(t0)
	beqz	t0, colisao0		# colisao da fase 0
	li	t1, 1
	beq	t0, t1, colisao1	# colisao da fase 1
	li	t1, 2
	beq	t0, t1, colisao2	# colisao da fase 2
	
fimVerificaColisao:
	la	t0, bateu
	sb	a3, 0(t0)
	
	beqz	a4, sem_pulo 
	beqz	s10, sem_pulo
	call	PulaDegrau
sem_pulo:	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret

###
colisao0:
	call	colisao_pokeball	# colisao com as pokeballs
	call	colisao_Oak
	j	fimVerificaColisao

colisao_pokeball:	
	li	t0, 182	# 154 + 16 + 12
	bgtu	a1, t0, fimcolisao	# a direita das pballs ?
	li	t0, 122	# 154 - 16 - 16
	bltu	a1, t0, fimcolisao	# a esquerda das pballs ?
	li	t0, 124	# 112 + 12
	bgtu	a2, t0, fimcolisao	# abaixo das pballs ?
	li	t0, 92	# 112 - 20
	bltu	a2, t0, fimcolisao	# acima das pballs ?
	li	a3, 1
	j	fimcolisao	

colisao_Oak:	# colisao com o prof Oak
	li	t0, 168	# 152 + 16 
	bgtu	a1, t0, fimcolisao	# a direita ?
	li	t0, 136	# 152 - 16 
	bltu	a1, t0, fimcolisao	# a esquerda?
	li	t0, 84	# 80 + 4
	bgtu	a2, t0, fimcolisao	# abaixo ?
	li	t0, 66	# 80 - 14
	bltu	a2, t0, fimcolisao	# acima ?
	li	a3, 1
	j	fimcolisao
###

###
colisao1:
	call	colisao_cerca	# colisao com a cerca
	call	colisao_placa	# colisao com a placa
	call	colisao_arvore	# colisao com as arvoresfimcolisao1
	call	colisao_ledge1	# colisao com a ledge mais em baixo, na direita	
	call	colisao_ledge2	# colisao com a ledge mais em baixo, na esquerda
	call	colisao_ledge3	# colisao com a ledge mais em cima, na direita
	j	fimVerificaColisao

colisao_placa:
	li	t0, 128	
	bgtu	a1, t0, fimcolisao	# a direita ?
	li	t0, 100	# 112 - 16 + tol
	bltu	a1, t0, fimcolisao	# a esquerda ?
	li	t0, 126	
	bgtu	a2, t0, fimcolisao	# abaixo ?
	li	t0, 96	# 112 - 20 + tol
	bltu	a2, t0, fimcolisao	# acima ?
	li	a3, 1
	j	fimcolisao

colisao_arvore:
	li	t0, 158	
	bgtu	a1, t0, fimcolisao	# a direita ?
	li	t0, 36
	bgtu	a2, t0, fimcolisao	# abaixo ?
	li	a3, 1
	j	fimcolisao
	
colisao_cerca:
	li	t0, 178 # 194 - 20 + tolerancia
	bltu	a2, t0, fimcolisao
	li	t0, 160
	bltu	a1, t0, ha_colisao
	li	t0, 176 # 192 - 16
	bgtu	a1, t0, ha_colisao
	j	fimcolisao

ha_colisao:
	li	a3, 1
fimcolisao:
	ret
	
colisao_ledge1:	
	li	t0, 128	
	bltu	a1, t0, fimcolisao	# a esquerda ?	
	li	t0, 128	
	bgeu	a2, t0, fimcolisao	# abaixo ?
	li	t0, 100	# 120 - 20 
	bleu	a2, t0, fimcolisao	# acima ?
	li	a3, 1
	li	a4, 1			# flag de ledge
	j	fimcolisao
	
colisao_ledge2:	
	li	t0, 63	
	bgtu	a1, t0, fimcolisao	# a direita ?
	li	t0, 128	
	bgeu	a2, t0, fimcolisao	# abaixo ?
	li	t0, 100	# 112 - 20 + tol
	bltu	a2, t0, fimcolisao	# acima ?
	li	a3, 1
	li	a4, 1
	j	fimcolisao

colisao_ledge3:	
	li	t0, 240	# 256 - 16	
	bleu	a1, t0, fimcolisao	# a esquerda ?	
	li	t0, 48	
	bgeu	a2, t0, fimcolisao	# abaixo ?
	li	t0, 20	# 40 - 20
	bleu	a2, t0, fimcolisao	# acima ?
	li	a3, 1
	li	a4, 1
	j	fimcolisao	
###	


###
PulaDegrau:
	addi	sp, sp, -4
	sw	ra, 0(sp)

	la	t0, player
	lhu	a2, 2(t0)	# y atual
	li	t0, 20
	bleu	a2, t0, pula_ledge3
	li	t0, 100
	bleu	a2, t0, pula_ledge1e2
fimPulaDegrau:
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
	
pula_ledge1e2:	 
	li	s9, 132
	call	TRN_pula
	j	fimPulaDegrau
pula_ledge3:
	li	s9, 52
	call	TRN_pula
	j	fimPulaDegrau
###

###	
TRN_pula:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	t0, player
	lhu	a1, 4(t0)
	lhu	a2, 6(t0)
loopTrnPula:	
	la	t0, player
	sh	a2, 6(t0)
	addi	s0, s0, 1
	li	t0, 4
	remu	s0, s0, t0
	call	AnimaHero
	
	li	a0, jumpIdleTime
	call	Sleep_with_music
	
	li	t0, run_step
	add	a2, a2, t0
	blt	a2, s9, loopTrnPula	

	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
###

###
colisao2:
	j	fimVerificaColisao
###	
	
