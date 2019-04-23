.data
	hqthinh_kq: 		.asciiz "\nKet qua: "
	hqthinh_menu: 		.asciiz "\n=======Menu======\nA. MM/DD/YYYY\nB. DD Month, YYYY.\nC. Month DD, YYYY\nD. Ket Thuc\n==============\nChon:"
	hqthinh_gach_cheo: 	.asciiz "/"
	hqthinh_phay: 		.asciiz ", "
	hqthinh_space: 		.asciiz " "
	hqthinh_zero:		.asciiz "0"
	hqthinh_tb_sai: 	.asciiz "Nhap sai chuc nang. Nhap lai: "
	
	hqthinh_jan: 	.asciiz "January"
	hqthinh_feb: 	.asciiz "February"
	hqthinh_mar: 	.asciiz "March"
	hqthinh_apr: 	.asciiz "April"
	hqthinh_may: 	.asciiz "May"
	hqthinh_jun: 	.asciiz "June"
	hqthinh_jul: 	.asciiz "July"
	hqthinh_aug: 	.asciiz "August"
	hqthinh_sep: 	.asciiz "September"
	hqthinh_oct: 	.asciiz "October"
	hqthinh_nov: 	.asciiz "November"
	hqthinh_dec: 	.asciiz "December"
	
	fin: .asciiz "input.txt"
	fio: .asciiz "output.txt"
	buffer: .space 1024
	tien_tbNhuan: .asciiz "Nam nhuan"
	tien_tbKhongNhuan: .asciiz "Khong nhuan"
.text
.globl hqthinh_filecau1
### truyen vao $a0 la dia chi con tro file
### xuat dinh dang cau 1 ra file
### khong co tra ve
hqthinh_filecau1: #Xuat ra file ket qua cau 1
	###Dau thu tuc
	addi $sp, $sp,-24
	###Backup
	sw $ra,($sp)
	sw $a0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	sw $s4,20($sp)
	
	#lay cac gia tri tu $a0
	lw $s2,0($a0) #s2 = day
	lw $s3,4($a0) #s3 = month
	lw $s4,8($a0) #s4 = year

	#Than thu tuc
	
	blt,$s2,10,day0_cau1 #kiem tra neu ngay < 10
	#xuat ngay
	jal Ngay_fout
	
	#xuat dau gach cheo
	jal GCheo_fout
	
	blt,$s3,10,month0_cau1 #kiem tra neu thang < 10
	#xuat thang
	jal Thang_fout
	
	#xuat dau gach cheo
	jal GCheo_fout
	
	#xuat nam
	jal Nam_fout
	
	#Nhay den ket thuc
	j hqthinh_fKetThuc
	
#######
#thuc hien khi ngay < 10
day0_cau1:
	#xuat so 0
  	li   $v0, 15
  	move $a0, $s1
  	la   $a1, hqthinh_zero
  	li   $a2, 1
  	syscall
	
	#chuyen int sang string
	move $a0,$s2
	jal itoa
	move $v1, $v0
	#xuat ngay
  	li   $v0, 15
  	move $a0, $s1
  	la   $a1, ($v1)
  	li   $a2, 1
  	syscall
	
	#xuat dau gach cheo
	jal GCheo_fout
	
	blt,$s3,10,month0_cau1 #kiem tra neu thang < 10
	#xuat thang
	jal Thang_fout
	
	#xuat dau gach cheo
	jal GCheo_fout
	
	#xuat nam
	jal Nam_fout
	
	#Nhay den ket thuc
	j hqthinh_fKetThuc

#######
#thuc hien khi thang < 10
month0_cau1:
	#xuat so 0
  	li   $v0, 15
  	move $a0, $s1
  	la   $a1, hqthinh_zero
  	li   $a2, 1
  	syscall	
	
	#chuyen int sang string
	move $a0,$s3
	jal itoa
	move $v1, $v0
	#xuat thang
  	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, ($v1)
  	li   $a2, 1
  	syscall
	
	#xuat dau gach cheo
	jal GCheo_fout
	
	#xuat nam
	jal Nam_fout
	
	#Nhay den ket thuc
	j hqthinh_fKetThuc

#######
.globl hqthinh_filecau2a
### truyen vao $a0 la dia chi con tro file
### xuat dinh dang cau 2a ra file
### khong co tra ve	
hqthinh_filecau2a: #Xuat ra file ket qua cau 2a
	###Dau thu tuc
	addi $sp, $sp,-24
	###Backup
	sw $ra,($sp)
	sw $a0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	sw $s4,20($sp)
	
	#Than thu tuc
	
	#lay cac gia tri tu $a0
	lw $s2,0($a0) #s2 = day
	lw $s3,4($a0) #s3 = month
	lw $s4,8($a0) #s4 = year
	
	blt,$s3,10,fout_0_m1 #kiem tra neu thang < 10
	#xuat thang
	jal Thang_fout
	
	#xuat dau gach cheo
	jal GCheo_fout
	
	blt,$s2,10,fout_0_d1 #kiem tra neu ngay < 10
	#xuat ngay
	jal Ngay_fout
	
	#xuat dau gach cheo
	jal GCheo_fout
	
	#xuat nam
	jal Nam_fout
	
	#Nhay den ket thuc
	j hqthinh_fKetThuc

