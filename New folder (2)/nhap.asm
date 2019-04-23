.data
	suu_tb1: .asciiz "Nhap DAY: "
	suu_tb2: .asciiz "Nhap MONTH: "
	suu_tb3: .asciiz "Nhap YEAR: "
	suu_tb4: .asciiz "Du lieu khong hop le !\n"
	xd: .asciiz "\n"
	suu_dd: .space 3
	suu_mm: .space 3
	suu_yyyy: .space 5
	dayArr: .word 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
.text
	# - Chuc nang: Cho phep nguoi dung nhap DAY, MONTH, YEAR tu ban phim
	# - Tra ve thanh ghi v0 chua dd, mm,yyyy (dd: 0($v0), mm: 4($v0), yyyy: 8($v0)
.globl suu_nhap
suu_nhap: 
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
	# nhap DAY
	li $v0, 4
	la $a0, suu_tb1
	syscall
	la $v0, 8
	la $a0, suu_dd
	li $a1, 3
	syscall
	jal nhap_suu_atoi
	move $t0, $v0
	li $v0, 4
	la $a0, xd
	syscall
	#nhap MONTH
	li $v0, 4
	la $a0, suu_tb2
	syscall
	la $v0, 8
	la $a0, suu_mm
	li $a1, 3
	syscall
	jal nhap_suu_atoi
	move $t1 $v0
	li $v0, 4
	la $a0, xd
	syscall
	# nhap YEAR
	li $v0, 4
	la $a0, suu_tb3
	syscall
	la $v0, 8
	la $a0, suu_yyyy
	li $a1, 5
	syscall
	jal nhap_suu_atoi
	move $t2, $v0
	li $v0, 4
	la $a0, xd
	syscall
	# Than thu tuc
	move	$a0, $t0 
	move	$a1, $t1 
	move	$a2, $t2 
	# Kiem tra tinh hop le
	jal nhap_suu_kiemtrahople
	bne $v0,0,nhap_suu_accept
	bne $v0, 1, nhap_suu_unaccept
.globl nhap_suu_atoi
nhap_suu_atoi:
	#Backup...
	subi $sp $sp 36
	sw $ra ($sp)
	sw $a0 4($sp)
	sw $t0 8($sp)
	sw $s0 12($sp)
	sw $s1 16($sp)
	sw $t1 20($sp)
	sw $t2 24($sp)
	sw $v1 28($sp)
	sw $t3, 32($sp) 
	#Tim so chu so
	jal ChieuDaiChuoi
	move $s0 $v0
	#t0 = 10^(soCS - 1)
	li $t0 1
	li $t2 10
	subi $t1 $s0 1	#t1 = s0 - 1 = soCS - 1
	nhap_suu_atoi_Cond1:
	bne $t1 $0 nhap_suu_atoi_Loop1
	beq $t1 $0 nhap_suu_atoi_ExitLoop1
	nhap_suu_atoi_Loop1:
		mult $t0 $t2
		mflo $t0
		subi $t1 $t1 1
		j nhap_suu_atoi_Cond1
	nhap_suu_atoi_ExitLoop1:
	#Bat dau tinh toan
	li $t1 0	#Index
	li $v1 0	#ret
	nhap_suu_atoi_Cond:
	bne $t1 $s0 nhap_suu_atoi_Loop
	beq $t1 $s0 nhap_suu_atoi_ExitLoop
	nhap_suu_atoi_Loop:
		lb $s1 ($a0)	#Chu so dau tien duoc tach dang ascii
		beq $s1 ' ' nhap_suu_atoi_ExitLoop
		beq $s1 '\n' nhap_suu_atoi_ExitXd # Xuly ky tu \n
		subi $s1 $s1 48	#Chuyen thanh int

		#s1 = s1 * t0
		mult $s1 $t0
		mflo $s1

		add $v1 $v1 $s1	#Cong don ket qua

		addi $a0 $a0 1	#a0 tang len 1 dia chi

		#t0 = t0 / 10 cho vong lap tiep theo
		li $t2 10
		div $t0 $t2
		mflo $t0
		addi $t1 $t1 1	#i++
		
		j nhap_suu_atoi_Cond
	nhap_suu_atoi_ExitXd:
		li $t3 10
		div $v1 $t3
		mflo $v1 
		j nhap_suu_atoi_ExitLoop
	nhap_suu_atoi_ExitLoop:
	move $v0, $v1
	#Restore...
	lw $ra ($sp)
	lw $a0 4($sp)
	lw $t0 8($sp)
	lw $s0 12($sp)
	lw $s1 16($sp)
	lw $t1 20($sp)
	lw $t2 24($sp)
	lw $v1 28($sp)
	lw $t3, 32($sp) 
	addi $sp $sp 36
	jr $ra
