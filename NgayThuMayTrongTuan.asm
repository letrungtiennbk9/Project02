.data
	Thong_chunhat: .asciiz "La ngay chu nhat"
	Thong_thuhai: .asciiz "La ngay thu hai"
	Thong_thuba: .asciiz "La ngay thu ba"
	Thong_thutu: .asciiz "La ngay thu tu"
	Thong_thunam: .asciiz "La ngay thu nam"
	Thong_thusau: .asciiz "La ngay thu sau"
	Thong_thubay: .asciiz "La ngay thu bay"
	
.text
.globl Thong_NgayThuMayTrongTuan

# cho co nhap ngay roi edit ghi chu tham so truyen vao nhe
# ham khong co gia tri tra ve, khi goi ham se xuat ra ket qua chuoi ngay input la ngay thu may trong tuan

Thong_NgayThuMayTrongTuan:
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
	
	jal Thong_SoNgayTu111
	move $t0, $v0
	
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
	li $v0,4
	la $a0,Thong_chunhat
	syscall
	j Thong_KetThuc

Thong_ThuHai:
	li $v0,4
	la $a0,Thong_thuhai
	syscall
	j Thong_KetThuc

Thong_ThuBa:	
	li $v0,4
	la $a0,Thong_thuba
	syscall
	j Thong_KetThuc

Thong_ThuTu:	
	li $v0,4
	la $a0,Thong_thutu
	syscall
	j Thong_KetThuc

Thong_ThuNam:
	li $v0,4
	la $a0,Thong_thunam
	syscall
	j Thong_KetThuc
	
Thong_ThuSau:
	li $v0,4
	la $a0,Thong_thusau
	syscall
	j Thong_KetThuc

Thong_ThuBay:
	li $v0,4
	la $a0,Thong_thubay
	syscall
	j Thong_KetThuc

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

Thong_KetThuc:
	li, $v0, 10
	syscall
