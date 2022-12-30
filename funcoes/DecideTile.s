DecideTile:
	li	t1, 0
	beq	a0, t1, tile0
	li	t1, 1
	beq	a0, t1, tile1
	li	t1, 2
	beq	a0, t1, tile2
	li	t1, 3
	beq	a0, t1, tile3
	li	t1, 4
	beq	a0, t1, tile4
	li	t1, 5
	beq	a0, t1, tile5
	li	t1, 6
	beq	a0, t1, tile6
	li	t1, 7
	beq	a0, t1, tile7
	li	t1, 8
	beq	a0, t1, tile8
	li	t1, 9
	beq	a0, t1, tile9
	li	t1, 10
	beq	a0, t1, tile10
	li	t1, 11
	beq	a0, t1, tile11
	li	t1, 12
	beq	a0, t1, tile12
	li	t1, 13
	beq	a0, t1, tile13
	li	t1, 14
	beq	a0, t1, tile14
	li	t1, 15
	beq	a0, t1, tile15
	li	t1, 16
	beq	a0, t1, tile16
	li	t1, 17
	beq	a0, t1, tile17
	li	t1, 18
	beq	a0, t1, tile18
	li	t1, 19
	beq	a0, t1, tile19
	li	t1, 20
	beq	a0, t1, tile20
	li	t1, 21
	beq	a0, t1, tile21
	li	t1, 22
	beq	a0, t1, tile22
	li	t1, 23
	beq	a0, t1, tile23
	li	t1, 24
	beq	a0, t1, tile24
	li	t1, 25
	beq	a0, t1, tile25
	li	t1, 26
	beq	a0, t1, tile26
	li	t1, 27
	beq	a0, t1, tile27
	li	t1, 28
	beq	a0, t1, tile28
	li	t1, 29
	beq	a0, t1, tile29
	li	t1, 30
	beq	a0, t1, tile30
	li	t1, 31
	beq	a0, t1, tile31
	li	t1, 32
	beq	a0, t1, tile32
	li	t1, 33
	beq	a0, t1, tile33
	li	t1, 34
	beq	a0, t1, tile34
	li	t1, 35
	beq	a0, t1, tile35
	li	t1, 35
	beq	a0, t1, tile35
	li	t1, 36
	beq	a0, t1, tile36
	li	t1, 37
	beq	a0, t1, tile37
	li	t1, 38
	beq	a0, t1, tile38
	li	t1, 39
	beq	a0, t1, tile39
	li	t1, 40
	beq	a0, t1, tile40
	li	t1, 41
	beq	a0, t1, tile41
	li	t1, 42
	beq	a0, t1, tile42
	li	t1, 43
	beq	a0, t1, tile43
	li	t1, 44
	beq	a0, t1, tile44
	li	t1, 45
	beq	a0, t1, tile45
	li	t1, 46
	beq	a0, t1, tile46
	li	t1, 47
	beq	a0, t1, tile47
	li	t1, 48
	beq	a0, t1, tile48
	li	t1, 49
	beq	a0, t1, tile49
	li	t1, 50
	beq	a0, t1, tile50
	li	t1, 51
	beq	a0, t1, tile51
	li	t1, 52
	beq	a0, t1, tile52
	li	t1, 53
	beq	a0, t1, tile53
	li	t1, 54
	beq	a0, t1, tile54
	li	t1, 55
	beq	a0, t1, tile55
	li	t1, 56
	beq	a0, t1, tile56
fimDecideTile:
	ret
	
tile0:	la	a0, tile_labfloor
	j	fimDecideTile	
tile1:	la	a0, tile_m1
	j	fimDecideTile
tile2:	la	a0, tile_m2
	j	fimDecideTile
tile3:	la	a0, tile_m1
	la	t0, inversoH_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile4:	la	a0, tile_m2
	la	t0, transposto_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile5:	la	a0, tile_m5
	j	fimDecideTile
