.text 
.globl main

main: 
	li $t0, 1 # t0 = 1, valor inicial do fatorial
	
	li $v0, 5 # Ler inteiro
	syscall
calculateFactorial:
	mult $t0, $v0 # muiltiplica $t0 por $v0
	mflo $t0 # armazenar primeiros 32 bits da operacao
	subi $v0, $v0, 1 # $v0--
	bnez $v0, calculateFactorial # se $v0 != 0, continua calculando o fatorial
print:
	move $a0, $t0 # seta o parametro da funcao para o print 
	li $v0, 1 # imprimir inteiro
	syscall
end:
	li $v0, 10 #terminar o programa
	syscall	
