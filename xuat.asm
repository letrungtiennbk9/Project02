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
	
.text
.globl hqthinh_Cau1
### truyen vao $s1, $s2, $s3 theo thu tu day,month,year
### xuat dd/mm/yyyy ra man hinh
### khong co tra ve
hqthinh_Cau1:
	###Dau thu tuc
	addi $sp, $sp,-20
	###Backup
	sw $ra,($sp)
	sw $a0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	
	#lay cac gia tri tu $a0
	lw $s3,0($a0) #s1 = day
	lw $s2,4($a0) #s2 = month
	lw $s1,8($a0) #s3 = year
	
hqthinh_ddmmyyyy:
	blt,$s3,10,day_1_ditgit #kiem tra neu ngay < 10
	#xuat ngay
	jal XuatNgay
	
	#xuat dau gach cheo
	jal XuatGachCheo
	
	blt,$s2,10,month_1_ditgit #kiem tra neu thang < 10
	#xuat thang
	jal XuatThang
	
	#xuat dau gach cheo
	jal XuatGachCheo
	
	#xuat nam
	jal XuatNam
	
	j hqthinh_KetThuc1

########
day_1_ditgit:
	li $v0,1
	li $a0,0
	syscall	
	
	#xuat ngay
	jal XuatNgay
	
	#xuat dau gach cheo
	jal XuatGachCheo
	
	blt,$s2,10,month_1_ditgit #kiem tra neu thang < 10
	#xuat thang
	jal XuatThang
	
	#xuat dau gach cheo
	jal XuatGachCheo
	
	#xuat nam
	jal XuatNam
	
	j hqthinh_KetThuc1

########
month_1_ditgit:
	li $v0,1
	li $a0,0
	syscall	
	
	#xuat thang
	jal XuatThang
	
	#xuat dau gach cheo
	jal XuatGachCheo
	
	#xuat nam
	jal XuatNam
	
	j hqthinh_KetThuc1

########
hqthinh_KetThuc1:
	###Cuoi thu tuc
	###Restore
	lw $ra,($sp)
	lw $a0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
	###Xoa stack
	addi $sp, $sp,20
	###Tra ve
	jr $ra
	
