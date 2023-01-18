.data
.include "../sprites/people/hero_e1.data"
.include "tat2.data"
.include "tat3.data"

.text
MAIN:	la	a0, hero_e1
	call	Print
.include "../funcoes/Print.s"