.data 
	
	Can_Canh:.asciiz"Canh "
	Can_Tan:.asciiz"Tan "
	Can_Nham:.asciiz"Nham "
	Can_Quy:.asciiz"Quy "
	Can_Giap:.asciiz"Giap "
	Can_At:.asciiz"At "
	Can_Binh:.asciiz"Binh "
	Can_Dinh:.asciiz"Dinh "
	Can_Mau:.asciiz"Mau "
	Can_Ky:.asciiz"Ky "
	
	Chi_Ti:.asciiz"Ti"
	Chi_Suu:.asciiz"Suu"
	Chi_Dan:.asciiz"Dan"
	Chi_Mao:.asciiz"Mao"
	Chi_Thin:.asciiz"Thin"
	Chi_Ty:.asciiz"Ty"
	Chi_Ngo:.asciiz"Ngo"
	Chi_Mui:.asciiz"Mui"
	Chi_Than:.asciiz"Than"
	Chi_Dau:.asciiz"Dau"
	Chi_Tuat:.asciiz"Tuat"
	Chi_Hoi:.asciiz"Hoi"
.text
	.globl Tai_CanChi
Tai_CanChi:
	# Can chi cua nam 
	# Truyen nam vao $a0
	# Tra ve: Can -> $v0, Chi -> $v1
	# 
	# DAU THU TUC
	
	# create stack	
	addi $sp,$sp,-28 

	# backup
	sw $ra,($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
	sw $t4,16($sp)
	sw $t5,20($sp)
	sw $a0,24($sp)
	
	# THAN THU TUC
	add $t0,$a0,$zero
	addi $t1,$0,10
	addi $t2,$0,12
	
	div $t0,$t1
	mfhi $t1
	
	div $t0,$t2
	mfhi $t2
Can:	
	beq $t1,0,Canh
	beq $t1,1,Tan
	beq $t1,2,Nham
	beq $t1,3,Quy
	beq $t1,4,Giap
	beq $t1,5,At
	beq $t1,6,Binh
	beq $t1,7,Dinh
	beq $t1,8,Mau
	beq $t1,9,Ky
	
Chi:
	beq $t2,0,Than
	beq $t2,1,Dau
	beq $t2,2,Tuat
	beq $t2,3,Hoi
	beq $t2,4,Ti
	beq $t2,5,Suu
	beq $t2,6,Dan
	beq $t2,7,Mao
	beq $t2,8,Thin
	beq $t2,9,Ty
	beq $t2,10,Ngo
	beq $t2,11,Mui
	
Tai_Ketthuc:
	
	# CUOI THU TUC
	
	# return can/chi
	move $v0,$t4
	move $v1,$t5
	
	# restore
	lw $ra,($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $t2,12($sp)
	lw $t4,16($sp)
	lw $t5,20($sp)
	lw $a0,24($sp)
	
	# delete stack
	addi $sp,$sp,28
	
	# 
	jr $ra
	
########################## CAN #########################
	
Canh:
	la $t4,Can_Canh
	j Chi
Tan:
	la $t4,Can_Tan
	j Chi
Nham:
	la $t4,Can_Nham
	j Chi
Quy:	
	la $t4,Can_Quy
	j Chi
Giap:
	la $t4,Can_Giap
	j Chi
At:
	la $t4,Can_At
	j Chi
Binh:
	la $t4,Can_Binh
	j Chi
Dinh:
	la $t4,Can_Dinh
	j Chi
Mau:
	la $t4,Can_Mau
	j Chi
Ky:
	la $t4,Can_Ky	
	j Chi

############################# CHI #############################	
			
Ti:
	la $t5,Chi_Ti
	j Tai_Ketthuc
Suu:
	la $t5,Chi_Suu
	j Tai_Ketthuc
Dan:
	la $t5,Chi_Dan
	j Tai_Ketthuc
Mao:
	la $t5,Chi_Mao
	j Tai_Ketthuc
Thin: 
	la $t5,Chi_Thin
	j Tai_Ketthuc
Ty:
	la $t5,Chi_Ty
	j Tai_Ketthuc
Ngo:
	la $t5,Chi_Ngo
	j Tai_Ketthuc
Mui:
	la $t5,Chi_Mui
	j Tai_Ketthuc
Than:
	la $t5,Chi_Than
	j Tai_Ketthuc
Dau:
	la $t5,Chi_Dau
	j Tai_Ketthuc
Tuat:
	la $t5,Chi_Tuat
	j Tai_Ketthuc
Hoi:
	la $t5,Chi_Hoi
	j Tai_Ketthuc





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