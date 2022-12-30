.data
.include "AsSpriteTudao.data"
# globais estaticas/imutaveis
.eqv	frameAddress	0xFF200604
.eqv	idleTime	150		# ms, tempo que uma  sprite do trn deve permanecer
.eqv	jumpIdleTime	30
.eqv	readTime	1500		# ms, tempo dado ao jogador para ler a linha de dialogo
.eqv	normal_step	2
.eqv	run_step	4
# globais dinamicas/mutaveis
menu_pkmn:	.byte	0	# flag de utilizacao do menu de selecao do pokemon inicial
lastTime:	.word	0	# registro do tempo da ultima sprite do player impressa
lastTimeMsc:	.word	0	# registro do tempo da ultima nota tocada
noteCount:	.word	0	# contador de notas tocadas
inversoH:	.byte	0	# flag de print inverso na horizontal
inversoH_TLM:	.byte	0	# flag de print inverso horizontal no tilemap
inversoV_TLM:	.byte	0	# flag de print inverso vertical no tilemap
inversoHV_TLM:	.byte	0	# flag de print inverso hor + ver no tilemap
transposto_TLM:	.byte	0	# flag de print transposto no tilemap
transpostoH_TLM:.byte	0	# flag de print transposto + H no tilemap
item:		.byte	0	# flag de item (shoes)
repelent:	.byte	0	# flag de item (repelente)
bateu:		.byte	0	# flag de colisao
fase:		.byte	0	# num da fase atual
fim_da_fase:	.byte	0	# flag de fim da fase
neutro:	.word	0	# sprite neutra (quando sem input)
player:	.half 152, 220,	# x, y atuais
	      152, 220,	# x, y novos
	.byte 0,	# ID do pokemon escolhido
	.byte 0		# ID do pokemon capturado
oak_struct:	.half 152, 220,	# x, y atuais
	      	      152, 220,	# x, y novos		

.text
# Regs do GameLoop
# s0 = estado do player (0 = parado, 1 = andando1, 2 = andando2)
main:
	call	EscolhePokemon	# tela #0 = selecao de pokemon
	call	AreaAberta	# tela #1 = area aberta
	call	Ginasio		# tela #2 = ginasio
	call	TelaFinal	# jogar de novo ?
GameEnd:
	j	GameEnd
.include "AsFuncaoTudao.s"



WildEncounter:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	# verifica se o player esta na fase 1 (area aberta)
	la	t0, fase
	lbu	t0, 0(t0)
	li	t1, 1
	bne	t0, t1, semEncontro
	# verifica se a sprite do player esta num certo estado
	bnez	s0, semEncontro
	# verifica se o player esta em mato alto
	call	PlayerNoMato	# retorno em a0 (1 se true)
	beqz	a0, semEncontro
	# chance aleatoria da luta realmente comecar	
	csrr	t0, time
	li	t1, 100
	remu	t0, t0, t1
	bnez	t0, semEncontro
	# inicia luta entre o jogador e um pokemon selvagem
	call	Porrada
semEncontro:		
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret
		
PlayerNoMato:
	# assume-se que o jogador nao esta no mato alto
	li	a0, 0	
	# pega a posicao (x, y) do jogador no bmp
	la	t0, player
	lhu	t1, 0(t0)	# x 
	lhu	t2, 2(t0)	# y
	# encontra do indice do jogador no tilemap da rota 1
	srli	t1, t1, 4	# X = x // 16
	srli	t2, t2, 4	# Y = y // 16
	la	t0, tilemap_rota1
	addi	t0, t0, 3	# t0 <- end da primeira tile
	add	t0, t0, t1	# end + X
	li	t3, 20
	mul	t2, t2, t3
	add	t0, t0, t2	# end + X + 20Y
	lbu	t0, 0(t0)	# t0 <- byte da tile
	# verifica se o indice eh do mato alto
	li	t1, 16
	bne	t0, t1, fimPlayerNoMato
	li	a0, 1
fimPlayerNoMato:
	ret			
				
Porrada:
	addi	sp, sp, -12
	sw	ra, 0(sp)
	sw	s0, 4(sp)
	sw	s1, 8(sp)
	# animacao de exclamacao
	la	t0, player
	lhu	a1, 0(t0)	# x do player
	lhu	a2, 2(t0)	# y do player
	addi	a1, a1, 8
	call	Exclamacao	# animacao de exclamacao no (x, y) dado
	# s0 = ID do starter
	la	t0, player
	lbu	s0, 8(t0)
	# s1 = ID do pokemon inimigo	
	li	s1, 133		# 133 = ID do Eevee
	# a3 = frame oculto
	li	a3, frameAddress
	lw	a3, 0(a3)
	xori	a3, a3, 1
	# imprime a tela de luta no frame oposto
	call	ImprimeTelaDeLuta
	# mostra a tela	
	li	t0, frameAddress
	sw	a3, 0(t0)

