	.text
.globl main
main:
	jal INPUT
	lw $a0 ($v0)
	li $v0 1
	syscall 

	li $v0 10
	syscall
