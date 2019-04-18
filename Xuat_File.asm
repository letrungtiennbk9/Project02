.data
	hqthinh_zero:	.asciiz "0"
	
.text
.globl hqthinh_xuatfile
### truyen vao $a0 la dia chi con tro file
### xuat 3 dinh dang ra file
### khong co tra ve
hqthinh_xuatfile:
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

######
#xuat file 'dd/mm/yyyy'
hqthinh_fcau1:
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
	
	#Nhay den dang 2
	j hqthinh_fdang1
	
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
	lw $a0,($s2)
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
	
	j hqthinh_fdang1

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
	lw $a0,($s3)
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
	
	j hqthinh_fdang1
		
#######
hqthinh_fdang1:
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
	
	#Nhay den dang 2
	j hqthinh_fdang2

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
	lw $a0,($s2)
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
	
	j hqthinh_fdang2

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
	lw $a0,($s3)
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
	
	j hqthinh_fdang2
	
#######
#dang 'dd month, yyyy'
hqthinh_fdang2:
	
	blt,$s2,10,fout_0_d2 #kiem tra neu ngay < 10
	#xuat ngay
	jal Ngay_fout
	
	#xuat dau cach
	jal Space_fout
	
	#xuat thang 1
	jal thang_1
	
	#xuat dau phay
	jal Phay_fout
	
	#xuat nam
	jal Nam_fout
	
	j hqthinh_fdang3

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
	lw $a0,($s2)
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
	jal thang_1
	
	#xuat dau phay
	jal Phay_fout
	
	#xuat nam
	jal Nam_fout	
	
	j hqthinh_fdang3

#######
#dang 'month dd, yyyy'
hqthinh_fdang3:

	#xuat thang 1
	jal thang_1
	
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
	lw $a0,($s2)
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
	
	lw $a0,($s2) 	#truyen vao $a0
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
	
	lw $a0,($s3)	#truyen vao $a0
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
	
	lw $a0,($s4)	#truyen vao $a0
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
  	la   $a1, hqthinh_cach
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
  	la   $a1, hqthinh_cheo
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
