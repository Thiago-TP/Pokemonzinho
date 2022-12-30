AtualizaPoseHero:	
	li	a4, 0
	
	la	t0, player
	lhu	t1, 0(t0)	# x0
	lhu	t2, 2(t0)	# y0
	lhu	t3, 4(t0)	# xf
	lhu	t4, 6(t0)	# yf
	
	la	t5, item
	lbu	t5, 0(t5)
	bnez	t5, correndo
	
	sub	t0, t3, t1	# delta x
	bltz	t0, movendoEsquerda
	bgtz	t0, movendoDireita
	sub	t0, t4, t2	# delta y
	bgtz	t0, movendoBaixo
	bltz	t0, movendoCima

	la	t0, neutro
	lw	a0, 0(t0)
	j	fimAtualizaHero
movendoEsquerda:
	la	a0, hero_e1
	li	t0, 1
	beq	s0, t0, esq1
	li	t0, 3
	beq	s0, t0, esq2
	j	mudaSpriteHero
	esq1:	la	a0, hero_e2	
		j	mudaSpriteHero
	esq2:	la	a0, hero_e3	
		j	mudaSpriteHero
movendoDireita:
	li	a4, 1	
	j	movendoEsquerda
movendoBaixo:
	la	a0, hero_s1
	li	t0, 1
	beq	s0, t0, bai1
	li	t0, 3
	beq	s0, t0, bai2
	j	mudaSpriteHero
	bai1:	la	a0, hero_s2
		j	mudaSpriteHero
	bai2:	la	a0, hero_s2
		li	a4, 1	
		j	mudaSpriteHero
movendoCima:
	la	a0, hero_n1
	li	t0, 1
	beq	s0, t0, cim1
	li	t0, 3
	beq	s0, t0, cim2
	j	mudaSpriteHero
	cim1:	la	a0, hero_n2
		j	mudaSpriteHero
	cim2:	la	a0, hero_n2
		li	a4, 1	
		j	mudaSpriteHero


correndo:	
	sub	t0, t3, t1	# delta x
	bltz	t0, movendoEsquerdaR
	bgtz	t0, movendoDireitaR
	sub	t0, t4, t2	# delta y
	bgtz	t0, movendoBaixoR
	bltz	t0, movendoCimaR

	la	t0, neutro
	lw	a0, 0(t0)
	j	fimAtualizaHero
movendoEsquerdaR:
	la	a0, run_e1
	li	t0, 1
	beq	s0, t0, esq1R
	li	t0, 3
	beq	s0, t0, esq2R
	j	mudaSpriteHero
	esq1R:	la	a0, run_e2	
		j	mudaSpriteHero
	esq2R:	la	a0, run_e3	
		j	mudaSpriteHero
movendoDireitaR:
	li	a4, 1
	j	movendoEsquerdaR
movendoBaixoR:
	la	a0, run_s1
	li	t0, 1
	beq	s0, t0, bai1R
	li	t0, 3
	beq	s0, t0, bai2R
	j	mudaSpriteHero
	bai1R:	la	a0, run_s2
		j	mudaSpriteHero
	bai2R:	la	a0, run_s2
		li	a4, 1	
		j	mudaSpriteHero
movendoCimaR:
	la	a0, run_n1
	li	t0, 1
	beq	s0, t0, cim1R
	li	t0, 3
	beq	s0, t0, cim2R
	j	mudaSpriteHero
	cim1R:	la	a0, run_n2
		j	mudaSpriteHero
	cim2R:	la	a0, run_n2
		li	a4, 1	
		j	mudaSpriteHero



mudaSpriteHero:
	la	t0, neutro
	sw	a0, 0(t0)
	la	t0, inversoH
	sb	a4, 0(t0)
fimAtualizaHero:
	ret
