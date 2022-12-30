PrintTranspostoH:
	addi	sp, sp, -16
	sw	ra, 0(sp)
	sw	a1, 4(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	
	li	t0, 0xFF0
	add	t0, t0, a3	
	slli	t0, t0, 20	# end base
	
	add	t0, t0, a1	# end base + x
	li	t1, 320
	mul	t1, t1, a2
	add	t0, t0, t1	# end do primeiro byte
	
	lw	t1, 0(a0)	# largura da sprite
	lw	t2, 4(a0)	# altura da sprite
	mv	a2, t2
	
	addi	t3, a0, 8
	li	t4, 0		# cont de colunas
	li	t5, 0		# cont de linhas
linhaTranspostaH:	
	lbu	t6, 0(t3)	
	jal	CalculaEndTranspostoH	# retorno em a1
	sb	t6, 0(a1)
	
	addi	t3, t3, 1
	addi	t4, t4, 1
	bltu	t4, t1, linhaTranspostaH
	
	li	t4, 0
	addi	t5, t5, 1
	bltu	t5, t2, linhaTranspostaH
	
	lw	ra, 0(sp)
	lw	a1, 4(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	addi	sp, sp, 16
	ret

CalculaEndTranspostoH:
	addi	a2, a2, -1
	li	a1, 320
	mul	a1, a1, t4
	add	a1, a1, t5	# novo offset do base (offset do transposto)	
	add	a1, a1, t0	# end do transposto
	
	add	a1, a1, a2	# end do inverso H
	add	a1, a1, t4
	li	a3, 6
	mul	a3, a3, t5
	add	a1, a1, a3
	ret