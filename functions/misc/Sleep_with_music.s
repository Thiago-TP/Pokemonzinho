Sleep_with_music:
	addi	sp, sp, -4
	sw	ra, 0(sp)
		
	csrr	s11, time
	add	s11, s11, a0
SleepMsc_loop:
	call	Musica
	csrr	t2, time
	sltu	t2, t2, s11
	bnez	t2, SleepMsc_loop
	
	lw	ra, 0(sp)
	addi	sp, sp, 4
	ret