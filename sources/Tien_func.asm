.data  
fin: .asciiz "input.txt"
buffer: .space 4

.text
.globl NhapXuatFile

#Ham NhapXuatFile
#Chuc nang: Doc ngay thang nam tu file, thuc hien cac yeu cau va xuat ra file
#Tham so: 
## a0: chuoi ten file input
## a1: chuoi ten file output
#Tra ve:
## Khong co gia tri tra ve, chi co file output duoc thay doi
NhapXuatFile:
	#Mo file
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
	la   $a1, buffer	#Doc 4 byte vao a1   
	li   $a2, 4	    
	syscall
	move $s2 $a1		#Luu vao s2, s2 = day

	##Doc thang
	li   $v0, 14
	move $a0, $s1     
	la   $a1, buffer	#Doc 4 byte vao a1   
	li   $a2, 4	    
	syscall
	move $s3 $a1		#Luu vao s3, s3 = month

	##Doc nam
	li   $v0, 14
	move $a0, $s1     
	la   $a1, buffer	#Doc 4 byte vao a1   
	li   $a2, 4	    
	syscall
	move $s4 $a1		#Luu vao s4, s4 = year

	##Xu ly
	###Nhap ngay
	

	#Dong file
	li   $v0, 16       
	move $a0, $s6      
	syscall


#Ham NhapThamSo:
#Chuc nang: Tuong tu nhu ham nhap, tuy nhien thay vi nhap 3 thanh phan tu ban phim thi ta truyen 3 thanh phan
#	    do vao trong ham nhu 3 tham so
#Tham so:
## a0: day
## a1: month
## a2: year
#Tra ve:
## v0: chuoi ddmmyyyy
.globl NhapThamSo
NhapThamSo:



#Ham LaNamNhuan:
#Chuc nang: kiem tra xem nam duoc truyen vao co phai nam nhuan hay khong
#Tham so: a0 voi a0 la year
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