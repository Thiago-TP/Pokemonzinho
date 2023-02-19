#########################################
# 		Argumentos		#
#					#
# a0 = mapeamento do tile		#
#					#
#	   	Retorno			#
#					#
# a1 = endereço da tile do mapeamento	#
#					#
#########################################
DecideTile:
	lb 	a1, 0(a0)				# carrego em t0 o valor do endereço em a0
	li	t0, 0
	mv	a5,zero
	beq	a1, t0, tile0
	li	t0, 1
	beq	a1, t0, tile1
	li	t0, 2
	beq	a1, t0, tile2
	li	t0, 3
	beq	a1, t0, tile3
	li	t0, 4
	beq	a1, t0, tile4
	li	t0, 5
	beq	a1, t0, tile5
	li	t0, 6
	beq	a1, t0, tile6
	li	t0, 7
	beq	a1, t0, tile7
	li	t0, 8
	beq	a1, t0, tile8
	li	t0, 9
	beq	a1, t0, tile9
	li	t0, 10
	beq	a1, t0, tile10
	li	t0, 11
	beq	a1, t0, tile11
	li	t0, 12
	beq	a1, t0, tile12
	li	t0, 13
	beq	a1, t0, tile13
	li	t0, 14
	beq	a1, t0, tile14
	li	t0, 15
	beq	a1, t0, tile15
	li	t0, 16
	beq	a1, t0, tile16
	li	t0, 17
	beq	a1, t0, tile17
	li	t0, 18
	beq	a1, t0, tile18
	li	t0, 19
	beq	a1, t0, tile19
	li	t0, 20
	beq	a1, t0, tile20
	li	t0, 21
	beq	a1, t0, tile21
	li	t0, 22
	beq	a1, t0, tile22
	li	t0, 23
	beq	a1, t0, tile23
	li	t0, 24
	beq	a1, t0, tile24
	li	t0, 25
	beq	a1, t0, tile25
	li	t0, 26
	beq	a1, t0, tile26
	li	t0, 27
	beq	a1, t0, tile27
	li	t0, 28
	beq	a1, t0, tile28
	li	t0, 29
	beq	a1, t0, tile29
	li	t0, 30
	beq	a1, t0, tile30
	li	t0, 31
	beq	a1, t0, tile31
	li	t0, 32
	beq	a1, t0, tile32
	li	t0, 33
	beq	a1, t0, tile33
	li	t0, 34
	beq	a1, t0, tile34
	li	t0, 35
	beq	a1, t0, tile35
	li	t0, 35
	beq	a1, t0, tile35
	li	t0, 36
	beq	a1, t0, tile36
	li	t0, 37
	beq	a1, t0, tile37
	li	t0, 38
	beq	a1, t0, tile38
	li	t0, 39
	beq	a1, t0, tile39
	li	t0, 40
	beq	a1, t0, tile40
	li	t0, 41
	beq	a1, t0, tile41
	li	t0, 42
	beq	a1, t0, tile42
	li	t0, 43
	beq	a1, t0, tile43
	li	t0, 44
	beq	a1, t0, tile44
	li	t0, 45
	beq	a1, t0, tile45
	li	t0, 46
	beq	a1, t0, tile46
	li	t0, 47
	beq	a1, t0, tile47
	li	t0, 48
	beq	a1, t0, tile48
	li	t0, 49
	beq	a1, t0, tile49
	li	t0, 50
	beq	a1, t0, tile50
	li	t0, 51
	beq	a1, t0, tile51
	li	t0, 52
	beq	a1, t0, tile52
	li	t0, 53
	beq	a1, t0, tile53
	li	t0, 54
	beq	a1, t0, tile54
	li	t0, 55
	beq	a1, t0, tile55
	li	t0, 56
	beq	a1, t0, tile56
fimDecideTile:
	ret
	
tile0:	la	a1, tile_labfloor
	j	fimDecideTile	
tile1:	la	a1, tile_m1
	j	fimDecideTile
tile2:	la	a1, tile_m2
	j	fimDecideTile
tile3:	la	a1, tile_m1
	li	a5,1
	j	fimDecideTile
tile4:	la	a1, tile_m2
	#la	t0, transposto_TLM
	#li	t0, 1
	#sb	t0, 0(t0)
	j	fimDecideTile
tile5:	la	a1, tile_m5
	j	fimDecideTile
