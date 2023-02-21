.data   
	.eqv	FRAME_ADDRESS	0xFF200604			# memory address where value of frame being shown is kept

# https://pokemondb.net/pokedex/all
    STRUCT_BULBASAUR:   .byte
    1       # pokedex ID
    45      # HP
    49      # attack
    49      # defense 
    65      # sp. attack
    65      # sp. deffense
    45      # speed
    71      # 1st type, 'G'rass
    80      # 2nd type, 'P'oison
    5       # lvl
    0       # exp

    STRUCT_CHARMANDER:   .byte
    4       # pokedex ID
    39      # HP
    52      # attack
    43      # defense 
    60      # sp. attack
    50      # sp. deffense
    65      # speed
    70      # 1st type, 'F'ire
    0       # 2nd type, '' (none)
    5       # lvl
    0       # exp

    .include "ALL_DATAS.data"


.text   # https://www.youtube.com/watch?v=2l4FGPkDwss&t=155s
    MAIN:
        la      a0, STRUCT_BULBASAUR
        la      a1, STRUCT_CHARMANDER
        call    FIGHT
    
    fpg:    j   fpg

.include "ALL_FUNCTIONS.s"