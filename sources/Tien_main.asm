.text
.globl main
main:
	li $a0 2015
	jal LaNamNhuan
	move $a0 $v0
	li $v0 1
	syscall

	li $v0 10
	syscall