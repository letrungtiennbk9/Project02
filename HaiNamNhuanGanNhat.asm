.data
	TwoLeap_print1: .asciiz "Hai nam nhuan gan voi "
	TwoLeap_is: .asciiz " nhat la "
	TwoLeap_and: .asciiz " va "
.text
	.globl Tai_HaiNamNhuanGanNhat

Tai_HaiNamNhuanGanNhat:
	# Tim hai nam nhuan gan nhat voi nam truyen vao
	# Nam truyen vao $a0
	# Ket qua tra ve: $v0 va $v1
	
	# DAU THU TUC
	# backup
	addi $sp,$0,-16

	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $t0,8($sp)
	sw $t1,12($sp)

	# create stack
	#addi $sp,$zero,-40

	addi $t0,$0,4
	slt $s0,$a0,$t0
	beq $s0,1,LessThanFour
	j NotLessThanFour
	
	LessThanFour:
		addi $t0,$0,4
		addi $t1,$0,8
		j TwoLeap_return
	
	NotLessThanFour:
		beq $a0,4,isFour
		j BiggerThanFour
	
		isFour:
			addi $t0,$0,8
			addi $t1,$0,12
			j TwoLeap_return

		BiggerThanFour:	
			# Kiem tra $a0 co phai nam nhuan
			jal LaNamNhuan
			beq $v0,1,pre_Leap
			j pre_notLeap

			# is Leap
			pre_Leap:
				subi $t0,$a0,4
				addi $t1,$a0,4
				j Leap_Smaller

				Leap_Smaller:
					move $a0,$t0
					jal LaNamNhuan
					beq $v0,$0,re_Leap_Smaller
					j Leap_Bigger

				re_Leap_Smaller:
					subi $t0,$t0,4
					j Leap_Smaller

				Leap_Bigger:
					move $a0,$t1
					jal LaNamNhuan
					beq $v0,$0,re_Leap_Bigger
					j TwoLeap_return

				re_Leap_Bigger:
					addi $t1,$t1,4
					j Leap_Bigger

			# is not Leap
			pre_notLeap:
				subi $t0,$a0,1
				j NotLeap_Smaller

				NotLeap_Smaller:	
					move $a0,$t0
					jal LaNamNhuan
					beq $v0,$0,re_NotLeap_Smaller

					addi $t1,$t0,4
					j NotLeap_Bigger

				re_NotLeap_Smaller:
					subi $t0,$t0,1
					j NotLeap_Smaller

				NotLeap_Bigger:	
					move $a0,$t1
					jal LaNamNhuan
					beq $v0,$0,re_NotLeap_Bigger

					j TwoLeap_return

				re_NotLeap_Bigger:
					addi $t1,$t1,4
					j NotLeap_Bigger
	
TwoLeap_return:
	li $v0,4
	la $a0,TwoLeap_print1
	syscall
	
	li $v0,1
	lw $a0,4($sp)
	syscall

	li $v0,4
	la $a0,TwoLeap_is
	syscall

	li $v0,1
	move $a0,$t0
	syscall

	li $v0,4
	la $a0,TwoLeap_and
	syscall

	li $v0,1
	move $a0,$t1
	syscall

	move $v0,$t0
	move $v1,$t1

	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $t0,8($sp)
	lw $t1,12($sp)

	addi $sp,$sp,16

	jr $ra
