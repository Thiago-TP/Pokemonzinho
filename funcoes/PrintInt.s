#############################################
#  PrintInt                                 #
#  a0    =    valor inteiro                 #
#  a1    =    x                             #
#  a2    =    y  			    #
#  a3    =    cor                           #
#############################################

PrintInt:	addi 	sp, sp, -24			# Aloca espaco
		sw 	ra, 0(sp)			# salva regs
		sw 	a0, 4(sp)			
		sw 	a1, 8(sp)			
		sw 	a2, 12(sp)			
		sw 	a3, 16(sp)			
		sw 	a4, 20(sp)			
		
		la 	t0, TempBuffer			# carrega o Endereco do Buffer da String
		
		bge 	a0, zero, ehposprintInt		# Se eh positvo
		li 	t1, '-'				# carrega o sinal -
		sb 	t1, 0(t0)			# coloca no buffer
		addi 	t0, t0, 1			# incrementa endereco do buffer
		sub 	a0, zero, a0			# torna o numero positivo
		
ehposprintInt:  li 	t2, 10				# carrega numero 10
		li 	t1, 0				# carrega numero de digitos com 0
		
loop1printInt:	
		div 	t4, a0, t2			# divide por 10 (quociente)
		rem 	t3, a0, t2			# resto
		addi 	sp, sp, -4			# aloca espaco na pilha
		sw 	t3, 0(sp)			# coloca resto na pilha
		mv 	a0, t4				# atualiza o numero com o quociente
		addi 	t1, t1, 1			# incrementa o contador de digitos
		bne 	a0, zero, loop1printInt		# verifica se o numero eh zero
				
loop2printInt:	lw 	t2, 0(sp)			# le digito da pilha
		addi 	sp, sp, 4			# libera espaco
		addi 	t2, t2, 48			# converte o digito para ascii
		sb 	t2, 0(t0)			# coloca caractere no buffer
		addi 	t0, t0, 1			# incrementa endereco do buffer
		addi 	t1, t1, -1			# decrementa contador de digitos
		bne 	t1, zero, loop2printInt		# eh o ultimo?
		sb 	zero, 0(t0)			# insere \NULL na string
		
		la 	a0, TempBuffer			# Endereco do buffer da srting
		jal 	PrintString			# chama o print string
				
		lw 	ra, 0(sp)			# recupera regs
		lw 	a0, 4(sp)			
		lw 	a1, 8(sp)			
		lw 	a2, 12(sp)			
		lw 	a3, 16(sp)			
		lw 	a4, 20(sp)			
		addi 	sp, sp, 24			# libera espaco
fimprintInt:	ret					# retorna
