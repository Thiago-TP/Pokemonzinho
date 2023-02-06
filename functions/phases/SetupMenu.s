.data
.eqv	menuX	0
.eqv	menuY	0

.text
SetupMenu:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	call	ImprimeMenu	# inicializa
	
	li	a0, '>'
	li	a1, menuX
	addi	a1, a1, 8
	li	a2, menuY
	addi	a2, a2, 8
	li	a3, FRAME_ADDRESS
	lw	a4, 0(a3)
MenuLoop:		
	li	t0, 0xFF200000	
	lw	t1, 0(t0)
	andi	t1, t1, 1
	beqz	t1, MenuLoop
	
	lw	t0, 4(t0)
	li	t1, '\n'
	beq	t0, t1, ItemOuSai
	li	t1, 'w'
	beq	t0, t1, hoverItem
	li	t1, 's'
	beq	t0, t1, hoverItemOuSai

	j	MenuLoop
fimSetupMenu:
	li	a1, menuX
	li	a2, menuY	
	li	t0, FRAME_ADDRESS
	lw	a3, 0(t0)
	li	a4, 144
	li	a5, 48
	call	EscondeSprite	# apaga o menu

	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret

hoverItem:
	li	a3, 0x0000ff07
	call	PRINT_CHAR
	addi	a2, a2, 8
	li	a3, 0x0000ffff
	call	PRINT_CHAR
	addi	a2, a2, -8
	li	a5, 0	
	j	MenuLoop
hoverItemOuSai:
	addi	a2, a2, 8
	li	a3, 0x0000ff07
	call	PRINT_CHAR
	addi	a2, a2, -8
	li	a3, 0x0000ffff
	call	PRINT_CHAR
	li	a5, 1	
	j	MenuLoop

ItemOuSai:
	beqz	a5, usaItem
	j	fimSetupMenu
usaItem:
	la	t0, item
	lbu	t1, 0(t0)
	xori	t1, t1, 1
	sb	t1, 0(t0)	# flag de item alterada
	j	fimSetupMenu
###


.data
ON:		.string "ON"
OFF:		.string "OFF"
SHOES:		.string	"SHOES"
CONTINUE:	.string "CONTINUE"
REPELENT:	.string "REPELENT"

tilemap_menu:	.byte 15, 5, 8,
1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3,	
4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6,	# Shoes off/on
4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6,	# Repelent off/on
4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6,	# Continue
7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9

.text
ImprimeMenu:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	la	a0, tilemap_menu
	li	a1, menuX
	li	a2, menuY
	li	a3, FRAME_ADDRESS
	lw	a3, 0(a3)
	call	PRINT_TILEMAP
	
	la	a0, SHOES
	addi	a1, a1, 16
	addi	a2, a2, 8
	mv	a4, a3
	li	a3, 0x0000ff00
	call	PRINT_STRING
	
	la	a0, item
	lbu	a0, (a0)
	beqz	a0, shoesOff
	la	a0, ON
	li	a3, 0x0000ff34
	j	printShoesState
shoesOff:
	la	a0, OFF
	li	a3, 0x0000ff05	
printShoesState:
	addi	a1, a1, 72
	call	PRINT_STRING
	
	la	a0, REPELENT
	addi	a1, a1, -72
	addi	a2, a2, 8
	li	a3, 0x0000ff00
	call	PRINT_STRING
	
	la	a0, repelent
	lbu	a0, (a0)
	beqz	a0, repelentOff
	la	a0, ON
	li	a3, 0x0000ff34
	j	printRepelentState
repelentOff:
	la	a0, OFF
	li	a3, 0x0000ff05	
printRepelentState:
	addi	a1, a1, 72
	call	PRINT_STRING
	
	la	a0, CONTINUE
	addi	a1, a1, -72
	addi	a2, a2, 8
	li	a3, 0x0000ff00
	call	PRINT_STRING
	
	li	a0, '>'
	li	a1, menuX
	addi	a1, a1, 8
	addi	a2, a2, -8
	li	a3, 0x0000ff07
	call	PRINT_CHAR
	
	li	a5, 0			# flag de exit
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
