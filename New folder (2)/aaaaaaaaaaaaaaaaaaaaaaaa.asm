.data
fin: .asciiz "input.txt"
fio: .asciiz "output.txt"
tien_tbNhuan: .asciiz " la nam nhuan\r\n"
tien_tbKhongNhuan: .asciiz " la nam thuong\r\n"
b1: .space 100
b2: .space 100
b3: .space 100
b4: .space 100
b5: .space 100
b6: .space 100
bs: .space 100
tien_tbNo0_1: .asciiz "Chuoi TIME_1 khong hop le\r\n"
tien_tbNo0_2: .asciiz "Chuoi TIME_2 khong hop le\r\n"
tien_tbNo0_3: .asciiz "Chuoi TIME_1 va TIME_2 khong hop le\r\n"
tien_tbNo1: .asciiz "1. "
tien_tbNo2: .asciiz "\r\n"
tien_tbNo2_1: .asciiz "2A. "
tien_tbNo2_2: .asciiz "2B. "
tien_tbNo2_3: .asciiz "2C. "
tien_tbNo3: .asciiz "3. "
tien_tbNo4: .asciiz "4. "
tien_tbNo5: .asciiz "5. "
tien_tbNo6: .asciiz "6. "
tien_tbNo7: .asciiz "7. "
tien_tbNo8: .asciiz "8. "
tien_tbNo4_chung: .asciiz " la thu "
tien_tbNo4_t2: .asciiz " Hai\r\n"
tien_tbNo4_t3: .asciiz " Ba\r\n"
tien_tbNo4_t4: .asciiz " Tu\r\n"
tien_tbNo4_t5: .asciiz " Nam\r\n"
tien_tbNo4_t6: .asciiz " Sau\r\n"
tien_tbNo4_t7: .asciiz " Bay\r\n"
tien_tbNo4_cn: .asciiz " CN\r\n"
tien_tbNo5_1: .asciiz "Khoang cach tu ngay 01/01/0001 den ngay "
tien_tbNo5_2: .asciiz " la "
tien_tbNo5_3: .asciiz " ngay\r\n"
tien_tbNo6_1: .asciiz " la nam "
tien_tbNo6_2: .asciiz " \r\n"
tien_tbNo7_1: .asciiz "Khoang cach tu ngay "
tien_tbNo7_2: .asciiz " den ngay "
tien_tbNo7_3: .asciiz " la "
tien_tbNo7_4: .asciiz " ngay\r\n"
tien_tbNo8_1: .asciiz "Hai nam nhuan gan nhat voi "
tien_tbNo8_2: .asciiz " la "
tien_tbNo8_3: .asciiz " va "
tien_tbNo8_4: .asciiz "\r\n"

	Thong_sun: .asciiz "Sun"
	Thong_mon: .asciiz "Mon"
	Thong_tues: .asciiz "Tues"
	Thong_wed: .asciiz "Wed"
	Thong_thurs: .asciiz "Thurs"
	Thong_fri: .asciiz "Fri"
	Thong_sat: .asciiz "Sat"


	



