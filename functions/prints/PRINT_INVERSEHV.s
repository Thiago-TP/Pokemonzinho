PRINT_INVERSEHV:
	addi	sp, sp, -8
	sw	ra, 0(sp)
	sw	a1, 4(sp)
	
	li	t0, 0xFF0
	add	t0, t0, a3	
	slli	t0, t0, 20	# end base
	
	add	t0, t0, a1	# end base + x
	li	t1, 320
	mul	t1, t1, a2
	add	t0, t0, t1	# end do primeiro byte
	
	lw	t1, 0(a0)	# largura da sprite
	lw	t2, 4(a0)	# altura da sprite
	
	li	t3, 320
	mul	t3, t3, t2
	add	t0, t0, t3
	
	addi	t0, t0, -320
	
	addi	t3, a0, 8
linhaInversaHV:
	lbu	t6, 0(t3)	
	add	a1, t0, t1
	addi	a1, a1, -1
	sb	t6, 0(a1)
	addi	t3, t3, 1
	addi	t1, t1, -1
	bgtz	t1, linhaInversaHV
	
	addi	t0, t0, -320
	lw	t1, 0(a0)
	addi	t2, t2, -1
	bgtz	t2, linhaInversaHV
	
	lw	ra, 0(sp)
	lw	a1, 4(sp)
	addi	sp, sp, 8
	ret
