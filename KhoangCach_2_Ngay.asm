.data
.text
.globl Thong_GetTime

# tham so truyen vao: thanh ghi $a0, $a1 la 2 mang ngay
# ham tra ve ket qua la khoang cach giua 2 chuoi ngay truyen vao
# ket qua tra ve luu trong thanh ghi $v0

Thong_GetTime:

	#Dau thu tuc
	addi $sp, $sp, -40
	#backup
	sw $ra,($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $s1, 16($sp)
	sw $s2, 20($sp)
	sw $s3, 24($sp)
	sw $a0, 28($sp)
	sw $a1, 32($sp)
	sw $a2, 36($sp)
	
	#Than thu tuc
	lw $s1, ($a0)
	lw $s2, 4($a0)
	lw $s3, 8($a0)
	
	sw $s1, ($a0)
	sw $s2, 4($a0)
	sw $s3, 8($a0)
	
	jal Thong_SoNgayTu111
	
	#t0 luu khoang cach tu ngay 1/1/1 cua thu nhat
	move $t0, $v0
	
	#lay ngay thu 2
	lw $s1, ($a1)
	lw $s2, 4($a1)
	lw $s3, 8($a1)
	
	sw $s1, ($a0)
	sw $s2, 4($a0)
	sw $s3, 8($a0)
	
	jal Thong_SoNgayTu111
	
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
	lw $t0,	4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $s1, 16($sp)
	lw $s2, 20($sp)
	lw $s3, 24($sp)
	lw $a0, 28($sp)
	lw $a1, 32($sp)
	lw $a2, 36($sp)
	#Xoa stack
	addi $sp,$sp,40
	#tra ve
	jr $ra
	
	
	
	
	
	
	