#######
#thuc hien khi ngay < 10
fout_0_d1:
	#xuat so 0
  	li   $v0, 15
  	move $a0, $s1
  	la   $a1, hqthinh_zero
  	li   $a2, 1
  	syscall
	
	#chuyen int sang string
	move $a0,$s2
	jal itoa
	move $v1, $v0
	#xuat ngay
  	li   $v0, 15
  	move $a0, $s1
  	la   $a1, ($v1)
  	li   $a2, 1
  	syscall
	
	#xuat dau gach cheo
	jal GCheo_fout
	
	#xuat nam
	jal Nam_fout
	
	#Nhay den ket thuc
	j hqthinh_fKetThuc

#######
#thuc hien khi thang < 10
fout_0_m1:
	#xuat so 0
  	li   $v0, 15
  	move $a0, $s1
  	la   $a1, hqthinh_zero
  	li   $a2, 1
  	syscall	
	
	#chuyen int sang string
	move $a0,$s3
	jal itoa
	move $v1, $v0
	#xuat thang
  	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, ($v1)
  	li   $a2, 1
  	syscall
	
	#xuat dau gach cheo
	jal GCheo_fout
	
	blt,$s2,10,fout_0_d1 #kiem tra neu ngay < 10
	#xuat ngay
	jal Ngay_fout
	
	#xuat dau gach cheo
	jal GCheo_fout
	
	#xuat nam
	jal Nam_fout
	
	#Nhay den ket thuc
	j hqthinh_fKetThuc
	
#######
.globl hqthinh_filecau2b
### truyen vao $a0 la dia chi con tro file
### xuat dinh dang cau 2b ra file
### khong co tra ve	
hqthinh_filecau2b: #Xuat ra file ket qua cau 2b
	###Dau thu tuc
	addi $sp, $sp,-24
	###Backup
	sw $ra,($sp)
	sw $a0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	sw $s4,20($sp)
	
	#Than thu tuc
	
	#lay cac gia tri tu $a0
	lw $s2,0($a0) #s2 = day
	lw $s3,4($a0) #s3 = month
	lw $s4,8($a0) #s4 = year
	
	blt,$s2,10,fout_0_d2 #kiem tra neu ngay < 10
	#xuat ngay
	jal Ngay_fout
	
	#xuat dau cach
	jal Space_fout
	
	#xuat thang 1
	jal fthang_1
	
	#xuat dau phay
	jal Phay_fout
	
	#xuat nam
	jal Nam_fout
	
	#Nhay den ket thuc
	j hqthinh_fKetThuc

#######
#thuc hien khi ngay < 10
fout_0_d2:
	#in so 0
  	li   $v0, 15
  	move $a0, $s1
  	la   $a1, hqthinh_zero
  	li   $a2, 1
  	syscall
	
	#chuyen int sang string
	move $a0,$s2
	jal itoa
	move $v1, $v0
	#xuat ngay
  	li   $v0, 15
  	move $a0, $s1
  	la   $a1, ($v1)
  	li   $a2, 1
  	syscall
	
	#xuat dau phay
	jal Space_fout
	
	#xuat thang 1
	jal fthang_1
	
	#xuat dau phay
	jal Phay_fout
	
	#xuat nam
	jal Nam_fout	
	
	#Nhay den ket thuc
	j hqthinh_fKetThuc

#######
.globl hqthinh_filecau2c
### truyen vao $a0 la dia chi con tro file
### xuat dinh dang cau 2c ra file
### khong co tra ve	
hqthinh_filecau2c: #Xuat ra file ket qua cau 2c
	###Dau thu tuc
	addi $sp, $sp,-24
	###Backup
	sw $ra,($sp)
	sw $a0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	sw $s4,20($sp)
	
	#Than thu tuc
	
	#lay cac gia tri tu $a0
	lw $s2,0($a0) #s2 = day
	lw $s3,4($a0) #s3 = month
	lw $s4,8($a0) #s4 = year

	#xuat thang 1
	jal fthang_1
	
	#xuat dau cach
	jal Space_fout
	
	blt,$s2,10,fout_0_d3
	#xuat ngay
	jal Ngay_fout
	
	#xuat dau phay
	jal Phay_fout
	
	#xuat dau cach
	jal Space_fout
	
	#xuat nam
	jal Nam_fout
	
	#Nhay den ket thuc
	j hqthinh_fKetThuc

