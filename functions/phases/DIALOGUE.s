.data
tutorial:	.string "Use WASD to move around, and ENTER to open the menu. Press ENTER very near to a pokeball to choose your starter. Press ENTER on the carpet to leave the area."
placa1:	.string	"Gym ahead." 
placa2:	.string	"Watch out for wild Eevees."

.text
DIALOGUE:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	t0, fase
	lbu	t0, 0(t0)
	
	beqz	t0, dialogo0
	li	t1, 1
	beq	t0, t1, dialogo1
	li	t1, 2
	beq	t0, t1, dialogo2
fimDialogo:	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret	

dialogo0:
	la	t0, player
	lhu	a1, 0(t0)
	lhu	a2, 2(t0)
	call	GuardaFundo
	
	li	a5, FRAME_ADDRESS
	lw	a3, 0(a5)
	
	xori	a3, a3, 1
	la	a0, neutro
	lw	a0, 0(a0)
	call	PRINT
	
	la	a0, tutorial
	li	a1, 24
	li	a2, 28
	mv	a4, a3
	li	a3, 0x00f6c700
	
	sw	a4, 0(a5)
	call	PRINT_STRING

	li	a0, readTime
	call	Sleep_with_music
	
	li	a1, 0
	li	a2, 28
	xori	a4, a4, 1
	sw	a4, 0(a5)
	xori	a3, a4, 1
	li	a4, 320
	li	a5, 48
	call	EscondeSprite
	
	la	t0, player
	lhu	a1, 0(t0)
	lhu	a2, 2(t0)
	call	ImprimeFundo
	
	j	fimDialogo
	
dialogo1:
	la	t0, player
	lhu	a1, 0(t0)
	lhu	a2, 2(t0)
	call	GuardaFundo
	
	li	a5, FRAME_ADDRESS
	lw	a3, 0(a5)
	
	xori	a3, a3, 1
	la	a0, neutro
	lw	a0, 0(a0)
	call	PRINT
	
	la	a0, placa1
	li	a1, 80
	li	a2, 88
	mv	a4, a3
	sw	a4, 0(a5)
	li	a3, 0x0000ff07
	call	PRINT_STRING
	la	a0, placa2
	addi	a2, a2, 8
	call	PRINT_STRING

	li	a0, readTime
	call	Sleep_with_music
	
	li	a1, 80
	li	a2, 88
	xori	a4, a4, 1
	sw	a4, 0(a5)
	xori	a3, a4, 1
	li	a4, 240
	li	a5, 16
	call	EscondeSprite
	
	la	t0, player
	lhu	a1, 0(t0)
	lhu	a2, 2(t0)
	call	ImprimeFundo
	
	j	fimDialogo
	
dialogo2:	
	j	fimDialogo
