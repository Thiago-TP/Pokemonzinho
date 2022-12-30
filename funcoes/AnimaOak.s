AnimaOak:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	a0, oak_struct	# inicializacao de seguranca
	lhu	a1, 0(a0)	# x antigo
	lhu	a2, 2(a0)	# y antigo
	call	GuardaFundo
	
	la	t0, oak_struct
	lhu	a1, 4(t0)	# x novo
	lhu	a2, 6(t0)	# y novo
	li	a3, frameAddress
	lw	a3, 0(a3)
	xori	a3, a3, 1	# frame oculto
	call	AtualizaPoseOak

	la	t0, inversoH
	lbu	t0, 0(t0)
	li	t1, 1
	beq	t1, t0, imprimeInversoOak
	call	Print
	j	fimAnimaOak
imprimeInversoOak:
	call	PrintInversoH
fimAnimaOak:	
	li	t0, frameAddress
	sw	a3, 0(t0)
	
	la	a0, oak_struct	
	lhu	a1, 0(a0)	# x antigo
	lhu	a2, 2(a0)	# y antigo
	call	ImprimeFundo
	
	# atualiza as posicoes
	lhu	a1, 4(a0)	# x novo
	lhu	a2, 6(a0)	# y novo
	sh	a1, 0(a0)
	sh	a2, 2(a0)
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
