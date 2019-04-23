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
	lw $s1, ($a0)
	lw $s2, 4($a0)
	lw $s3, 8($a0)
	
	#Truyen tham so de goi ham SoNgayTu111
	sw $s1, ($a0)
	sw $s2, 4($a0)
	sw $s3, 8($a0)
	
	jal Thong_SoNgayTu111
	move $t0, $v0
	
	#Cong them 1 de dung voi cong thuc
	addi $t0, $t0, 1
	
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
	la $a0,Thong_wed
	move $v0, $a0
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





.globl Thong_GetTime

# tham so truyen vao: thanh ghi $a0, $a1 la 2 mang ngay
# ham tra ve ket qua la khoang cach giua 2 chuoi ngay truyen vao
# ket qua tra ve luu trong thanh ghi $v0

Thong_GetTime:

	#Dau thu tuc
	addi $sp, $sp, -48
	#backup
	sw $ra,($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	sw $s0, 20($sp)
	sw $s1, 24($sp)
	sw $s2, 28($sp)
	sw $s3, 32($sp)
	sw $a0, 36($sp)
	sw $a1, 40($sp)
	sw $a2, 44($sp)
	
	#Than thu tuc
	#luu lai gia tri ngay thu nhat
	lw $t2, ($a0)
	lw $t3, 4($a0)
	lw $s0, 8($a0)
	
	#lay du lieu cho viec tinh toan ngay thu nhat
	lw $s1, ($a0)
	lw $s2, 4($a0)
	lw $s3, 8($a0)
	
	sw $s1, ($a0)
	sw $s2, 4($a0)
	sw $s3, 8($a0)
	
	jal Thong_SoNgayTu111
	
	#t0 luu khoang cach tu ngay 1/1/1 cua thu nhat
	move $t0, $v0
	
	#lay ngay thu 2 de tinh toan
	lw $s1, ($a1)
	lw $s2, 4($a1)
	lw $s3, 8($a1)
	
	sw $s1, ($a0)
	sw $s2, 4($a0)
	sw $s3, 8($a0)
	
	jal Thong_SoNgayTu111
	
	#Lay lai gia tri cho $a0: ngay thu nhat
	sw $t2, ($a0)
	sw $t3, 4($a0)
	sw $s0, 8($a0)
	
	#t1 luu khoang cach tu ngay 1/1/1 cua thu hai
	move $t1, $v0
	
	#tru 2 ket qua thu duoc va so sanh de tra ve
	sub $t2, $t0, $t1
	bltz $t2, Thong_NhoHon_0
	j Thong_TraVeKetQuaKhoangCach2Ngay
	
Thong_NhoHon_0:
	li $t0, -1
	mult $t2, $t0
	mflo $t2
	
Thong_TraVeKetQuaKhoangCach2Ngay:
	move $v0, $t2
	
	#Cuoi thu tuc
	#restore thanh ghi
	lw $ra,($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	lw $s0, 20($sp)
	lw $s1, 24($sp)
	lw $s2, 28($sp)
	lw $s3, 32($sp)
	lw $a0, 36($sp)
	lw $a1, 40($sp)
	lw $a2, 44($sp)
	#Xoa stack
	addi $sp,$sp, 48
	#tra ve
	jr $ra





.globl Thong_SoNgayTu111
# tham so truyen vao: thanh ghi $a0 la mang ngay
# ham tra ve gia tri ngay thu n tu ngay 1/1/1 vao thanh ghi $v0
# chuc nang: cho biet ngay vua nhap (tham so truyen vao) la ngay thu may ke tu ngay 1/1/1

Thong_SoNgayTu111:
    	#Dau thu tuc
	addi $sp, $sp, -44
	#backup
	sw $ra,($sp)
	sw $t0,4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $s1, 16($sp)
	sw $s2, 20($sp)
	sw $s3, 24($sp)
	sw $s4, 28($sp)
	sw $a0, 32($sp)
	sw $a1, 36($sp)
	sw $a2, 40($sp)
	
	#Than thu tuc
	
	lw $s1, ($a0)
	lw $s2, 4($a0)
	lw $s3, 8($a0)
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

	
	#tinh so ngay tu 1/1/1
	# khoi tao so ngay (s) = 0
	
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
	
	# s = s - 1 de tinh la ngay thu may tu ngay 1/1/1 
	subi $t0, $t0, 1
	
	# chuyen kq ve $v0
	move $v0, $t0
	
	#Cuoi thu tuc
	#restore thanh ghi
	lw $ra,($sp)
	lw $t0,4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $s1, 16($sp)
	lw $s2, 20($sp)
	lw $s3, 24($sp)
	lw $s4, 28($sp)
	lw $a0, 32($sp)
	lw $a1, 36($sp)
	lw $a2, 40($sp)
	#Xoa stack
	addi $sp,$sp, 44
	#tra ve
	jr $ra