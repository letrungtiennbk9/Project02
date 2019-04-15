.data
	
.text
.globl hqthinh_XuatTime
### truyen vao $s1, $s2, $s3 theo thu tu day,month,year
### xuat dd/mm/yyyy ra man hinh
### khong co tra ve
hqthinh_XuatTime:
	###Dau thu tuc
	addi $sp, $sp,-20
	###Backup
	sw $ra,($sp)
	sw $a0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	
	#lay cac gia tri tu $a0
	move $s1,0($a0) #s1 = day
	move $s2,4($a0) #s2 = month
	move $s3,8($a0) #s3 = year
	
hqthinh_ddmmyyyy:
	blt,$s1,10,day_1_ditgit #kiem tra neu ngay < 10
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
	