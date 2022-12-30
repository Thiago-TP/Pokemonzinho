PrintTransposto:
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
	
	addi	t3, a0, 8
	li	t4, 0		# cont de colunas
	li	t5, 0		# cont de linhas
linhaTransposta:
	lbu	t6, 0(t3)	
	jal	CalculaEndTransposto	# retorno em a1
	sb	t6, 0(a1)
	addi	t3, t3, 1
	addi	t4, t4, 1
	bltu	t4, t1, linhaTransposta
	
	li	t4, 0
	addi	t5, t5, 1
	bltu	t5, t2, linhaTransposta
	
	lw	ra, 0(sp)
	lw	a1, 4(sp)
	addi	sp, sp, 8
	ret

CalculaEndTransposto:
	li	a1, 320
	mul	a1, a1, t4
	add	a1, a1, t5	# novo offset do base (offset do transposto)	
	add	a1, a1, t0	# end do transposto
	ret