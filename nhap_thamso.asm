.data
	suu_tb4: .asciiz "Du lieu khong hop le !\n"
	dayArr: .word 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
.text
	# - Truyen dd,mm,yyyy vao cac thanh ghi tuong ung a0, a1, a2
	# - Tra ve thanh ghi v0 chua dd, mm,yyyy (dd: 0($v0), mm: 4($v0), yyyy: 8($v0))
.globl suu_Nhap_ThamSo
suu_Nhap_ThamSo: 
	# Dau thu tuc
	addi $sp, $sp, -44
	# backup
	sw $ra,($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	sw $t4, 20($sp)
	sw $a0, 24($sp)
	sw $a1, 28($sp)
	sw $a2, 32($sp)
	sw $s0, 36($sp)
	sw $v1, 40($sp)
	# Than thu tuc
	# Kiem tra tinh hop le
	jal suu_kiemtrahople
	bne $v0,0,suu_accept
	bne $v0, 1, suu_unaccept
.globl suu_unaccept
suu_unaccept:
	li $v0, 4
	la $a0, suu_tb4
	syscall
.globl suu_accept
suu_accept:
	# tra ve v0
	move $t3, $a0
	la $a0, 12
	li $v0, 9
	syscall
	add $v1, $t3, $zero
	sw $v1, 0($v0)
	add $v1, $a1, $zero
	sw $v1, 4($v0)
	add $v1, $a2, $zero
	sw $v1, 8($v0)
	j suu_ketthucham
.globl suu_kiemtrahople
suu_kiemtrahople:
	addi	$sp, $sp, -40
	# backup
	sw 	$t6, 36($sp)
	sw	$a0, 32($sp)
	sw	$ra, 28($sp)
	sw	$t0, 24($sp)
	sw	$t1, 20($sp)
	sw	$t2, 16($sp)
	sw	$t3, 12($sp)
	sw	$t4, 8($sp)
	sw 	$t5, 4($sp)
	sw	$s0, 0($sp)
	move	$t0, $a0 # dd
	move 	$t1, $a1 # mm
	move 	$t2, $a2 # yyyy
	li $t6, 1
	slt $t5,$t0,$t6 # kiem tra dd < 1
	bne $t5,$0,suu_khonghople
	li $t3, 13
	slt $t3, $t1, $t3 # kiem tra xem mm < 13?
	beq $t3,$0,suu_khonghople # mm > 13

	# Kiem tra DAY
	la	$s0, dayArr
	addi	$t4, $t1, -1
	sll	$t4, $t4, 2
	add	$s0, $s0, $t4
	lw	$s0, ($s0) # so ngay cua THANG da nhap

	li  $t4, 2
	bne $t1, $t4, suu_kiemtradate
	lw  $a0, 28($sp)
	jal suu_ktnamnhuan
	beq	$v0, $0, suu_kiemtradate 
	addi	$s0, $s0, 1 
	j 	suu_kiemtradate
.globl suu_kiemtradate
suu_kiemtradate: # Kiem tra xem so ngay cua Thang da nhap co phu hop voi Ngay da nhap hay khong
	slt	$t4, $s0, $t0
	bne	$t4, $0, suu_khonghople
	j	suu_hople
.globl suu_hople
suu_hople:
	li $v0, 1
	j suu_kt
.globl suu_khonghople
suu_khonghople:
	li $v0,0
	j suu_kt
.globl suu_kt
suu_kt:
	lw	$a0, 32($sp)
	lw	$ra, 28($sp)
	lw	$t0, 24($sp)
	lw	$t1, 20($sp)
	lw	$t2, 16($sp)
	lw	$t3, 12($sp)
	lw	$t4, 8($sp)
	lw 	$t5, 4($sp)
	lw	$s0, 0($sp)
	lw 	$t6, 36($sp)
	addi	$sp, $sp, 40
	jr 	$ra
.globl suu_ktnamnhuan
suu_ktnamnhuan:
	addi	$sp, $sp, -12
	sw	$ra, 8($sp)
	sw	$t0, 4($sp)
	sw	$t1, 0($sp)
	move	$t1, $a2 #yyyy
	li	$t0, 400
	div	$t1, $t0
	mfhi	$t0
	beq 	$t0, $0, suu_true

	li	$t0, 4
	div	$t1, $t0
	mfhi	$t0
	bne 	$t0, $0, suu_false

	li	$t0, 100
	div	$t1, $t0
	mfhi	$t0
	beq	$t0, $0, suu_false
.globl suu_true
suu_true:
	li	$v0, 1
	j	suu_break
.globl suu_false
suu_false:
	li	$v0, 0
	j	suu_break	
.globl suu_break
suu_break:
	lw	$ra, 8($sp)
	lw	$t0, 4($sp)
	lw	$t1, 0($sp)
	addi	$sp, $sp, 12
	jr	$ra
.globl suu_ketthucham
suu_ketthucham:
	# cuoi thu tuc
	#restore
	lw $ra,($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	lw $t4, 20($sp)
	lw $a0, 24($sp)
	lw $a1, 28($sp)
	lw $a2, 32($sp)
	lw $s0, 36($sp)
	lw $v1, 40($sp)
	# xoa stack
	addi $sp, $sp, 44
	# tra ve
	jr $ra
