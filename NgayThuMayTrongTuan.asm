.data
	Thong_sun: .asciiz "Sun"
	Thong_mon: .asciiz "Mon"
	Thong_tues: .asciiz "Tues"
	Thong_wed: .asciiz "Wed"
	Thong_thurs: .asciiz "Thurs"
	Thong_fri: .asciiz "Fri"
	Thong_sat: .asciiz "Sat"
	
.text
.globl Thong_Weekday

# tham so truyen vao: thanh ghi $a0 la mang ngay
# ham tra ve chuoi ket qua la ngay thu may trong tuan cua ngay duoc truyen vao
# ket qua tra ve luu trong thanh ghi $v0

Thong_Weekday:
	#Dau thu tuc
	addi $sp, $sp, -40
	#backup
	sw $ra,	($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $s1, 12($sp)
	sw $s2, 16($sp)
	sw $s3, 20($sp)
	sw $s4, 24($sp)
	sw $a0, 28($sp)
	sw $a1, 32($sp)
	sw $a2, 36($sp)
	
	#Than thu tuc
	# Lay tham so truyen vao
	move $s1, $a0
	move $s2, 4($a0)
	move $s3, 8($a0)
	
	#Truyen tham so de goi ham SoNgayTu111
	move $a0, $s1
	move $a1, $s2
	move $a2, $s3
	
	jal Thong_SoNgayTu111
	move $t0, $v0
	
	li $t1, 7
	div $t0, $t1
	mfhi $t0

	
	#xuat ket qua
	beq $t0,0,Thong_ChuNhat
	beq $t0,1,Thong_ThuHai
	beq $t0,2,Thong_ThuBa
	beq $t0,3,Thong_ThuTu
	beq $t0,4,Thong_ThuNam
	beq $t0,5,Thong_ThuSau
	beq $t0,6,Thong_ThuBay
	
Thong_ChuNhat:
	la $a0, Thong_sun
	move $v0, $a0
	j Thong_KetThucHam

Thong_ThuHai:
	la $a0,Thong_mon
	move $v0, $a0
	j Thong_KetThucHam
	
Thong_ThuBa:	
	la $a0,Thong_tues
	move $v0, $a0
	j Thong_KetThucHam

Thong_ThuTu:	
	li $v0,4
	la $a0,Thong_wed
	syscall
	j Thong_KetThucHam

Thong_ThuNam:
	la $a0,Thong_thurs
	move $v0, $a0
	j Thong_KetThucHam
	
Thong_ThuSau:
	la $a0,Thong_fri
	move $v0, $a0
	j Thong_KetThucHam

Thong_ThuBay:
	la $a0,Thong_sat
	move $v0, $a0
	j Thong_KetThucHam

Thong_KetThucHam:	
	#Cuoi thu tuc
	#restore thanh ghi
	lw $ra,($sp)
	lw $t0,4($sp)
	lw $t1, 8($sp)
	lw $s1, 12($sp)
	lw $s2, 16($sp)
	lw $s3, 20($sp)
	lw $s4, 24($sp)
	lw $a0, 28($sp)
	lw $a1, 32($sp)
	lw $a2, 36($sp)
	#Xoa stack
	addi $sp,$sp,40
	#tra ve
	jr $ra