.text
	#Mo file de ghi
	li $v0 13
	la $a0 fio
	li $a1 1	#a1 = 1 =>> mo de ghi
	li $a2 0
	syscall
	move $s0 $v0	#Luc nay con tro file duoc luu o s0


	#Mo file de doc
	li   $v0, 13
	la   $a0, fin       
	li   $a1, 0       
	li   $a2, 0
	syscall            
	move $s6, $v0	#Cuoi cung, con tro file se duoc luu o s1  

	#Doc file:
	##Doc ngay:
	li   $v0, 14
	move $a0, $s6    
	la   $a1, b1	#Doc 2 byte vao a1   
	li   $a2, 2	    	#Do dai chuoi can doc la 1 byte
	syscall
	move $s2 $a1		#Luu vao s2, s2 = day (ascii)
	###Chuyen thanh int
	move $a0 $s2
	jal atoi
	move $t2 $v0	#Chuyen ket qua vao bien, luc nay t2 = day (int)


	##Doc dau cach:
	li   $v0, 14
	move $a0, $s6    
	la   $a1, bs	#Doc 2 byte vao a1   
	li   $a2, 1	    	#Do dai chuoi can doc la 1 byte
	syscall


	##Doc thang
	li   $v0, 14
	move $a0, $s6    
	la   $a1, b2
	li   $a2, 2	    
	syscall
	move $s3 $a1		#Luu vao s3, s3 = month (ascii)
	###Chuyen thanh int
	move $a0 $s3
	jal atoi
	move $t3 $v0	#Chuyen ket qua vao bien tam, luc nay t3 = month (int)


	##Doc dau cach:
	li   $v0, 14
	move $a0, $s6    
	la   $a1, bs	#Doc 2 byte vao a1   
	li   $a2, 1	    	#Do dai chuoi can doc la 1 byte
	syscall


	##Doc nam
	li   $v0, 14
	move $a0, $s6    
	la   $a1, b3	#Doc 4 byte vao a1   
	li   $a2, 4	    	#Chieu dai can doc la 4 byte
	syscall
	move $s4 $a1		#Luu vao s4, s4 = year (ascii)
	###Chuyen thanh int
	move $a0 $s4
	jal atoi
	move $t4 $v0	#Chuyen ket qua vao bien tam, luc nay t4 = year (int)
	

	#Doc dau xuong dong
	li   $v0, 14
	move $a0, $s6    
	la   $a1, bs	#Doc 2 byte vao a1   
	li   $a2, 2	    	#Do dai chuoi can doc la 1 byte
	syscall


	##Doc ngay2:
	li   $v0, 14
	move $a0, $s6    
	la   $a1, b4	#Doc 2 byte vao a1   
	li   $a2, 2	    	#Do dai chuoi can doc la 2 byte
	syscall
	move $s1 $a1		#Luu vao s1, s1 = day2 (ascii)
	###Chuyen thanh int
	move $a0 $s1
	jal atoi
	move $t1 $v0	#Chuyen ket qua vao bien, luc nay t1 = day2 (int)


	##Doc dau cach:
	li   $v0, 14
	move $a0, $s6    
	la   $a1, bs	#Doc 2 byte vao a1   
	li   $a2, 1	    	#Do dai chuoi can doc la 1 byte
	syscall
	

	##Doc thang2
	li   $v0, 14
	move $a0, $s6    
	la   $a1, b5
	li   $a2, 2	    
	syscall
	move $s5 $a1		#Luu vao s5, s5 = month2 (ascii)
	###Chuyen thanh int
	move $a0 $s5
	jal atoi
	move $t5 $v0	#Chuyen ket qua vao bien tam, luc nay t5 = month2 (int)

	
	##Doc dau cach:
	li   $v0, 14
	move $a0, $s6    
	la   $a1, bs	#Doc 2 byte vao a1   
	li   $a2, 1	    	#Do dai chuoi can doc la 1 byte
	syscall


	##Doc nam2
	li   $v0, 14
	move $a0, $s6    
	la   $a1, b6	#Doc 4 byte vao a1   
	li   $a2, 4	    	#Chieu dai can doc la 4 byte
	syscall
	move $s7 $a1		#Luu vao s7, s7 = year2 (ascii)
	###Chuyen thanh int
	move $a0 $s7
	jal atoi
	move $t7 $v0	#Chuyen ket qua vao bien tam, luc nay t7 = year2 (int)

	
	#Kiem tra du lieu
	move $a0 $t2
	move $a1 $t3
	move $a2 $t4
	jal suu_kiemtrahople
	move $t8 $v0
	
	move $a0 $t1
	move $a1 $t5
	move $a2 $t7
	jal suu_kiemtrahople
	move $t9 $v0

	beq $t8 1 NhapXuatFile_1
	beq $t8 0 NhapXuatFile_2
	NhapXuatFile_1:
		beq $t9 1 NhapXuatFile_TiepTuc
		beq $t9 0 NhapXuatFile_1.1
		NhapXuatFile_1.1:
			#In thong bao loi ra file
			li $v0 15
			move $a0 $s0
			la $a1 tien_tbNo0_2
			li $a2 27
			syscall

			j NhapXuatFile_DongFile
	NhapXuatFile_2:
		beq $t9 1 NhapXuatFile_2.1
		beq $t9 0 NhapXuatFile_2.2
		NhapXuatFile_2.1:
			li $v0 15
			move $a0 $s0
			la $a1 tien_tbNo0_1
			li $a2 27
			syscall

			j NhapXuatFile_DongFile
		NhapXuatFile_2.2:
			li $v0 15
			move $a0 $s0
			la $a1 tien_tbNo0_3
			li $a2 37
			syscall

			j NhapXuatFile_DongFile
			

	NhapXuatFile_TiepTuc:
	#Nhap ngay thang nam (Tuong duong voi doan nhap ngay thang nam cua console)
	move $a0 $t1
	move $a1 $t5
	move $a2 $t7
	jal suu_Nhap_ThamSo
	move $t6 $v0	#Mang tra ve luu o t6


	#Nhap ngay thang nam (Tuong duong voi doan nhap ngay thang nam cua console)
	move $a0 $t2
	move $a1 $t3
	move $a2 $t4
	jal suu_Nhap_ThamSo
	move $t0 $v0	#Mang tra ve luu o t0





	#Cau1
	##In thong bao tong
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo1
	li $a2 3
	syscall
	
	move $s1 $s0
	move $a0 $t0
	jal hqthinh_filecau1





	#Cau2
	##In dau xuong dong
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo2
	li $a2 2
	syscall

	##In thong bao
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo2_1
	li $a2 4
	syscall

	move $s1 $s0
	move $a0 $t0
	jal hqthinh_filecau2a

	##In dau xuong dong
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo2
	li $a2 2
	syscall

	##In thong bao
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo2_2
	li $a2 4
	syscall

	move $s1 $s0
	move $a0 $t0
	jal hqthinh_filecau2b

	##In dau xuong dong
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo2
	li $a2 2
	syscall

	##In thong bao
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo2_3
	li $a2 4
	syscall

	move $s1 $s0
	move $a0 $t0
	jal hqthinh_filecau2c

	##In dau xuong dong
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo2
	li $a2 2
	syscall




	#Cau3
	##In STT
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo3	
	li $a2 3
	syscall
	##Lay chieu dai chuoi chua year de in
	move $a0 $s4
	jal ChieuDaiChuoi
	move $a2 $v0	#Truyen a2 phuc vu cho viec goi ham in ben duoi
	##In nam
	li $v0 15
	move $a0 $s0
	move $a1 $s4	
	####a2 da duoc truyen phia tren
	syscall
	##Kiem tra nam nhuan
	move $a0 $t4
	jal LaNamNhuan
	bne $v0 $0 XuatTBNhuan
	beq $v0 $0 XuatTBKhongNhuan
	XuatTBNhuan:
		##In ra file
		li $v0 15
		move $a0 $s0
		la $a1 tien_tbNhuan		
		li $a2 15
		syscall
	
		j XuatTB_Done
	XuatTBKhongNhuan:
		li $v0 15
		move $a0 $s0
		la $a1 tien_tbKhongNhuan
		li $a2 16
		syscall
		j XuatTB_Done
	XuatTB_Done:





	#Cau4
	##In STT
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo4	
	li $a2 3
	syscall
	##In ngay thang nam
	move $s1 $s0
	move $a0 $t0
	jal hqthinh_filecau1
	##In thong bao chung
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo4_chung
	li $a2 7
	syscall
	##Goi ham de tim thu may
	move $a0 $t0
	jal Thong_Weekday
	move $t1 $v0
	##In ra file tuong ung
	####Kiem tra neu ket qua tra ve cua ham weekday == mon, in ra file "thu Hai"
	move $a0 $t1
	la $a1 Thong_mon
	jal SSChuoi

	bne $v0 $0 NhapXuatFile_inThuHai
	beq $v0 $0 NhapXuatFile_TiepTuc1
	NhapXuatFile_inThuHai:
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo4_t2
	li $a2 6
	syscall

	j NhapXuatFile_KT

	NhapXuatFile_TiepTuc1:
	####Kiem tra neu ket qua tra ve cua ham weekday == tues, in ra file "thu Ba"
	move $a0 $t1
	la $a1 Thong_tues
	jal SSChuoi

	bne $v0 $0 NhapXuatFile_inThuBa
	beq $v0 $0 NhapXuatFile_TiepTuc2
	NhapXuatFile_inThuBa:
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo4_t3
	li $a2 5
	syscall

	j NhapXuatFile_KT

	NhapXuatFile_TiepTuc2:
	####Kiem tra neu ket qua tra ve cua ham weekday == wed, in ra file "thu Tu"
	move $a0 $t1
	la $a1 Thong_wed
	jal SSChuoi

	bne $v0 $0 NhapXuatFile_inThuTu
	beq $v0 $0 NhapXuatFile_TiepTuc3
	NhapXuatFile_inThuTu:
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo4_t4
	li $a2 5
	syscall
	
	j NhapXuatFile_KT

	NhapXuatFile_TiepTuc3:
	####Kiem tra neu ket qua tra ve cua ham weekday == thurs, in ra file "thu Nam"
	move $a0 $t1
	la $a1 Thong_thurs
	jal SSChuoi

	bne $v0 $0 NhapXuatFile_inThuNam
	beq $v0 $0 NhapXuatFile_TiepTuc4
	NhapXuatFile_inThuNam:
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo4_t5
	li $a2 6
	syscall

	j NhapXuatFile_KT

	NhapXuatFile_TiepTuc4:
	####Kiem tra neu ket qua tra ve cua ham weekday == fri, in ra file "thu Sau"
	move $a0 $t1
	la $a1 Thong_fri
	jal SSChuoi

	bne $v0 $0 NhapXuatFile_inThuSau
	beq $v0 $0 NhapXuatFile_TiepTuc5
	NhapXuatFile_inThuSau:
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo4_t6
	li $a2 6
	syscall

	j NhapXuatFile_KT

	NhapXuatFile_TiepTuc5:
	####Kiem tra neu ket qua tra ve cua ham weekday == sat, in ra file "thu Bay"
	move $a0 $t1
	la $a1 Thong_sat
	jal SSChuoi

	bne $v0 $0 NhapXuatFile_inThuBay
	beq $v0 $0 NhapXuatFile_TiepTuc6
	NhapXuatFile_inThuBay:
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo4_t7
	li $a2 6
	syscall

	j NhapXuatFile_KT

	NhapXuatFile_TiepTuc6:
	####Kiem tra neu ket qua tra ve cua ham weekday == sun, in ra file "CN"
	move $a0 $t1
	la $a1 Thong_sun
	jal SSChuoi

	bne $v0 $0 NhapXuatFile_inCN
	NhapXuatFile_inCN:
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo4_cn
	li $a2 5
	syscall

	j NhapXuatFile_KT

	####Nhay den ket thuc neeee
	NhapXuatFile_KT:


	
	
	
	#Cau5
	#In STT
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo5
	li $a2 3
	syscall
	##In tb1
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo5_1
	li $a2 40
	syscall
	##In ngay can tinh
	move $a0 $t0
	move $s1 $s0
	jal hqthinh_filecau1
	##In tb2
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo5_2
	li $a2 4
	syscall
	##Tinh so ngay
	move $a0 $t0
	jal Thong_SoNgayTu111
	move $t1 $v0
	##Chuyen sang dang chuoi
	move $a0 $t1
	jal itoa
	move $t1 $v0
	##Lay do dai chuoi cua chuyen doi
	move $a0 $t1
	jal ChieuDaiChuoi
	move $a2 $v0	#Truyen tham so cho viec in so ngay ben duoi
	##In so ngay
	li $v0 15
	move $a0 $s0
	move $a1 $t1
	####a2 da duoc truyen ben tren roi
	syscall
	##In tb3
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo5_3
	li $a2 7
	syscall




	
	#Cau6
	##In thong bao 1
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo6
	li $a2 3
	syscall
	##Lay chieu dai chuoi chua year de in
	move $a0 $s4
	jal ChieuDaiChuoi
	move $a2 $v0	#Truyen a2 phuc vu cho viec goi ham in ben duoi
	##In year
	li $v0 15
	move $a0 $s0
	move $a1 $s4
	#.....a2 da duoc truyen ben tren
	syscall
	##In thong bao 2
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo6_1
	li $a2 8	
	syscall
	##Goi ham can chi
	lw $a0 8($t0)
	jal Tai_CanChi
	move $t7 $v0
	move $t8 $v1
	##Lay chieu dai can
	move $a0 $t7
	jal ChieuDaiChuoi
	move $a2 $v0	#Truyen a2 phuc vu cho viec goi ham in ben duoi
	##In can
	li $v0 15
	move $a0 $s0
	move $a1 $t7
	#..... a2 da duoc truyen ben tren
	syscall
	##Lay chieu dai Chi
	move $a0 $t8
	jal ChieuDaiChuoi
	move $a2 $v0	#Truyen a2 phuc vu cho viec goi ham in ben duoi
	##In Chi
	li $v0 15
	move $a0 $s0
	move $a1 $t8
	#..... a2 da duoc truyen ben tren
	syscall
	## In thong bao cuoi
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo6_2
	li $a2 3	
	syscall





	#Cau7
	##In thong bao tong
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo7
	li $a2 3
	syscall
	##In thong bao 1
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo7_1
	li $a2 20
	syscall
	##In ngay bat dau
	move $a0 $t0
	move $s1 $s0
	jal hqthinh_filecau1
	##In thong bao 2
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo7_2
	li $a2 10
	syscall
	##In ngay ket thuc
	move $a0 $t6
	move $s1 $s0
	jal hqthinh_filecau1
	##In thong bao 3
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo7_3
	li $a2 4
	syscall
	##Tinh so ngay
	move $a0 $t6
	move $a1 $t0
	jal Thong_GetTime
	move $t1 $v0
	##Chuyen so ngay sang dang chuoi
	move $a0 $t1
	jal itoa
	move $t1 $v0
	##Lay chieu dai chuoi so ngay
	move $a0 $t1
	jal ChieuDaiChuoi
	move $a2 $v0	#Phuc vu cho viec goi ham in ben duoi
	##In so ngay
	li $v0 15
	move $a0 $s0
	move $a1 $t1
	#..... a2 da duoc truyen ben tren
	syscall
	##In thong bao 4
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo7_4
	li $a2 7
	syscall





	#Cau8
	##In thong bao tong
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo8
	li $a2 3
	syscall
	##In thong bao 1
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo8_1
	li $a2 27
	syscall
	##Lay do dai chuoi year
	move $a0 $s4
	jal ChieuDaiChuoi
	move $a2 $v0	#Phuc vu cho viec goi ham in ben duoi
	##In year
	li $v0 15
	move $a0 $s0
	move $a1 $s4
	#..... a2 da duoc truyen ben tren
	syscall
	##In thong bao
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo8_2
	li $a2 4
	syscall
	##Goi ham
	li $a0 2019
	jal Tai_HaiNamNhuanGanNhat
	move $t8 $v0
	move $t9 $v1
	##In KQ1
	####Chuyen ket qua 1 sang ascii
	move $a0 $t8
	jal itoa
	move $t8 $v0
	####Lay chieu dai chuoi ket qua
	move $a0 $t8
	jal ChieuDaiChuoi
	move $a2 $v0	# Muc dich de goi ham in phia duoi
	####In KQ1 ra file
	li $v0 15
	move $a0 $s0
	move $a1 $t8
	# (a2 da duoc truyen phia tren)
	syscall
	##In thong bao
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo8_3
	syscall
	##In KQ2
	####Chuyen ket qua 2 sang ascii
	move $a0 $t9
	jal itoa
	move $t9 $v0
	####Lay chieu dai chuoi ket qua
	move $a0 $t9
	jal ChieuDaiChuoi
	move $a2 $v0	# Muc dich de goi ham in phia duoi
	####In KQ2 ra file
	li $v0 15
	move $a0 $s0
	move $a1 $t9
	# (a2 da duoc truyen phia tren)
	syscall
	##In thong bao
	li $v0 15
	move $a0 $s0
	la $a1 tien_tbNo8_4
	li $a2 2
	syscall


	#Dong file
	NhapXuatFile_DongFile:
	li   $v0, 16       
	move $a0, $s0      
	syscall