#----------------------------------------------------------------------------------------------------------------
.globl nhap_suu_unaccept
nhap_suu_unaccept:
	li $v0, 4
	la $a0, suu_tb4
	syscall
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
	j suu_nhap
.globl nhap_suu_accept
nhap_suu_accept:
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
	j nhap_suu_ketthucham
.globl nhap_suu_kiemtrahople
nhap_suu_kiemtrahople:
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
	bne $t5,$0,nhap_suu_khonghople
	li $t3, 13
	slt $t3, $t1, $t3 # kiem tra xem mm < 13?
	beq $t3,$0,nhap_suu_khonghople # mm > 13

	# Kiem tra DAY
	la	$s0, dayArr
	addi	$t4, $t1, -1
	sll	$t4, $t4, 2
	add	$s0, $s0, $t4
	lw	$s0, ($s0) # so ngay cua THANG da nhap

	li  $t4, 2
	bne $t1, $t4, nhap_suu_kiemtradate
	lw  $a0, 28($sp)
	jal nhap_suu_ktnamnhuan
	beq	$v0, $0, nhap_suu_kiemtradate 
	addi	$s0, $s0, 1 
	j 	nhap_suu_kiemtradate
.globl nhap_suu_kiemtradate
nhap_suu_kiemtradate: # Kiem tra xem so ngay cua Thang da nhap co phu hop voi Ngay da nhap hay khong
	slt	$t4, $s0, $t0
	bne	$t4, $0, nhap_suu_khonghople
	j	nhap_suu_hople
.globl nhap_suu_hople
nhap_suu_hople:
	li $v0, 1
	j nhap_suu_kt
.globl nhap_suu_khonghople
nhap_suu_khonghople:
	li $v0,0
	j nhap_suu_kt
.globl nhap_suu_kt
nhap_suu_kt:
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
.globl nhap_suu_ktnamnhuan
nhap_suu_ktnamnhuan:
	addi	$sp, $sp, -12
	sw	$ra, 8($sp)
	sw	$t0, 4($sp)
	sw	$t1, 0($sp)
	move	$t1, $a2 #yyyy
	li	$t0, 400
	div	$t1, $t0
	mfhi	$t0
	beq 	$t0, $0, nhap_suu_true

	li	$t0, 4
	div	$t1, $t0
	mfhi	$t0
	bne 	$t0, $0, nhap_suu_false

	li	$t0, 100
	div	$t1, $t0
	mfhi	$t0
	beq	$t0, $0, nhap_suu_false
.globl nhap_suu_true
nhap_suu_true:
	li	$v0, 1
	j	nhap_suu_break
.globl nhap_suu_false
nhap_suu_false:
	li	$v0, 0
	j	nhap_suu_break
.globl nhap_suu_break
nhap_suu_break:
	lw	$ra, 8($sp)
	lw	$t0, 4($sp)
	lw	$t1, 0($sp)
	addi	$sp, $sp, 12
	jr	$ra
.globl nhap_suu_ketthucham
nhap_suu_ketthucham:
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
