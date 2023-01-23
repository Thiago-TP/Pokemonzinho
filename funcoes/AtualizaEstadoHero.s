AtualizaEstadoHero:
	la	t0, lastTime
	lw	t1, 0(t0)
	
	csrr	t2, time
	sub	t1, t2, t1
		
	li	t3, idleTime
	la	t4, item
	lbu	t4, 0(t4)
	beqz	t4, sem_sapato
	li	t3, run_idleTime
sem_sapato:	
	bltu	t1, t3, fimAtualizaEstado
	
	sw	t2, 0(t0)
	
	addi	s0, s0, 1
	li	t0, 4
	remu	s0, s0, t0		# atualiza o estado
	
	
fimAtualizaEstado:
	ret