#######
#thuc hien khi ngay < 10
fout_0_d3:
	#xuat so 0
  	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_zero
  	li   $a2, 1
  	syscall
	
	#chuyen int sang string
	move $a0,$s2
	jal itoa
	move $v1, $v0
	#xuat ngay
  	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, ($v1)
  	li   $a2, 1
  	syscall
	
	#xuat dau phay
	jal Phay_fout
	
	#xuat dau cach
	jal Space_fout
	
	#xuat nam
	jal Nam_fout

	#Nhay den ket thuc
	j hqthinh_fKetThuc
#######
fthang_1:
	#backup
	addi $sp,$sp,-16
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $ra,12($sp)
	
	bgt,$s3,1,fthang_2
	#xuat thang 1
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_jan
  	li   $a2, 7
  	syscall
	
	#restore
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra

#######
fthang_2:
	
	bgt,$s3,2,fthang_3
	#xuat thang 2
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_feb
  	li   $a2, 8
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra
	
#######
fthang_3:
	
	bgt,$s3,3,fthang_4
	#xuat thang 3
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_mar
  	li   $a2, 5
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra
		
#######
fthang_4:
	
	bgt,$s3,4,fthang_5
	#xuat thang 4
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_apr
  	li   $a2, 5
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra
	
#######
fthang_5:
	
	bgt,$s3,5,fthang_6
	#xuat thang 5
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_may
  	li   $a2, 3
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra
	
#######
fthang_6:
	
	bgt,$s3,6,fthang_7
	#xuat thang 6
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_jun
  	li   $a2, 4
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra
	
#######
fthang_7:
	
	bgt,$s3,7,fthang_8
	#xuat thang 7
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_jul
  	li   $a2, 4
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra
	
#######
fthang_8:
	
	bgt,$s3,8,fthang_9
	#xuat thang 8
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_aug
  	li   $a2, 6
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra
	
#######
fthang_9:
	
	bgt,$s3,9,fthang_10
	#xuat thang 9
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_sep
  	li   $a2, 9
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra																																																					

#######
fthang_10:
	
	bgt,$s3,10,fthang_11
	#xuat thang 10
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_oct
  	li   $a2, 7
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra
#######
fthang_11:
	
	bgt,$s3,11,fthang_12
	#xuat thang 11
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_nov
  	li   $a2, 8
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra
	
#######
fthang_12:
	
	#xuat thang 12
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_dec
  	li   $a2, 8
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra
	
#######
Ngay_fout:
	#backup
	addi $sp,$sp,-16
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $ra,12($sp)
	
	move $a0,$s2 	#truyen vao $a0
	jal itoa 	#chuyen $a0 thanh chuoi va tra ve $v0
	move $v1, $v0 	#$v1 = $v0
	
	#xuat ngay
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, ($v1)
  	li   $a2, 2
  	syscall
	
	#restore
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra		
	
#######
Thang_fout:
	addi $sp,$sp,-16
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $ra,12($sp)
	
	move $a0,$s3	#truyen vao $a0
	jal itoa	#chuyen $a0 thanh chuoi va tra ve $v0
	move $v1,$v0	#$v1 = $v0
	
	#xuat thang
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, ($v1)
  	li   $a2, 2
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra
	
#######
Nam_fout:
	addi $sp,$sp,-16
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $ra,12($sp)
	
	move $a0,$s4	#truyen vao $a0
	jal itoa	#chuyen $a0 thanh chuoi va tra ve $v0
	move $v1,$v0	#$v1 = $v0
	
	#xuat nam
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, ($v1)
  	li   $a2, 4
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra	

#######
Space_fout:
	addi $sp,$sp,-16
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $ra,12($sp)
	
	#xuat dau cach
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_space
  	li   $a2, 1
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra	
	
#######
GCheo_fout:
	addi $sp,$sp,-16
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $ra,12($sp)
	
	#xuat dau gach cheo
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_gach_cheo
  	li   $a2, 1
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra	
	
#######
Phay_fout:
	addi $sp,$sp,-16
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $ra,12($sp)
	
	#xuat dau phay
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_phay
  	li   $a2, 1
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	jr $ra

#######
hqthinh_fKetThuc:	
	###Cuoi thu tuc
	###Restorex
	lw $ra,($sp)
	lw $a0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
	lw $s4,20($sp)
	###Xoa stack
	addi $sp, $sp,24
	###Tra ve
	jr $ra
	
##############
####################################
##############	


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
	
####------------------------------------------------------------------------####