tile6:	la	a1, tile_m2
	#la	t0, transpostoH_TLM
	#li	t0, 1
	#sb	t0, 0(t0)
	j	fimDecideTile
tile7:	la	a1, tile_m1
	li	a5,1
	j	fimDecideTile
tile8:	la	a1, tile_m2
	li	a5,1
	j	fimDecideTile
tile9:	la	a1, tile_m1
	li	a5,1
	j	fimDecideTile
tile10:	la	a1, exit_carpet
	j	fimDecideTile
tile11:	la	a1, exit_carpet
	li	a5,1
	j	fimDecideTile
tile12:	la	a1, tile_darkfloor
	j	fimDecideTile
tile13:	la	a1, tile_labwall
	j	fimDecideTile
tile14:	la	a1, tile_treetop
	j	fimDecideTile
tile15:	la	a1, tile_treetop
	li	a5,1
	j	fimDecideTile
tile16:	la	a1, tile_tallgrass
	j	fimDecideTile
tile17:	la	a1, tile_grass1
	j	fimDecideTile
tile18:	la	a1, tile_grass2
	j	fimDecideTile
tile19:	la	a1, tile_grass3
	j	fimDecideTile
tile20:	la	a1, tile_grass4
	j	fimDecideTile
tile21:	la	a1, tile_treemid
	j	fimDecideTile
tile22:	la	a1, tile_treemid
	li	a5,1
	j	fimDecideTile
tile23:	la	a1, tile_treetrunk
	j	fimDecideTile
tile24:	la	a1, tile_treetrunk
	li	a5,1
	j	fimDecideTile
tile25:	la	a1, tile_yellowledgeleft
	j	fimDecideTile
tile26:	la	a1, tile_yellowledgeleft
	li	a5,1
	j	fimDecideTile
tile27:	la	a1, tile_yellowledgemiddle
	j	fimDecideTile
tile28:	la	a1, tile_flower
	j	fimDecideTile
tile29:	la	a1, tile_greenledgeleft
	j	fimDecideTile
tile30:	la	a1, tile_greenledgeleft
	li	a5,1
	j	fimDecideTile
tile31:	la	a1, tile_greenledgemiddle
	j	fimDecideTile
tile32:	la	a1, tile_plaque
	j	fimDecideTile
tile33:	la	a1, tile_fencehor
	j	fimDecideTile
tile34:	la	a1, tile_fenceL
	j	fimDecideTile
tile35:	la	a1, tile_fenceL
	li	a5,1
	j	fimDecideTile
tile36:	la	a1, tile_treetop2
	j	fimDecideTile
tile37:	la	a1, tile_treetop2
	li	a5,1
	j	fimDecideTile
tile38:	la	a1, tile_treemid2
	j	fimDecideTile
tile39:	la	a1, tile_treemid2
	li	a5,1
	j	fimDecideTile
tile40:	la	a1, tile_yellow1
	j	fimDecideTile
tile41:	la	a1, tile_yellow2
	j	fimDecideTile
tile42:	la	a1, tile_yellow3
	j	fimDecideTile
tile43:	la	a1, tile_yellow4
	li	a5,1
	j	fimDecideTile
tile44:	la	a1, tile_yellow7
	j	fimDecideTile
tile45:	la	a1, tile_yellow5
	j	fimDecideTile
tile46:	la	a1, tile_yellow6
	j	fimDecideTile
tile47:	la	a1, tile_yellow6
	li	a5,1
	j	fimDecideTile	
tile48:	la	a1, tile_yellow4
	j	fimDecideTile
tile49:	la	a1, tile_yellow7
	li	a5,1
	j	fimDecideTile
tile50:	la	a1, tile_yellow8
	j	fimDecideTile
tile51:	la	a1, tile_battleMSG1
	j	fimDecideTile
tile52:	la	a1, tile_battleMSG2
	j	fimDecideTile
tile53:	la	a1, tile_battleMSG2
	#la	t0, transposto_TLM
	#li	t0, 1
	#sb	t0, 0(t0)
	j	fimDecideTile
tile54:	la	a1, tile_battleMSG3
	j	fimDecideTile
tile55:	la	a1, tile_battleMSG1
	li	a5,1
	j	fimDecideTile
tile56:	la	a1, tile_battleMSG2
	li	a5,1
	j	fimDecideTile