.globl hqthinh_xuat
### load du lieu dd,mm,yyyy len cac thanh ghi $s1,$s2,$s3 
### truyen vao $s1, $s2, $s3
### xuat ra menu de chon ket qua in ra
### cach in theo thu tu trong cac ham hqthinh_dang1, hqthinh_dang2, hqthinh_dang3
hqthinh_xuat:
	###Dau thu tuc
	addi $sp, $sp,-24
	###Backup
	sw $ra,($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $s1,12($sp)
	sw $s2,16($sp)
	sw $s3,20($sp)
	
	#lay cac gia tri tu $a0
	lw $s3,0($a0)
	lw $s2,4($a0)
	lw $s1,8($a0)

######
#xuat ra menu cac lua chon	
hqthinh_XuatMenu:
	
	#Xuat menu
	li $v0,4
	la $a0,hqthinh_menu
	syscall

	#Nhap chon
	li $v0,12
	li $a1,3
	syscall

	#luu vao $t0
	move $t0,$v0 
	
	#kiem tra chon
	beq $t0,'A',hqthinh_dang1
	beq $t0,'B',hqthinh_dang2
	beq $t0,'C',hqthinh_dang3
	beq $t0,'D',hqthinh_KetThuc
	
	j hqthinh_NhapSai
	
#######
#dang 'mm/dd/yyyy'
hqthinh_dang1:	
	#xuat tb ket_qua
	jal ThongBaoKQ

	blt,$s2,10,in_0_month1 #kiem tra neu thang < 10
	#xuat thang
	jal XuatThang
	
	#xuat dau gach cheo
	jal XuatGachCheo
	
	blt,$s3,10,in_0_day1 #kiem tra neu ngay < 10
	#xuat ngay
	jal XuatNgay
	
	#xuat dau gach cheo
	jal XuatGachCheo
	
	#xuat nam
	jal XuatNam
	
	j hqthinh_XuatMenu
	
#######
#thuc hien khi ngay < 10
in_0_day1:
	li $v0,1
	li $a0,0
	syscall	
	
	#xuat ngay
	jal XuatNgay
	
	#xuat dau gach cheo
	jal XuatGachCheo
	
	#xuat nam
	jal XuatNam
	
	j hqthinh_XuatMenu

#######
#thuc hien khi thang < 10
in_0_month1:
	li $v0,1
	li $a0,0
	syscall	
	
	#xuat thang
	jal XuatThang
	
	#xuat dau gach cheo
	jal XuatGachCheo
	
	blt,$s3,10,in_0_day1 #kiem tra neu ngay < 10
	#xuat ngay
	jal XuatNgay
	
	#xuat dau gach cheo
	jal XuatGachCheo
	
	#xuat nam
	jal XuatNam
	
	j hqthinh_XuatMenu
				
#######
#dang 'dd month, yyyy'
hqthinh_dang2:
	#xuat tb ket_qua
	jal ThongBaoKQ
	
	blt,$s3,10,in_0_day2 #kiem tra neu ngay < 10
	#xuat ngay
	jal XuatNgay
	
	#xuat dau cach
	jal XuatDauCach
	
	#xuat thang 1
	jal thang_1
	
	#xuat dau phay
	jal XuatDauPhay
	
	#xuat nam
	jal XuatNam
	
	j hqthinh_XuatMenu

#######
#thuc hien khi ngay < 10
in_0_day2:
	li $v0,1
	li $a0,0
	syscall	
	
	#xuat ngay
	jal XuatNgay
	
	#xuat dau phay
	jal XuatDauCach
	
	#xuat thang 1
	jal thang_1
	
	#xuat dau phay
	jal XuatDauPhay
	
	#xuat nam
	jal XuatNam
	
	j hqthinh_XuatMenu	

#######
#dang 'month dd, yyyy'
hqthinh_dang3:
	#xuat tb ket_qua
	jal ThongBaoKQ

	#xuat thang 1
	jal thang_1
	
	#xuat dau cach
	jal XuatDauCach
	
	blt,$s3,10,in_0_day3
	#xuat ngay
	jal XuatNgay
	
	#xuat dau phay
	jal XuatDauPhay
	
	#xuat nam
	jal XuatNam
	
	j hqthinh_XuatMenu

#######
#thuc hien khi ngay < 10
in_0_day3:
	li $v0,1
	li $a0,0
	syscall	
	
	#xuat ngay
	jal XuatNgay
	
	#xuat dau phay
	jal XuatDauPhay
	
	#xuat nam
	jal XuatNam
	
	j hqthinh_XuatMenu

#######
thang_1:
	addi $sp,$sp,-4
	sw $a0,($sp)
	
	bgt,$s2,1,thang_2
	#xuat thang 1
	li $v0,4
	la $a0,hqthinh_jan
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra

#######
thang_2:
	addi $sp,$sp,-4
	sw $a0,($sp)

	bgt,$s2,2,thang_3
	#xuat thang 2
	li $v0,4
	la $a0,hqthinh_feb
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra
	
#######
thang_3:
	addi $sp,$sp,-4
	sw $a0,($sp)
	
	bgt,$s2,3,thang_4
	#xuat thang 3
	li $v0,4
	la $a0,hqthinh_mar
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra
		
#######
thang_4:
	addi $sp,$sp,-4
	sw $a0,($sp)
	
	bgt,$s2,4,thang_5
	#xuat thang 4
	li $v0,4
	la $a0,hqthinh_apr
	syscall		
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra
	
#######
thang_5:
	addi $sp,$sp,-4
	sw $a0,($sp)
	
	bgt,$s2,5,thang_6
	#xuat thang 5
	li $v0,4
	la $a0,hqthinh_may
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra
	
#######
thang_6:
	addi $sp,$sp,-4
	sw $a0,($sp)
	
	bgt,$s2,6,thang_7
	#xuat thang 6
	li $v0,4
	la $a0,hqthinh_jun
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra
	
#######
thang_7:
	addi $sp,$sp,-4
	sw $a0,($sp)
	
	bgt,$s2,7,thang_8
	#xuat thang 7
	li $v0,4
	la $a0,hqthinh_jul
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra
	
#######
thang_8:
	addi $sp,$sp,-4
	sw $a0,($sp)
	
	bgt,$s2,8,thang_9
	#xuat thang 8
	li $v0,4
	la $a0,hqthinh_aug
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra
	
#######
thang_9:
	addi $sp,$sp,-4
	sw $a0,($sp)
	
	bgt,$s2,9,thang_10
	#xuat thang 9
	li $v0,4
	la $a0,hqthinh_sep
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra																																																								

#######
thang_10:
	addi $sp,$sp,-4
	sw $a0,($sp)
	
	bgt,$s2,10,thang_11
	#xuat thang 10
	li $v0,4
	la $a0,hqthinh_oct
	syscall

	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra

#######
thang_11:
	addi $sp,$sp,-4
	sw $a0,($sp)
	
	bgt,$s2,11,thang_12
	#xuat thang 11
	li $v0,4
	la $a0,hqthinh_nov
	syscall
	
	jr $ra
	
#######
thang_12:
	addi $sp,$sp,-4
	sw $a0,($sp)
	
	#xuat thang 12
	li $v0,4
	la $a0,hqthinh_dec
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra
	
#######
ThongBaoKQ:
	addi $sp,$sp,-4
	sw $a0,($sp)
	#xuat tb_kq
	li $v0,4
	la $a0,hqthinh_kq
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra	
	
#######
XuatNgay:
	addi $sp,$sp,-4
	sw $a0,($sp)
	#xuat nam
	li $v0,1
	move $a0,$s3
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra		
	
#######
XuatThang:
	addi $sp,$sp,-4
	sw $a0,($sp)
	#xuat nam
	li $v0,1
	move $a0,$s2
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra	
	
#######
XuatNam:
	addi $sp,$sp,-4
	sw $a0,($sp)
	#xuat nam
	li $v0,1
	move $a0,$s1
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra	

#######
XuatDauCach:
	addi $sp,$sp,-4
	sw $a0,($sp)
	#xuat nam
	li $v0,4
	la $a0,hqthinh_space
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4	
	jr $ra	
	
#######
XuatGachCheo:
	addi $sp,$sp,-4
	sw $a0,($sp)
	
	li $v0,4
	la $a0,hqthinh_gach_cheo
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra	
	
#######
XuatDauPhay:
	addi $sp,$sp,-4
	sw $a0,($sp)
	
	li $v0,4
	la $a0,hqthinh_phay
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	jr $ra
	
#######
#xuat thong bao nhap sai
hqthinh_NhapSai:
	addi $sp,$sp,-4
	sw $a0,($sp)
	
	#xuat tb_sai
	li $v0,4
	la $a0,hqthinh_tb_sai
	syscall
	
	lw $a0,($sp)
	addi $sp,$sp,4
	j hqthinh_XuatMenu
		
#######
hqthinh_KetThuc:	
	###Cuoi thu tuc
	###Restore
	lw $ra,($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $s1,12($sp)
	lw $s2,16($sp)
	lw $s3,20($sp)
	###Xoa stack
	addi $sp, $sp,24
	###Tra ve
	jr $ra
	
#########################################################
#################### XUAT RA FILE #######################
#########################################################
	
.globl hqthinh_filecau1
### truyen vao $a0 la dia chi con tro file
### xuat 3 dinh dang ra file
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
	
	blt,$s3,10,fout_0_m1 #kiem tra neu thang < 10
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
### xuat 3 dinh dang ra file
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
### xuat 3 dinh dang ra file
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
### xuat 3 dinh dang ra file
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
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	bgt,$s3,1,thang_2
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
	addi $sp,$sp,12
	jr $ra

#######
fthang_2:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	bgt,$s3,2,thang_3
	#xuat thang 2
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_feb
  	li   $a2, 8
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	addi $sp,$sp,12
	jr $ra
	
#######
fthang_3:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	bgt,$s3,3,thang_4
	#xuat thang 3
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_mar
  	li   $a2, 5
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	addi $sp,$sp,12
	jr $ra
		
#######
fthang_4:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	bgt,$s3,4,thang_5
	#xuat thang 4
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_apr
  	li   $a2, 5
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	addi $sp,$sp,12
	jr $ra
	
#######
fthang_5:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	bgt,$s3,5,thang_6
	#xuat thang 5
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_may
  	li   $a2, 3
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	addi $sp,$sp,12
	jr $ra
	
#######
fthang_6:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	bgt,$s3,6,thang_7
	#xuat thang 6
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_jun
  	li   $a2, 4
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	addi $sp,$sp,12
	jr $ra
	
#######
fthang_7:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	bgt,$s3,7,thang_8
	#xuat thang 7
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_jul
  	li   $a2, 4
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	addi $sp,$sp,12
	jr $ra
	
#######
fthang_8:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	bgt,$s3,8,thang_9
	#xuat thang 8
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_aug
  	li   $a2, 6
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	addi $sp,$sp,12
	jr $ra
	
#######
fthang_9:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	bgt,$s3,9,thang_10
	#xuat thang 9
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_sep
  	li   $a2, 9
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	addi $sp,$sp,12
	jr $ra																																																							

#######
fthang_10:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	bgt,$s3,10,thang_11
	#xuat thang 10
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_oct
  	li   $a2, 7
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	addi $sp,$sp,12
	jr $ra

#######
fthang_11:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	bgt,$s3,11,thang_12
	#xuat thang 11
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_nov
  	li   $a2, 8
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	addi $sp,$sp,12
	jr $ra
	
#######
fthang_12:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	#xuat thang 12
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_dec
  	li   $a2, 8
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	addi $sp,$sp,12
	jr $ra
	
#######
Ngay_fout:
	#backup
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
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
	addi $sp,$sp,12
	jr $ra		
	
#######
Thang_fout:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
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
	addi $sp,$sp,12
	jr $ra	
	
#######
Nam_fout:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
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
	addi $sp,$sp,12
	jr $ra	

#######
Space_fout:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	#xuat dau cach
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_space
  	li   $a2, 1
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	addi $sp,$sp,12
	jr $ra	
	
#######
GCheo_fout:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	#xuat dau gach cheo
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_gach_cheo
  	li   $a2, 1
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	addi $sp,$sp,12
	jr $ra	
	
#######
Phay_fout:
	addi $sp,$sp,-12
	sw $a0,($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	
	#xuat dau phay
	li   $v0, 15
  	move $a0, $s1	
  	la   $a1, hqthinh_phay
  	li   $a2, 1
  	syscall
	
	lw $a0,($sp)
	lw $a1,4($sp)
	lw $a2,8($sp)
	addi $sp,$sp,12
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
	