tile6:	la	a0, tile_m2
	la	t0, transpostoH_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile7:	la	a0, tile_m1
	la	t0, inversoV_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile8:	la	a0, tile_m2
	la	t0, inversoV_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile9:	la	a0, tile_m1
	la	t0, inversoHV_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile10:	la	a0, exit_carpet
	j	fimDecideTile
tile11:	la	a0, exit_carpet
	la	t0, inversoH_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile12:	la	a0, tile_darkfloor
	j	fimDecideTile
tile13:	la	a0, tile_labwall
	j	fimDecideTile
tile14:	la	a0, tile_treetop
	j	fimDecideTile
tile15:	la	a0, tile_treetop
	la	t0, inversoH_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile16:	la	a0, tile_tallgrass
	j	fimDecideTile
tile17:	la	a0, tile_grass1
	j	fimDecideTile
tile18:	la	a0, tile_grass2
	j	fimDecideTile
tile19:	la	a0, tile_grass3
	j	fimDecideTile
tile20:	la	a0, tile_grass4
	j	fimDecideTile
tile21:	la	a0, tile_treemid
	j	fimDecideTile
tile22:	la	a0, tile_treemid
	la	t0, inversoH_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile23:	la	a0, tile_treetrunk
	j	fimDecideTile
tile24:	la	a0, tile_treetrunk
	la	t0, inversoH_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile25:	la	a0, tile_yellowledgeleft
	j	fimDecideTile
tile26:	la	a0, tile_yellowledgeleft
	la	t0, inversoH_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile27:	la	a0, tile_yellowledgemiddle
	j	fimDecideTile
tile28:	la	a0, tile_flower
	j	fimDecideTile
tile29:	la	a0, tile_greenledgeleft
	j	fimDecideTile
tile30:	la	a0, tile_greenledgeleft
	la	t0, inversoH_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile31:	la	a0, tile_greenledgemiddle
	j	fimDecideTile
tile32:	la	a0, tile_plaque
	j	fimDecideTile
tile33:	la	a0, tile_fencehor
	j	fimDecideTile
tile34:	la	a0, tile_fenceL
	j	fimDecideTile
tile35:	la	a0, tile_fenceL
	la	t0, inversoH_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile36:	la	a0, tile_treetop2
	j	fimDecideTile
tile37:	la	a0, tile_treetop2
	la	t0, inversoH_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile38:	la	a0, tile_treemid2
	j	fimDecideTile
tile39:	la	a0, tile_treemid2
	la	t0, inversoH_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile40:	la	a0, tile_yellow1
	j	fimDecideTile
tile41:	la	a0, tile_yellow2
	j	fimDecideTile
tile42:	la	a0, tile_yellow3
	j	fimDecideTile
tile43:	la	a0, tile_yellow4
	la	t0, inversoH_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile44:	la	a0, tile_yellow7
	j	fimDecideTile
tile45:	la	a0, tile_yellow5
	j	fimDecideTile
tile46:	la	a0, tile_yellow6
	j	fimDecideTile
tile47:	la	a0, tile_yellow6
	la	t0, inversoH_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile	
tile48:	la	a0, tile_yellow4
	j	fimDecideTile
tile49:	la	a0, tile_yellow7
	la	t0, inversoH_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile50:	la	a0, tile_yellow8
	j	fimDecideTile
tile51:	la	a0, tile_battleMSG1
	j	fimDecideTile
tile52:	la	a0, tile_battleMSG2
	j	fimDecideTile
tile53:	la	a0, tile_battleMSG2
	la	t0, transposto_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile54:	la	a0, tile_battleMSG3
	j	fimDecideTile
tile55:	la	a0, tile_battleMSG1
	la	t0, inversoV_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile
tile56:	la	a0, tile_battleMSG2
	la	t0, inversoV_TLM
	li	t1, 1
	sb	t1, 0(t0)
	j	fimDecideTile