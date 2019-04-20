	.data  
fin: .asciiz "input.txt"
fio: .asciiz "output.txt"
buffer: .space 1024
tien_tbNhuan: .asciiz "Nam nhuan"
tien_tbKhongNhuan: .asciiz "Khong nhuan"

	.text
#Ham NhapXuatFile
#Chuc nang: Doc ngay thang nam tu file, thuc hien cac yeu cau va xuat ra file
#Tham so: 
## a0: chuoi ten file input
## a1: chuoi ten file output
#Tra ve:
## Khong co gia tri tra ve, chi co file output duoc thay doi
.globl NhapXuatFile
NhapXuatFile:
	#Mo file de doc
	li   $v0, 13
	la   $a0, fin       
	li   $a1, 0       
	li   $a2, 0
	syscall            
	move $s1, $v0	#Cuoi cung, con tro file se duoc luu o s1   

	#Doc file:
	##Doc ngay:
	li   $v0, 14
	move $a0, $s1     
	la   $a1, buffer	#Doc 2 byte vao a1   
	li   $a2, 3	    	#Do dai chuoi can doc la 2 byte
	syscall
	move $s2 $a1		#Luu vao s2, s2 = day (ascii)
	###Chuyen thanh int
	move $a0 $s2
	jal atoi
	move $t2 $v0	#Chuyen ket qua vao bien, luc nay t2 = day (int)
	

	##Doc thang
	li   $v0, 14
	move $a0, $s1     
	la   $a1, buffer
	li   $a2, 3	    
	syscall
	move $s3 $a1		#Luu vao s3, s3 = month (ascii)
	###Chuyen thanh int
	move $a0 $s3
	jal atoi
	move $t3 $v0	#Chuyen ket qua vao bien tam, luc nay t3 = month (int)


	##Doc nam
	li   $v0, 14
	move $a0, $s1     
	la   $a1, buffer	#Doc 4 byte vao a1   
	li   $a2, 4	    	#Chieu dai can doc la 4 byte
	syscall
	move $s4 $a1		#Luu vao s4, s4 = year (ascii)
	###Chuyen thanh int
	move $a0 $s4
	jal atoi
	move $t4 $v0	#Chuyen ket qua vao bien tam, luc nay t4 = year (int)



	#Mo file de ghi
	li $v0 13
	la $a0 fio
	li $a1 1	#a1 = 1 =>> mo de ghi
	li $a2 0
	syscall
	move $s0 $v0	#Luc nay con tro file duoc luu o s0
	


	#In ket qua cau 3
	move $a0 $t4
	jal LaNamNhuan
	bne $v0 $0 XuatTBNhuan
	beq $v0 $0 XuatTBKhongNhuan
	XuatTBNhuan:
		li $v0 15
		move $a0 $s0
		la $a1 tien_tbNhuan
		li $a2 9
		syscall
		j XuatTB_Done
	XuatTBKhongNhuan:
		li $v0 15
		move $a0 $s0
		la $a1 tien_tbKhongNhuan
		li $a2 11
		syscall
		j XuatTB_Done
	XuatTB_Done:
	


	
	#Dong file
	li   $v0, 16       
	move $a0, $s6      
	syscall
#---------------------------------------------------------------------------




#Ham LaNamNhuan:
#Chuc nang: kiem tra xem nam duoc truyen vao co phai nam nhuan hay khong
#Tham so: a0 voi a0 la year (int)
#Tra ve: v0 = 1 neu la nam nhuan va nguoc lai
.globl LaNamNhuan
LaNamNhuan:
	subi $sp $sp 16
	sw $ra ($sp)
	sw $a0 4($sp)
	sw $t1 8($sp)
	sw $t2 12($sp)

	li $t1 4
	div $a0 $t1
	mfhi $t2

	beq $t2 $0 TiepTucKT
	j ReturnFalse
		TiepTucKT:
			li $t1 100
			div $a0 $t1
			mfhi $t2
			bne $t2 $0 ReturnTrue
			j ReturnFalse
				ReturnTrue:
					li $v0 1
				j Thoat	
		ReturnFalse:
			li $v0 0
	Thoat:
	
	sw $ra ($sp)
	sw $a0 4($sp)
	sw $t1 8($sp)
	sw $t2 12($sp)
	addi $sp $sp 16

	jr $ra
