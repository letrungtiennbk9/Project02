.text

.globl Thong_SoNgayTu111
# tham so truyen vao: thanh ghi $a0 la mang ngay
# ham tra ve gia tri ngay thu n tu ngay 1/1/1 vao thanh ghi $v0
# chuc nang: cho biet ngay vua nhap (tham so truyen vao) la ngay thu may ke tu ngay 1/1/1

Thong_SoNgayTu111:
    	#Dau thu tuc
	addi $sp, $sp, -40
	#backup
	sw $ra,($sp)
	sw $t0,4($sp)
	sw $t1, 8($sp)
	sw $s1, 12($sp)
	sw $s2, 16($sp)
	sw $s3, 20($sp)
	sw $s4, 24($sp)
	sw $a0, 28($sp)
	sw $a1, 32($sp)
	sw $a2, 36($sp)
	
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
