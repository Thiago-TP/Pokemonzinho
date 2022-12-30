PrintInversoV:
	li	t0, 0xFF0
	add	t0, t0, a3	
	slli	t0, t0, 20	# end base
	
	add	t0, t0, a1	# end base + x
	li	t1, 320
	mul	t1, t1, a2
	add	t0, t0, t1	# end do primeiro byte
	
	lw	t1, 0(a0)	# largura da sprite
	lw	t2, 4(a0)	# altura da sprite
	
	li	t4, 320
	mul	t4, t4, t2
	add	t0, t0, t4	# end do primeiro byte da ultima linha
	
	addi	t0, t0, -320
	
	addi	t6, a0, 8	# t6 <- end da primeira cor na sprite
linhaInversaV:
	lbu	t5, 0(t6)
	sb	t5, 0(t0)
	addi	t6, t6, 1
	addi	t0, t0, 1
	addi	t1, t1, -1
	bgtz	t1, linhaInversaV
	
	lw	t1, 0(a0)
	li	t4, 320
	sub	t0, t0, t4
	sub	t0, t0, t1
	addi	t2, t2, -1
	bgtz	t2, linhaInversaV
	
	ret
