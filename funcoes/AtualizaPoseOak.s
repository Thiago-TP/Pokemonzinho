AtualizaPoseOak:	
	li	a4, 0			# flag de espelhamento de sprite
	
	la	t0, oak_struct
	lhu	t1, 0(t0)	# x0
	lhu	t2, 2(t0)	# y0
	lhu	t3, 4(t0)	# xf
	lhu	t4, 6(t0)	# yf
	
	sub	t0, t3, t1	# delta x
	bltz	t0, movendoEsquerdaOak
	bgtz	t0, movendoDireitaOak
	sub	t0, t4, t2	# delta y
	bgtz	t0, movendoBaixoOak
	bltz	t0, movendoCimaOak

	j	fimAtualizaOak
movendoEsquerdaOak:
	la	a0, oak_e1
	li	t0, 1
	beq	s0, t0, esq1Oak
	li	t0, 3
	beq	s0, t0, esq2Oak
	j	mudaSpriteOak
	esq1Oak:	la	a0, oak_e2	
		j	mudaSpriteOak
	esq2Oak:	la	a0, oak_e3	
		j	mudaSpriteOak
movendoDireitaOak:
	li	a4, 1
	j	movendoEsquerdaOak
movendoBaixoOak:
	la	a0, oak_s1
	li	t0, 1
	beq	s0, t0, bai1Oak
	li	t0, 3
	beq	s0, t0, bai2Oak
	j	mudaSpriteOak
	bai1Oak:	la	a0, oak_s2
		j	mudaSpriteOak
	bai2Oak:	la	a0, oak_n3
		j	mudaSpriteOak
movendoCimaOak:
	la	a0, oak_n1
	li	t0, 1
	beq	s0, t0, cim1Oak
	li	t0, 3
	beq	s0, t0, cim2Oak
	j	mudaSpriteOak
	cim1Oak:	la	a0, oak_n2
		j	mudaSpriteOak
	cim2Oak:	la	a0, oak_s3
		j	mudaSpriteOak

mudaSpriteOak:
	la	t0, neutro
	sw	a0, 0(t0)
	la	t0, inversoH
	sb	a4, 0(t0)
fimAtualizaOak:
	la	t0, neutro
	lw	a0, 0(t0)
	#la	t0, inverso
	#lbu	a4, 0(t0)
	
	ret
