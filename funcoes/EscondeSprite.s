EscondeSprite:	
	addi	sp, sp, -4
	sw	a4, 0(sp)
	
	li	t0, 0xFF0
	add	t0, t0, a3
	slli	t0, t0, 20
	
	xori	t1, a3, 1
	li	t2, 0xFF0
	add	t2, t2, t1
	slli	t2, t2, 20
	
	add	t0, t0, a1
	li	t1, 320
	mul	t1, t1, a2
	add	t0, t0, t1
	
	add	t2, t2, a1
	add	t2, t2, t1
	
EscondeLinha:
	lbu	t5, 0(t2)
	sb	t5, 0(t0)
	addi	a4, a4, -1
	addi	t2, t2, 1
	addi	t0, t0, 1
	bgtz	a4, EscondeLinha
	
	lw	a4, 0(sp)
	addi	a5, a5, -1
	addi	t0, t0, 320
	sub	t0, t0, a4
	addi	t2, t2, 320
	sub	t2, t2, a4
	bgtz	a5, EscondeLinha
	
	lw	a4, 0(sp)
	addi	sp, sp, 4
	ret