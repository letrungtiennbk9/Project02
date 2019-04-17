.data
	Tai_HaiNamNhuan: .asciiz "Hai nam nhuan gan nhat voi "
	Tai_2LeapYearKQ: .asciiz " la: "
	Tai_LeapAnd: .asciiz" va "
.text
	# Tim hai nam nhuan gan nhat truoc va sau
	# Nam truyen vao : $a0
	# Ket qua: hai nam nhuan gan nhat lan luot luu vao $v0 va $v1
	
	# DAU THU TUC
	
	# backup
	addi $sp,$sp,-28
	sw $s0,($sp)	# $s0 is the smaller leap year
	sw $s1,4($sp)	# $s1 is the larger leap year 
	sw $s2,8($sp)	# $s2 as 4,100 and 400 
	sw $t0,12($sp)	# $t0 is template year to find smaller and larger leap year when the year is not leap year
	sw $t1,16($sp)	# $t1 is $a0, also the year
	sw $t2,20($sp)  # $t2 is $hi when (the year) / 4
	sw $t3,24($sp)  # $t3 is $hi when (the year) / 100
	sw $t4,28($sp)  # $t4 is $hi when (the year) / 400
		
	# THAN THU TUC
	add $t1,$a0,$0
	addi $s2,$s2,4
	
	slt $t0,$t1,$s2
	beq $t0,1,LessThanFour
	j NotLessThanFour
	
LessThanFour:
	li $s0,4
	li $s1,8
	j Tai_2LeapEnd

NotLessThanFour:
	beq $t1,$s2,IsFour
	j LargeThanFour

IsFour:
	li $s0,8
	li $s1,12
	j Tai_2LeapEnd
	
LargeThanFour:
	# $s2 = 4
	div $t1,$s2
	mfhi $t2
	
	li $s2,100
	div $t1,$s2
	mfhi $t3
	
	li $s2,400
	div $t1,$s2
	mfhi $t4
	
	beq $t4,$0,Leap1
	j isLeap2
	
Leap1:
	subi $s0,$t1,4
	addi $s1,$t1,4
	j Tai_2LeapEnd
	
isLeap2:
	beq $t2,$0,nextLeap2
	j notLeap0
	
nextLeap2:
	beq $t3,$0,notLeap0
	j Leap1

notLeap0:
	addi $t0,$t1,4
	addi $t2,$0,4	
	j notLeap1
	
notLeap1:
	div $t0,$t2
	mfhi $s1
	beq $s1,$0,notLeapEnd
	subi $t0,$t0,1
	j notLeap1
	
notLeapEnd:
	sub $s0,$t0,$t2
	add $s1,$t0,$0
	j Tai_2LeapEnd
	
Tai_2LeapEnd:
	
	# CUOI THU TUC
	li $v0,4
	la $a0,Tai_HaiNamNhuan
	syscall
	
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0,4
	la $a0,Tai_2LeapYearKQ
	syscall
		
	li $v0,1
	move $a0,$s0
	syscall
	
	li $v0,4
	la $a0,Tai_LeapAnd
	syscall
	
	li $v0,1
	move $a0,$s1
	syscall
	
	# return
	move $v0,$s0
	move $v1,$s1
	
	# restore
	lw $s0,($sp)
	lw $s1,4($sp)
	lw $s2,8($sp)
	lw $t0,12($sp)
	lw $t1,16($sp)
	lw $t2,20($sp)
	lw $t3,24($sp)
	lw $t4,28($sp)
	
	#delete stack
	addi $sp,$sp,28
	
	jr $ra
	
	
	
