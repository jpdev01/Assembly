.data
breakLine: 
	.asciiz "\n"
errorMessage:
	.asciiz "ERRO"

.text
.globl main

main:
	li $t0, -1 # t0 = -1, entrada para finalizar a aplicacao
input:
	li $v0, 5 # Ler inteiro
	syscall
calculate:
	beq $v0, $t0, avarage # se $t0 == $t1 pula para calcular a media
	add  $t1, $t1, $v0 # soma total
	addi $t2, $t2, 1 # quantidade de valores digitados
	
	jal input # jump para entrada de valores
avarage: # calcular media e armazena em t3
	move $t3, $t1
	div $t3, $t2
	mflo $t3
print:
	move $a0, $t1
	li $v0, 1
	syscall # imprime a soma de valores
	
	la $a0, breakLine
	li $v0, 4 # quebra de linha
	syscall
	
	beqz $t2, printError # se quantidade = 0, vai para printError
	move $a0, $t3
	li $v0, 1
	syscall # imprime media
	
	jal end # finaliza o programa
printError:
	la $a0, errorMessage # set errorMessage para parametr de print string
	li $v0, 4 # imprime string
	syscall
end:
	li $v0, 10 # encerra o programa
	syscall
	