#------------------------------------------------------------------------------------------------------





#Ham atoi
#Chuc nang: Chuyen doi mot so bat ky duoi dang asciiz sang word
#Tham so: a0, voi a0 chua chuoi can convert
#Tra ve: v0, voi v0 chua gia tri cua a0 duoi dang word
.globl atoi
atoi:
	#Backup...
	subi $sp $sp 32
	sw $ra ($sp)
	sw $a0 4($sp)
	sw $t0 8($sp)
	sw $s0 12($sp)
	sw $s1 16($sp)
	sw $t1 20($sp)
	sw $t2 24($sp)
	sw $v1 28($sp)


	#Tim so chu so
	jal ChieuDaiChuoi
	move $s0 $v0


	#t0 = 10^(soCS - 1)
	li $t0 1
	li $t2 10
	subi $t1 $s0 1	#t1 = s0 - 1 = soCS - 1
	atoi_Cond1:
	bne $t1 $0 atoi_Loop1
	beq $t1 $0 atoi_ExitLoop1
	atoi_Loop1:
		mult $t0 $t2
		mflo $t0
		subi $t1 $t1 1
		j atoi_Cond1
	atoi_ExitLoop1:
			

	
	#Bat dau tinh toan
	li $t1 0	#Index
	li $v1 0	#ret

	atoi_Cond:
	bne $t1 $s0 atoi_Loop
	beq $t1 $s0 atoi_ExitLoop
	atoi_Loop:
		lb $s1 ($a0)	#Chu so dau tien duoc tach dang ascii
		beq $s1 ' ' atoi_ExitLoop
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
		
		j atoi_Cond
	atoi_ExitLoop:
		move $v0 $v1



	#Restore...
	lw $ra ($sp)
	lw $a0 4($sp)
	lw $t0 8($sp)
	lw $s0 12($sp)
	lw $s1 16($sp)
	lw $t1 20($sp)
	lw $t2 24($sp)
	lw $v1 28($sp)
	addi $sp $sp 32

	jr $ra
#--------------------------------------------------------------------------------------------





#Ham itoa
#Chuc nang: Chuyen 1 so bat ky ve dang chuoi asciiz (doi voi so 4 chu so)
#Tham so: a0, voi a0 chua so can chuyen doi
#Tra ve: v0, voi v0 chua chuoi da chuyen doi
.globl itoa
itoa:
	subi $sp $sp 36
	sw $ra ($sp)
	sw $s0 4($sp)
	sw $s1 8($sp)
	sw $a0 12($sp)
	sw $t0 16($sp)
	sw $t1 20($sp)
	sw $t2 24($sp)
	sw $v1 28($sp)
	sw $t3 32($sp)



	#Dem so chu so
	jal DemSoCS
	move $s0 $v0



	#t0 = 10^(soCS - 1)
	li $t0 1
	li $t2 10
	subi $t1 $s0 1	#t1 = s0 - 1 = soCS - 1
	itoa_Cond1:
	bne $t1 $0 itoa_Loop1
	beq $t1 $0 itoa_ExitLoop1
	itoa_Loop1:
		mult $t0 $t2
		mflo $t0
		subi $t1 $t1 1
		j itoa_Cond1
	itoa_ExitLoop1:

	

	#Cap phat vung nho cho v0
	li $v0 9
	li $a0 1024
	syscall
	move $v1 $v0	#Chuyen vung nho tu v0 sang v1 (vi hay phai thay doi gia tri cua v0)
	lw $a0 12($sp)	#Khoi phuc lai a0 vi vua thay doi gia tri cua no

	li $t3 0	#Day la bien dem de cuoi cung lay v0 tru di no, de lay dia chi cua ky tu dau tien
			#trong chuoi, neu khong lam nhu vay thi khi in se in tu ky tu cuoi cung cua chuoi
			#=> khong co ky tu nao duoc in ra ca.
	itoa_Loop:
		div $a0 $t0
		mfhi $a0
		mflo $s1

		addi $s1 $s1 48
		sb $s1 ($v1)
		addi $v1 $v1 1
		addi $t3 $t3 1

		#t0 = t0 / 10 cho vong lap tiep theo
		li $t2 10
		div $t0 $t2
		mflo $t0

		bne $t0 $0 itoa_Loop
		beq $t0 $0 itoa_ExitLoop	
	itoa_ExitLoop:
		sub $v0 $v1 $t3	#Luu v1 vao v0 de tra ve v0


	lw $ra ($sp)
	lw $s0 4($sp)
	lw $s1 8($sp)
	lw $a0 12($sp)
	lw $t0 16($sp)
	lw $t1 20($sp)
	lw $t2 24($sp)
	lw $v1 28($sp)
	lw $t3 32($sp)
	addi $sp $sp 36

	jr $ra
