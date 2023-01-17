.data

.text
li  s0, 300
li  a0, -10

charLoop:
    li  a7, 11
    ecall

    mv  t0, a0
    li  a0, '\t'
    ecall

    mv  a0, t0
    li  a7, 1
    ecall

    li  a7, 11
    li  a0, '\n'
    ecall

    mv  a0, t0
    addi    a0, a0, 1
    ble a0, s0, charLoop

fpg:    j   fpg
