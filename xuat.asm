.data
	### Cai nay de test thoi
	day: 	.word 0
	month: 	.word 0
	year: 	.word 0
	nhap_day: 	.asciiz "\nNhap ngay: "
	nhap_thang: 	.asciiz "\nNhap thang: "
	nhap_nam: 	.asciiz "\nNhap nam: "
	### Khong lien quan
	
	hqthinh_kq: 	.asciiz "\nKet qua: "
	hqthinh_menu: 	.asciiz "\n=======Menu======\nA. DD/MM/YYYY\nB. DD Month, YYYY.\nC. Month DD, YYYY\nD. Thoat\n==============\nChon:"
	hqthinh_gach_cheo: .asciiz "/"
	hqthinh_phay: 	.asciiz ", "
	hqthinh_space: 	.asciiz " "
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
.globl hqthinh_xuat
### demo nhap ngay vao va luu lai vao bien
### sau do luu tiep vao cac thanh ghi $s1,$s2,$s3  
### xuat ra menu de chon ket qua in ra
### cach in theo thu tu trong cac ham hqthinh_dang1, hqthinh_dang2, hqthinh_dang3
hqthinh_xuat:
	#Dau thu tuc
	addi $sp, $sp,-4
	#backup
	sw $ra,($sp)
	
	#xuat tb nhap_nam
	li $v0,4
	la $a0,nhap_nam
	syscall
	
	#nhap nam
	li $v0,5
	syscall
	sw $v0,year
	#################
	
	#xuat tb nhap_thang
	li $v0,4
	la $a0,nhap_thang
	syscall
	
	#nhap thang
	li $v0,5
	syscall
	sw $v0,month
	##############
	
	#xuat tb nhap_ngay
	li $v0,4
	la $a0,nhap_day
	syscall
	
	#nhap day
	li $v0,5
	syscall
	sw $v0,day
	######################
	
	#luu lai cac gia tri
	lw $s1,year
	lw $s2,month
	lw $s3,day

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
#dang 'dd/mm/yyyy'
hqthinh_dang1:	
	#xuat tb ket_qua
	li $v0,4
	la $a0,hqthinh_kq
	syscall

	blt,$s3,10,in_0_day1 #kiem tra neu ngay < 10
	#xuat ngay
	li $v0,1
	lw $a0,day
	syscall
	
	#xuat dau gach cheo
	jal XuatGachCheo
	
	blt,$s2,10,in_0_month1 #kiem tra neu thang < 10
	#xuat thang
	li $v0,1
	lw $a0,month
	syscall
	
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
	li $v0,1
	lw $a0,day
	syscall
	
	#xuat dau gach cheo
	jal XuatGachCheo
	
	blt,$s2,10,in_0_month1 #kiem tra neu thang < 10
	#xuat thang
	li $v0,1
	lw $a0,month
	syscall
	
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
	li $v0,1
	lw $a0,month
	syscall
	
	#xuat dau gach cheo
	jal XuatGachCheo
	
	#xuat nam
	jal XuatNam
	
	j hqthinh_XuatMenu
				
#######
#dang 'dd month, yyyy'
hqthinh_dang2:
	#xuat tb ket_qua
	li $v0,4
	la $a0,hqthinh_kq
	syscall
	
	blt,$s3,10,in_0_day2 #kiem tra neu ngay < 10
	#xuat ngay
	li $v0,1
	lw $a0,day
	syscall
	
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
	li $v0,1
	lw $a0,day
	syscall
	
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
	li $v0,4
	la $a0,hqthinh_kq
	syscall

	#xuat thang 1
	jal thang_1
	
	#xuat dau cach
	jal XuatDauCach
	
	blt,$s3,10,in_0_day3
	#xuat ngay
	li $v0,1
	lw $a0,day
	syscall
	
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
	li $v0,1
	lw $a0,day
	syscall
	
	#xuat dau phay
	jal XuatDauPhay
	
	#xuat nam
	jal XuatNam
	
	j hqthinh_XuatMenu

#######
thang_1:
	bgt,$s2,1,thang_2
	#xuat thang 1
	li $v0,4
	la $a0,hqthinh_jan
	syscall
	
	jr $ra

#######
thang_2:
	bgt,$s2,2,thang_3
	#xuat thang 2
	li $v0,4
	la $a0,hqthinh_feb
	syscall
	
	jr $ra
	
#######
thang_3:
	bgt,$s2,3,thang_4
	#xuat thang 3
	li $v0,4
	la $a0,hqthinh_mar
	syscall
	
	jr $ra
		
#######
thang_4:
	bgt,$s2,4,thang_5
	#xuat thang 4
	li $v0,4
	la $a0,hqthinh_apr
	syscall		
	
	jr $ra
	
#######
thang_5:
	bgt,$s2,5,thang_6
	#xuat thang 5
	li $v0,4
	la $a0,hqthinh_may
	syscall
	
	jr $ra
	
#######
thang_6:
	bgt,$s2,6,thang_7
	#xuat thang 6
	li $v0,4
	la $a0,hqthinh_jun
	syscall
	
	jr $ra
	
#######
thang_7:
	bgt,$s2,7,thang_8
	#xuat thang 7
	li $v0,4
	la $a0,hqthinh_jul
	syscall
	
	jr $ra
	
#######
thang_8:
	bgt,$s2,8,thang_9
	#xuat thang 8
	li $v0,4
	la $a0,hqthinh_aug
	syscall
	
	jr $ra
	
#######
thang_9:
	bgt,$s2,9,thang_10
	#xuat thang 9
	li $v0,4
	la $a0,hqthinh_sep
	syscall
	
	jr $ra																																																								

#######
thang_10:
	bgt,$s2,10,thang_11
	#xuat thang 10
	li $v0,4
	la $a0,hqthinh_oct
	syscall

	jr $ra

#######
thang_11:
	bgt,$s2,11,thang_12
	#xuat thang 11
	li $v0,4
	la $a0,hqthinh_nov
	syscall
	
	jr $ra
	
#######
thang_12:
	#xuat thang 12
	li $v0,4
	la $a0,hqthinh_dec
	syscall
	
	jr $ra
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											
#######
XuatNam:
	#xuat nam
	li $v0,1
	lw $a0,year
	syscall
		
	jr $ra	

#######
XuatDauCach:
	#xuat nam
	li $v0,4
	la $a0,hqthinh_space
	syscall
		
	jr $ra	
	
#######
XuatGachCheo:
	li $v0,4
	la $a0,hqthinh_gach_cheo
	syscall
	
	jr $ra	
	
#######
XuatDauPhay:
	li $v0,4
	la $a0,hqthinh_phay
	syscall
	
	jr $ra
	
#######
#xuat thong bao nhap sai
hqthinh_NhapSai: 
	#xuat tb_sai
	li $v0,4
	la $a0,hqthinh_tb_sai
	syscall

	j hqthinh_XuatMenu
		
#######
hqthinh_KetThuc:	
	### Cuoi thu tuc
	#restore
	lw $ra,($sp)
	###Xoa stack
	addi $sp, $sp, 4
