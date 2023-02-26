#########################################
# 					#
#					#
#	Não recebe nada como arg	#
#	e  não retorna nada		#
#					#
#########################################
LOOP_MAP:
	addi	sp,sp,-4
	sw	ra,0(sp)
	la	t0,MOVEMENT
	lb	t1,0(t0)
	bnez	t1,JUMP_KEY_POOL
	la	t0,SETTING_BATTLE_ANIMATION
	lb	t1,0(t0)
	bnez	t1,JUMP_MOVEMENT
	call	KEY_POOL				# chama a função keypool para ver se alguma das teclas a,s,d,w foram
	j	JUMP_MOVEMENT
JUMP_KEY_POOL:
	la	a0,MOVEMENT
	call 	MOVE
	la	t0,INFO_EFFECT1
	la	t1,INFO_EFFECT2
	lb	t2,3(t0)
	li	t3,1
	beq	t2,t3,JUMP_MOVEMENT			# se tiver um efeito com tipo 1 isso quer disser que está ocorrendo um pulo
	lb	t2,3(t1)
	beq	t2,t3,JUMP_MOVEMENT			# se tiver um efeito com tipo 1 isso quer disser que está ocorrendo um pulo
	la 	t0, POSITION_MAP			# carrego em t0 o endereço de posicao inicial p
	lw	t1, 0(t0)
	lw	t2, 4(t0)
	li	t3,16
	rem	t1,t1,t3
	rem	t2,t2,t3
	xor	t3,t1,t2
	bnez	t3,JUMP_MOVEMENT
	sb	zero,0(a0)
JUMP_MOVEMENT:
	xori 	s0, s0, 1				# inverte o valor frame atual (somente o registrador)
	call CHOOSE_MAP_FR
	mv	t3,a1
	la 	t0, POSITION_MAP			# carrego em t0 o endereço de posicao inicial p
	lw 	t1, 4(t0) 				# carrega em t1 a altura da posicao inicial p
	lw 	t2, 0(t0) 				# carrega em t2 a largura da posicao inicial p	
	la 	a0, BIG_ROUTE01				# a0 endereço do mapa que iremos utilizar para essa fase
	lw	t4, 4(t3)				# carrega em t4 a altura da posicao relativa ao frame que colocamos em t3
	lw	t5, 0(t3)				# carrega em t5 a largura da posicao relativa ao frame que colocamos em t3
	bne	t1, t4, JUMP_CHEKS_HEIGHT_WIDTH		# condição feita para printarmos os mapas somente quando a posicao muda
	bne	t2, t5, JUMP_CHEKS_HEIGHT_WIDTH		# condição feita para printarmos os mapas somente quando a posicao muda
	j	JUMP_PRINT_MAP				# como t1 == t4 e t2 == t5 não printamos o mapa e continuamos o fluxo
JUMP_CHEKS_HEIGHT_WIDTH:
	sw	t1, 4(t3)				# se t1 != t4 ou t2 != t5 salvamos em t3 que é o frame escolhido a altura 
	sw	t2, 0(t3)				# se t1 != t4 ou t2 != t5 salvamos em t3 que é o frame escolhido a largura 
	mv 	a4, s0					# movo para a4 o valor em s0 que é relativo ao frame da posicao t3
	call 	PRINT_MAP				# chamo a função print mapa com o frame em a4 como argumento essa função
							# imprime o mapa 640 x 480 no bitmap 320 x 240 lidando com os possiveis
							# valores quebrados das tiles onde devemos printar uma parte de cada uma
	call	SETTING_EFFECTS
JUMP_PRINT_MAP:
	
	############################################################
	# a minha ideia é que a primeira coisa que devemos fazer é #
	# imprimir o mapa se ele tiver se movido do local anterior #
	############################################################
	
	la	t0,SETTING_BATTLE_ANIMATION
	lb	t1,0(t0)
	bnez	t1,JUMP_PRINT_EFFECTS_AND_HERO	
	la	t0,TIMER_HERO
	lw	t0,0(t0)
	csrr	t1,time
	sub	t1,t1,t0
	li	t2,80
	blt	t1,t2,JUMP_RESET_POSE
	mv	a4,s0
	la	a0,BIG_ROUTE01
	call	RECOVER_SPRITE
	la	t0, INFO_HERO
	sb	zero,1(t0)
JUMP_RESET_POSE:
	mv	a4,s0				
	call	PRINT_EFFECTS_AND_HERO		# cuida dos possiveis efeitos existentes quando o personagem pisa em uma tile
						# só implementamos a grama até o momento, também cuida da impressão do personagem
						# já que alguns efeitos podem ser impressos antes e outros depois do personagem
JUMP_PRINT_EFFECTS_AND_HERO:
	call	CHECKS_BATTLE
	li 	t0, 0xFF200604				# carrego em t0 o endereco de controle do frame mostrado no bitmap
	sw 	s0, 0(t0)				# coloco s0 no valor de controle da frame mostrada pelo bitmap
	lw	ra,0(sp)
	addi	sp,sp,4
	ret