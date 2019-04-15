.data
	suu_tb1: .asciiz "Nhap DAY: "
	suu_tb2: .asciiz "Nhap MONTH: "
	suu_tb3: .asciiz "Nhap YEAR: "
	suu_tb4: .asciiz "Du lieu khong hop le !\n"
	dayArr: .word 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
.text
	# - Chức năng: Cho phép người dùng nhập DAY, MONTH, YEAR
	# - Trả về thanh ghi v0 chứa dd, mm,yyyy (dd: 0($v0), mm: 4($v0), yyyy: 8($v0))
	# - Lấy giá trị từ thanh ghi v0 trước khi kết thúc bằng lệnh ($v0,10)
	# - Vấn đề: Nếu không có lệnh kết thúc thì lệnh jr $ra sẽ trả về hàm nhập và chương trình sẽ lại bị loop
	# vì vậy cần phải thực hiện đồng thời liên tục các chức năng trước khi kết thúc chương trình
	.globl main
main:
	jal suu_nhap
	lw $s1, 0($v0)
suu_nhap: 
	# Dau thu tuc
	addi $sp, $sp, -40
	# backup
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	sw $a0, 20($sp)
	sw $a1, 24($sp)
	sw $a2, 28($sp)
	sw $s0, 32($sp)
	sw $ra, 36($sp)
	# Than thu tuc
	# nhap DAY
	li $v0, 4
	la $a0, suu_tb1
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	# nhap MONTH
	li $v0, 4
	la $a0, suu_tb2
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	# nhap YEAR
	li $v0, 4
	la $a0, suu_tb3
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	move	$a0, $t0 
	move	$a1, $t1 
	move	$a2, $t2 
	
	# Kiem tra tinh hop le
	jal suu_kiemtrahople
	bne $v0,0,suu_accept
	bne $v0, 1, suu_unaccept
suu_unaccept:
	li $v0, 4
	la $a0, suu_tb4
	syscall
	j suu_nhap
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
suu_kiemtrahople:
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
	beq $t3,$0,suu_hople # mm > 13

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
	beq	$v0, $0, suu_kiemtradate # khong phai nam nhuan
	addi	$s0, $s0, 1 # nam nhuan
	j 	suu_kiemtradate
suu_kiemtradate: # Kiem tra xem so ngay cua Thang da nhap co phu hop voi Ngay da nhap hay khong
	slt	$t4, $s0, $t0
	bne	$t4, $0, suu_khonghople
	j	suu_hople
suu_hople:
	li $v0, 1
	j suu_kt
suu_khonghople:
	li $v0,0
	j suu_kt
suu_kt:
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
suu_true:
	li	$v0, 1
	j	suu_break
suu_false:
	li	$v0, 0
	j	suu_break
suu_break:
	lw	$ra, 8($sp)
	lw	$t0, 4($sp)
	lw	$t1, 0($sp)
	addi	$sp, $sp, 12
	jr	$ra
suu_ketthucham:
	# cuoi thu tuc
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	lw $a0, 20($sp)
	lw $a1, 24($sp)
	lw $a2, 28($sp)
	lw $s0, 32($sp)
	lw $ra, 36($sp)
	addi $sp, $sp, 40
	jr $ra
