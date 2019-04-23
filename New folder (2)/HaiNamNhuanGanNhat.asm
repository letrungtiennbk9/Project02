.data

.text
	.globl Tai_HaiNamNhuanGanNhat

Tai_HaiNamNhuanGanNhat:
	# Tim hai nam nhuan gan nhat voi nam truyen vao
	# Nam truyen vao $a0
	# Ket qua tra ve: $v0 va $v1
	
	# DAU THU TUC

	# create stack
	addi $sp,$sp,-20
	
	# backup
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $t0,8($sp)
	sw $t1,12($sp)
	sw $t2,16($sp)
	
	# THAN THU TUC
	
	addi $t0,$0,4
	slt $t2,$a0,$t0
	beq $t2,1,LessThanFour
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
	
	# CUOI THU TUC
	# return
	move $v0,$t0
	move $v1,$t1
	
	# backup
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $t0,8($sp)
	lw $t1,12($sp)
	lw $t2,16($sp)

	# create stack
	addi $sp,$sp,20

	jr $ra
