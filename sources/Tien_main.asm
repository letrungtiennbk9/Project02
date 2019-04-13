.data
	a:	.word 0
		.word 0

	b: .asciiz "aaaaa"
.text
.globl main
main:
	la $s0 a
	lw $a0 4($s0)
	li $v0 1
	syscall

	li $v0 10
	syscall