SetupLuta:
	j	SetupLuta
								
	lw	ra, 0(sp)
	lw	s0, 4(sp)
	lw	s1, 8(sp)
	addi	sp, sp, 12
	ret						

.data
tilemap_battleMSG: .byte 18, 6, 8,	# retangulo de mensagens ao usuario
51, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
53, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
53, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
53, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
53, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
55, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56, 56

tilemap_battle_menu: .byte 12, 6, 8,	# menu de opcoes de golpe, run, pkmn
1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3,	
4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6,
4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6,
4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6,
4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6,
7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9
.text
ImprimeTelaDeLuta:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	call	DeixaFundoCinza
	call	PrintBattleBKG
	
	la	a0, lower_battle_circle
	li	a1, 40
	li	a2, 136
	call	Print
	li	a1, 104
	call	PrintInversoH
	
	la	a0, upper_battle_circle
	li	a1, 152
	li	a2, 64
	call	Print
	li	a1, 216
	call	PrintInversoH
	
	call	ImprimePokemons	
	call	ImprimeEstadosDosPkmns
	
	la	a0, tilemap_battleMSG
	li	a1, 40
	li	a2, 152
	call	PrintTilemap
	la	a0, tilemap_battle_menu
	addi	a1, a1, 144
	call	PrintTilemap
	
	call	ImprimeMensagemDeLuta
	call	ImprimeOpcoesDeLuta
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret	

ImprimePokemons:
	ret
ImprimeEstadosDosPkmns:
	ret
ImprimeMensagemDeLuta:
	ret
ImprimeOpcoesDeLuta:
	ret
Exclamacao:
	ret

DeixaFundoCinza:
	addi	sp, sp, -4
	sw	ra, 0(sp)
	
	li	t0, 0xFF0
	add	t0, t0, a3
	slli	t0, t0, 20
	
	li	t2, 76800
fundoCinza:
	lbu	t5, 0(t0)
	call	ByteCinza
	sb	t5, 0(t0)
	addi	t0, t0, 1
	addi	t2, t2, -1
	bgtz	t2, fundoCinza
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret	
									
PrintBattleBKG:
	li	t0, 0xF6F6F6F6
	li	t1, 0xFF0
	add	t1, t1, a3
	slli	t1, t1, 20
	
	addi	t1, t1, 40
	li	t2, 12800
	add	t1, t1, t2
	
	li	t2, 240		# largura
	li	t3, 112		# altura
bkgLine:
	sw	t0, 0(t1)
	addi	t1, t1, 4
	addi	t2, t2, -4
	bgtz	t2, bkgLine
	
	li	t2, 240
	addi	t1, t1, 320
	sub	t1, t1, t2
	addi	t3, t3, -1
	bgtz	t3, bkgLine
	ret
					
.data
# stats dos pokemons de acordo com o pokedex (https://pokemondb.net/pokedex/stats/gen1)
bulbasaur_struct:
.byte	1,	# ID
	45,	# HP								
	71,	# 1o tipo, GRASS	('G')
	80,	# 2o tipo, POISON	('P')	
charmender_struct:
.byte	4,	# ID
	39,	# HP								
	70,	# 1o tipo, FIRE		('F')
	32,	# 2o tipo, NONE		(' ')	
squirtle_struct:
.byte	7,	# ID
	44,	# HP								
	87,	# 1o tipo, WATER	('W')
	32,	# 2o tipo, NONE		(' ')
geodude_struct:
.byte	74,	# ID
	40,	# HP								
	82,	# 1o tipo, ROCK		('R')
	103,	# 2o tipo, GROUND	('g')
onix_struct:
.byte	95,	# ID
	35,	# HP								
	82,	# 1o tipo, ROCK		('R')
	103,	# 2o tipo, GROUND	('g')							
eevee_struct:
.byte	133,	# ID
	55,	# HP								
	78,	# 1o tipo, NORMAL	('N')
	32,	# 2o tipo, NONE		(' ')									
												
	
			
				
					
						
							
								
									
										
											
												
													
														
															
																
																	
																		
																			
																				
																					
																						
																							
																								
																									
																										
																											
																												
																													
																														
																															
																																
																																	
																																			
.text	
Ginasio:
	ret
TelaFinal:
	ret
