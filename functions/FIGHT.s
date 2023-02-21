#####################################
#   PLAYER fights a wild pokemon    #
#############################################
#   - Inputs -                              #
#   a0 = PLAYER's starter pokemon's struct  #
#   a1 = wild pokemon's struct              #
#############################################
#   - Outputs -     #
#   kickass fight   #
##################### 
FIGHT:
    addi    sp, sp, -4
    sw      ra, 0(sp)

    call    PRINT_FIGHT_BACKGROUND
    call    PRINT_FIGHTERS
    # call    PRINT_MENU

    # la      a0, bulbasaur_back
    # li      a1, 40
    # li      a2, 104
    # call    PRINT


    li      t0, FRAME_ADDRESS
    sw      a3, 0(t0)

    lw      ra, 0(sp)
    addi    sp, sp, 4
    ret

PRINT_FIGHT_BACKGROUND:
    addi    sp, sp, -12
    sw      ra, 0(sp)
    sw      a0, 4(sp)
    sw      a1, 8(sp)

    la      a0, FIGHT_BACKGROUND 
    li      a1, 40
    li      a2, 40
    li      a3, FRAME_ADDRESS
    lw      a3, 0(a3)
    xori    a3, a3, 1
    call    PRINT

    lw      ra, 0(sp)
    lw      a0, 4(sp)
    lw      a1, 8(sp)
    addi    sp, sp, 12
    ret

PRINT_FIGHTERS:
    addi    sp, sp, -12
    sw      ra, 0(sp)
    sw      a0, 4(sp)
    sw      a1, 8(sp)

    lbu     t0, 0(a0)   # t0 <- PLAYER's pokemon's ID

    li      t1, 1
    beq     t0, t1, SET_BULBA
    li      t1, 4
    beq     t0, t1, SET_MANDER

    PRINT_ENEMY:
        lw      a1, 8(sp)
        lbu     t0, 0(a1)   # t0 <- PC's pokemon's ID

        li      t1, 1
        beq     t0, t1, SET_BULBA
        li      t1, 4
        beq     t0, t1, SET_MANDER

    END_PRINT_FIGHTERS:
    lw      ra, 0(sp)
    lw      a0, 4(sp)
    lw      a1, 8(sp)
    addi    sp, sp, 12
    ret

SET_BULBA:
    la      a0, bulbasaur_back
    li      a1, 68
    li      a2, 104
    call    PRINT
    j       PRINT_ENEMY
SET_MANDER:
    la      a0, charmender_front
    li      a1, 188
    li      a2, 56   
    call    PRINT
    j       END_PRINT_FIGHTERS
