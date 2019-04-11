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

# cho co nhap ngay roi edit ghi chu tham so truyen vao nhe
# ham tra ve chuoi ket qua la ngay thu may trong tuan cua ngay duoc truyen vao
#ket qua tra ve luu trong thanh ghi $v0

Thong_Weekday:
	#Dau thu tuc
	addi $sp, $sp, -40
	#backup
	sw $ra,($sp)
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
	
	move $s1, $a0
	move $s2, $a1
	move $s3, $a2
	#kiem tra thang < 3
	li $t1, 3
	slt $t2,$s2,$t1
	bne $t2,$0,Thong_TangThang_GiamNam
	j Thong_TiepTucNeuKhongTang
	#Truong hop thang < 3
Thong_TangThang_GiamNam:
	li $t1, 1
	sub $s3, $s3, $t1
	
	li $t1, 12
	add $s2, $s2, $t1
	
Thong_TiepTucNeuKhongTang:
	li $t0, 0
	
	li $t1, 365
	mult $t1, $s3
	mflo $s4
	
	# s = s + kq1
	add $t0, $t0, $s4
	
	#year /4
	li $t1, 4
	div $s3, $t1
	mflo $s4
	
	# s = s + kq2
	add $t0, $t0, $s4
	
	#year / 100
	li $t1, 100
	div $s3, $t1
	mflo $s4
	
	# s = s + kq3
	sub $t0, $t0, $s4
	
	#year / 400
	li $t1, 400
	div $s3, $t1
	mflo $s4
	
	# s = s + kq3
	add $t0, $t0, $s4
	
	
	# s = s + (153 * month - 457) / 5
	li $t1, 153
	mult $t1, $s2
	mflo $s4
	
	li $t1, 457
	sub $s4, $s4, $t1
	
	li $t1, 5
	div $s4, $t1
	mflo $s4
	
	# s = s + kq4
	add $t0, $t0, $s4
	
	# s = s + day
	add $t0, $t0, $s1
	
	li $t1, 306
	#s = s - 306
	sub $t0, $t0, $t1 
	
	#chia lay du cho 7
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
