CHOOSE_MAP_FR:
	bnez	s0,JUMP_MAP_FR0			# verifica se s0 � diferente de zero para saber qual frame utilizar
	la	a1, POSITION_MAP_FR0			# se s0 for == 0 carrega em t3 a posicao incial relativa ao frame 0
	j	END_CHOOSE_MAP			# pula as escolhas de frame uma vez que j� achamos a posi��o correta
JUMP_MAP_FR0:	
	la	a1, POSITION_MAP_FR1			# se s0 for != 0 carrega em t3 a posicao incial relativa ao frame 1
END_CHOOSE_MAP:
	ret
