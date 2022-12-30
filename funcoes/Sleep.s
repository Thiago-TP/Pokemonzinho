Sleep:
	csrr	t0, time
	add	t0, t0, a0
Sleep_Loop:
	csrr	t1, time
	sltu	t1, t1, t0
	bnez	t1, Sleep_Loop
	ret