.data
	suu_tb1: .asciiz "Nhap DAY: "
	suu_tb2: .asciiz "Nhap MONTH: "
	suu_tb3: .asciiz "Nhap YEAR: "
	suu_tb4: .asciiz "Du lieu khong hop le !\n"
	dayArr: .word 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
	tempArr: .space 3 
.text
	# - Chuc nang: Cho phep nguoi dung nhap dd, mm, yyyy tu ban phim
	# - Truyen vao dd,mm,yyyy
	# - Tra ve register v0 chua dd, mm,yyyy (dd: 0($v0), mm: 4($v0), yyyy: 8($v0))
	# - Co ham LEAPYEAR de kiem tra nam nhuan ($v0 = 1: nam nhuan, $v0 = 0: khong la nam nhuan)
	
INPUT: # Ham nhap (dd,mm,yyyy)
	addi $sp, $sp, -12
	# backup
	sw $t0,0($sp)
	sw $t1,4($sp)
	sw $t2,8($sp)
	sw $ra,12($sp)
	#nhap DAY
	li $v0, 4
	la $a0, suu_tb1
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	#nhap MONTH
	li $v0, 4
	la $a0, suu_tb2
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	#nhap YEAR
	li $v0, 4
	la $a0, suu_tb3
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	move	$a0, $t0 #dd
	move	$a1, $t1 #mm
	move	$a2, $t2 #yyyy
	# Kiem tra tinh hop le
	jal checkValid
	bne $v0,1,Unaccept
	bne $v0,0,Accept
	lw $t0,0($sp)
	lw $t1,4($sp)
	lw $t2,8($sp)
	lw $ra,12($sp)
	addi $sp, $sp, 12
	jr $ra
Unaccept:
	li $v0, 4
	la $a0, suu_tb4
	syscall
	j INPUT
Accept:
	la $v0, tempArr
	add $v1, $a0, $zero
	sw $v1, 0($v0) # Luu dd vao v0
	add $v1, $a1, $zero
	sw $v1, 4($v0) # Luu mm vao v0
	add $v1, $a2, $zero
	sw $v1, 8($v0) # Luu mm vao v0
checkValid: # Kiem tra du lieu dau vao
	addi	$sp, $sp, -32
	# backup
	sw	$a0, 28($sp)
	sw	$ra, 24($sp)
	sw	$t0, 20($sp)
	sw	$t1, 16($sp)
	sw	$t2, 12($sp)
	sw	$t3, 8($sp)
	sw	$t4, 4($sp)
	sw	$s0, 0($sp)
	move	$t0, $a0 # dd
	move 	$t1, $a1 # mm
	move 	$t2, $a2 # yyyy
	li $t3, 13
	slt $t3, $t1, $t3 # kiem tra xem mm < 13?
	beq $t3,$0,Invalid # mm > 13
	
	# Kiem tra DAY
	la	$s0, dayArr
	addi	$t4, $t1, -1
	sll	$t4, $t4, 2
	add	$s0, $s0, $t4
	lw	$s0, ($s0) # so ngay cua THANG da nhap
	
	li  $t4, 2 
	bne $t1, $t4, dateCheck
	lw  $a0, 28($sp)
	jal LEAPYEAR
	beq	$v0, $0, dateCheck # khong phai nam nhuan
	addi	$s0, $s0, 1 # nam nhuan
	j 	dateCheck
dateCheck: # Kiem tra xem so ngay cua Thang da nhap co phu hop voi Ngay da nhap hay khong
	slt	$t4, $s0, $t0
	bne	$t4, $0, Invalid
	j	Valid
Valid:
	li $v0, 1
	j End
Invalid:
	li $v0,0
	j End
End:
	lw	$a0, 28($sp)
	lw	$ra, 24($sp)
	lw	$t0, 20($sp)
	lw	$t1, 16($sp)
	lw	$t2, 12($sp)
	lw	$t3, 8($sp)
	lw	$t4, 4($sp)
	lw	$s0, 0($sp)
	addi	$sp, $sp, 32
	jr 	$ra
LEAPYEAR: # Ham kiem tra nam nhuan
	addi	$sp, $sp, -12
	sw	$ra, 8($sp)
	sw	$t0, 4($sp)
	sw	$t1, 0($sp)
	move	$t1, $a2 #yyyy
	li	$t0, 400
	div	$t1, $t0
	mfhi	$t0
	beq 	$t0, $0, TRUE
	
	li	$t0, 4
	div	$t1, $t0
	mfhi	$t0
	bne 	$t0, $0, FALSE			
	
	li	$t0, 100
	div	$t1, $t0
	mfhi	$t0
	beq	$t0, $0, FALSE		
TRUE:
	li	$v0, 1
	j	BREAK
FALSE:
	li	$v0, 0
	j	BREAK
BREAK:	
	# restore
	lw	$ra, 8($sp)
	lw	$t0, 4($sp)
	lw	$t1, 0($sp)
	addi	$sp, $sp, 12
	jr	$ra