#--------------------------------------------------------------------------------------------





#Ham ChieuDaiChuoi
#Chuc nang: tra ve do dai cua mot chuoi cho truoc
#Tham so: a0, voi a0 la chuoi can tim do dai
#Tra ve: v0, voi v0 la do dai chuoi
.globl ChieuDaiChuoi
ChieuDaiChuoi:
	#Backup...
	subi $sp $sp 12
	sw $ra ($sp)
	sw $s1 4($sp)
	sw $a0 8($sp)


	li $v0 0
	lb $s1 ($a0)

	ChieuDaiChuoi_Cond:
	#beq $s1 ' ' ChieuDaiChuoi_Exit
	bne $s1 $0 ChieuDaiChuoi_Loop
	beq $s1 $0 ChieuDaiChuoi_Exit
	ChieuDaiChuoi_Loop:
		addi $v0 $v0 1
		addi $a0 $a0 1
		lb $s1 ($a0)
		j ChieuDaiChuoi_Cond
	ChieuDaiChuoi_Exit:


	#Restore...
	lw $ra ($sp)
	lw $s1 4($sp)
	lw $a0 8($sp)
	addi $sp $sp 12

	jr $ra
#--------------------------------------------------------------------------------------





#Ham DemSoCS
#Chuc nang: Dem so chu so cua mot so cho truoc
#Tham so: a0, voi a0 la so can dem
#Tra ve: v0, voi v0 la so chu so cua so do
.globl DemSoCS
DemSoCS:
	subi $sp $sp 20
	sw $ra ($sp)
	sw $t0 8($sp)
	sw $a0 12($sp)
	sw $s0 16($sp)
	

	li $v0 1	#Ket qua

	li $t0 10
	div $a0 $t0
	mflo $s0	#Phan nguyen

	DemSoCS_Cond:
	bne $s0 $0 DemSoCS_Loop
	beq $s0 $0 DemSoCS_Exit
	DemSoCS_Loop:
		addi $v0 $v0 1
		div $s0 $t0
		mflo $s0
		j DemSoCS_Cond	
	DemSoCS_Exit:



	lw $ra ($sp)
	lw $t0 8($sp)
	lw $a0 12($sp)
	lw $s0 16($sp)
	addi $sp $sp 20
	
	jr $ra
#------------------------------------------------------------------------------------------





#Ham SSChuoi
#Tham so: a0, a1, voi a0, a1 chua 2 chuoi can so sanh
#Tra ve: 0 neu a0 == a1 va nguoc lai
.globl SSChuoi
SSChuoi:
	subi $sp $sp 28
	sw $ra ($sp)
	sw $a0 4($sp)
	sw $a1 8($sp)
	sw $t0 12($sp)
	sw $t1 16($sp)
	sw $t2 20($sp)
	sw $t3 24($sp)

	li $t0 0	#index
	jal ChieuDaiChuoi
	move $t1 $v0

	li $v0 1

	SSChuoi_Cond:
	bne $t0 $t1 SSChuoi_Loop
	beq $t0 $t1 SSChuoi_ExitLoop
	SSChuoi_Loop:
		lb $t2 ($a0)
		lb $t3 ($a1)
		beq $t2 $t3 SSChuoi_TiepTuc
		bne $t2 $t3 SSChuoi_ReturnFalse
		SSChuoi_TiepTuc:
			addi $t0 $t0 1
			addi $a0 $a0 1
			addi $a1 $a1 1
			j SSChuoi_Cond
		SSChuoi_ReturnFalse:
			li $v0 0
			j SSChuoi_ExitLoop
	SSChuoi_ExitLoop:


	lw $ra ($sp)
	lw $a0 4($sp)
	lw $a1 8($sp)
	lw $t0 12($sp)
	lw $t1 16($sp)
	lw $t2 20($sp)
	lw $t3 24($sp)
	addi $sp $sp 28

	jr $ra
