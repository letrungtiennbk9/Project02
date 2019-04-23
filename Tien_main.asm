	.data
tien_tbTong:	.asciiz "-----------Ban hay lua chon mot trong nhung thao tac duoi day-----------\n"
tien_tb1: 	.asciiz "\t1.Xuat chuoi TIME theo dinh dang DD/MM/YYYY\n"
tien_tb2: 	.asciiz "\t2.Chuyen doi chuoi TIME thanh mot trong cac dinh dang sau:\n\t\tA.MM/DD/YYYY\n\t\tB.Month DD, YYYY\n\t\tC.DD Month, YYYY\n"
tien_tb3: 	.asciiz "\t3.Kiem tra nam trong chuoi TIME co phai nam nhuan hay khong\n"
tien_tb4: 	.asciiz "\t4.Cho biet ngay vua nhap la ngay thu may trong tuan\n"
tien_tb5: 	.asciiz "\t5.Cho biet ngay vua nhap la ngay thu may ke tu 1/1/1\n"
tien_tb6: 	.asciiz "\t6.Cho biet can chi nam vua nhap\n"
tien_tb7: 	.asciiz "\t7.Cho biet khoang thoi gian giua TIME_1 va TIME_2\n"
tien_tb8: 	.asciiz "\t8.Cho biet 2 nam nhuan gan nhat voi nam trong chuoi TIME\n"
tien_tb9: 	.asciiz "\t9.Nhap input tu file input.txt va xuat toan bo ket qua ra file output.txt\n"
tien_tb10: 	.asciiz "------------------------------------------------------------------------"
tien_tbLuaChon: .asciiz "\nLua chon: "
tien_tbKQ: 	.asciiz "Ket qua: "
tien_tbKQCau9: .asciiz "Da xuat toan bo ket qua ra file\n"
tien_tbNhapTime2: .asciiz "--Nhap time2:--\n"
tien_space: .asciiz " "
tien_tenFileIn: .asciiz "input.txt"
tien_tenFileOut: .asciiz "output.txt"
fin: .asciiz "input.txt"
fio: .asciiz "output.txt"
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
tien_tbNhuan: .asciiz " la nam nhuan\r\n"
tien_tbKhongNhuan: .asciiz " la nam thuong\r\n"
tien_tbNhuan1: .asciiz "Nam nhuan\r\n"
tien_tbKhongNhuan1: .asciiz "Nam thuong\r\n"
Thong_sun: .asciiz "Sun"
Thong_mon: .asciiz "Mon"
Thong_tues: .asciiz "Tues"
Thong_wed: .asciiz "Wed"
Thong_thurs: .asciiz "Thurs"
Thong_fri: .asciiz "Fri"
Thong_sat: .asciiz "Sat"
Can_Canh:.asciiz"Canh "
Can_Tan:.asciiz"Tan "
Can_Nham:.asciiz"Nham "
Can_Quy:.asciiz"Quy "
Can_Giap:.asciiz"Giap "
Can_At:.asciiz"At "
Can_Binh:.asciiz"Binh "
Can_Dinh:.asciiz"Dinh "
Can_Mau:.asciiz"Mau "
Can_Ky:.asciiz"Ky "

Chi_Ti:.asciiz"Ti"
Chi_Suu:.asciiz"Suu"
Chi_Dan:.asciiz"Dan"
Chi_Mao:.asciiz"Mao"
Chi_Thin:.asciiz"Thin"
Chi_Ty:.asciiz"Ty"
Chi_Ngo:.asciiz"Ngo"
Chi_Mui:.asciiz"Mui"
Chi_Than:.asciiz"Than"
Chi_Dau:.asciiz"Dau"
Chi_Tuat:.asciiz"Tuat"
Chi_Hoi:.asciiz"Hoi"

suu_tb1: .asciiz "Nhap DAY: "
suu_tb2: .asciiz "Nhap MONTH: "
suu_tb3: .asciiz "Nhap YEAR: "
suu_tb4: .asciiz "Du lieu khong hop le !\n"
xd: .asciiz "\n"
suu_dd: .space 3
suu_mm: .space 3
suu_yyyy: .space 5
dayArr: .word 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
	.text
.globl main
main:
	jal suu_nhap
	move $s0 $v0
	
	li $v0 4
	la $a0 tien_tbTong
	syscall

	li $v0 4
	la $a0 tien_tb1
	syscall

	li $v0 4
	la $a0 tien_tb2
	syscall

	li $v0 4
	la $a0 tien_tb3
	syscall

	li $v0 4
	la $a0 tien_tb4
	syscall

	li $v0 4
	la $a0 tien_tb5
	syscall

	li $v0 4
	la $a0 tien_tb6
	syscall

	li $v0 4
	la $a0 tien_tb7
	syscall

	li $v0 4
	la $a0 tien_tb8
	syscall

	li $v0 4
	la $a0 tien_tb9
	syscall

	li $v0 4
	la $a0 tien_tb10
	syscall

	li $v0 4
	la $a0 tien_tbLuaChon
	syscall

	li $v0 5
	syscall
	move $s1 $v0	#s1 = option

	beq $s1 1 Cau1
	beq $s1 2 Cau2
	beq $s1 3 Cau3
	beq $s1 4 Cau4
	beq $s1 5 Cau5
	beq $s1 6 Cau6
	beq $s1 7 Cau7
	beq $s1 8 Cau8
	beq $s1 9 Cau9

	Cau1:
		move $a0 $s0
		jal hqthinh_Cau1
		j Thoat

	Cau2:
		move $a0 $s0
		jal hqthinh_xuat
		j Thoat

	Cau3:
		li $v0 4
		la $a0 tien_tbKQ
		syscall

		lw $a0 8($s0)
		jal LaNamNhuan
		move $t0 $v0
		bne $t0 $0 inNhuan
		beq $t0 $0 inKhongNhuan
		inNhuan:
			li $v0 4
			la $a0 tien_tbNhuan1
			syscall
			j Cau3_KetThuc
		inKhongNhuan:
			li $v0 4
			la $a0 tien_tbKhongNhuan1
			syscall
			j Cau3_KetThuc
		Cau3_KetThuc:
		
		j Thoat

	Cau4:
		li $v0 4
		la $a0 tien_tbKQ
		syscall		

		move $a0 $s0
		jal Thong_Weekday
		move $t0 $v0
		
		li $v0 4
		move $a0 $t0
		syscall

		j Thoat

	Cau5:
		li $v0 4
		la $a0 tien_tbKQ
		syscall

		move $a0 $s0
		jal Thong_SoNgayTu111
		move $t0 $v0

		li $v0 1
		move $a0 $t0
		syscall

		j Thoat
	Cau6:
		li $v0 4
		la $a0 tien_tbKQ
		syscall

		lw $a0 8($s0)
		jal Tai_CanChi
		move $t0 $v0
		move $t1 $v1

		##In Can
		li $v0 4
		move $a0 $t0
		syscall
		
		#In Chi
		li $v0 4
		move $a0 $t1
		syscall

		j Thoat

	Cau7:
		li $v0 4
		la $a0 tien_tbNhapTime2
		syscall

		jal suu_nhap
		move $a1 $v0

		move $a0 $s0
		jal Thong_GetTime
		move $t0 $v0

		li $v0 4
		la $a0 tien_tbKQ
		syscall

		li $v0 1
		move $a0 $t0
		syscall

		j Thoat
	Cau8:
		li $v0 4
		la $a0 tien_tbKQ
		syscall
		
		lw $a0 8($s0)
		jal Tai_HaiNamNhuanGanNhat
		move $t0 $v0
		move $t1 $v1

		#In nam nhuan thu nhat
		li $v0 1
		move $a0 $t0
		syscall

		#In space
		li $v0 4
		la $a0 tien_space
		syscall
		
		#In nam nhuan thu 2
		li $v0 1
		move $a0 $t1
		syscall

		j Thoat
	Cau9:
		li $v0 4
		la $a0 tien_tbKQ
		syscall

		la $a0 tien_tenFileIn
		la $a1 tien_tenFileOut
		jal NhapXuatFile

		li $v0 4
		la $a0 tien_tbKQCau9
		syscall
		
		j Thoat
	Thoat:
		li $v0 10
		syscall





#Ham NhapXuatFile
#Chuc nang: Doc ngay thang nam tu file, thuc hien cac yeu cau va xuat ra file
#Tham so: 
## a0: chuoi ten file input
## a1: chuoi ten file output
#Tra ve:
## Khong co gia tri tra ve, chi co file output duoc thay doi
.globl NhapXuatFile
NhapXuatFile:
	subi $sp $sp 92
	sw $ra ($sp)
	sw $a1 4($sp)
	sw $a2 8($sp)
	sw $a3 12($sp)
	sw $t0 16($sp)
	sw $t1 20($sp)
	sw $t2 24($sp)
	sw $t3 28($sp)
	sw $t4 32($sp)
	sw $t5 36($sp)
	sw $t6 40($sp)
	sw $t7 44($sp)
	sw $s0 48($sp)
	sw $s1 52($sp)
	sw $s2 56($sp)
	sw $s3 60($sp)
	sw $s4 64($sp)
	sw $s5 68($sp)
	sw $s6 72($sp)
	sw $s7 76($sp)
	sw $t8 80($sp)
	sw $t9 84($sp)
	sw $a0 88($sp)
	

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

	lw $ra ($sp)
	lw $a1 4($sp)
	lw $a2 8($sp)
	lw $a3 12($sp)
	lw $t0 16($sp)
	lw $t1 20($sp)
	lw $t2 24($sp)
	lw $t3 28($sp)
	lw $t4 32($sp)
	lw $t5 36($sp)
	lw $t6 40($sp)
	lw $t7 44($sp)
	lw $s0 48($sp)
	lw $s1 52($sp)
	lw $s2 56($sp)
	lw $s3 60($sp)
	lw $s4 64($sp)
	lw $s5 68($sp)
	lw $s6 72($sp)
	lw $s7 76($sp)
	lw $t8 80($sp)
	lw $t9 84($sp)
	lw $a0 88($sp)
	addi $sp $sp 92
	jr $ra
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

	li $t1 400
	div $a0 $t1
	mfhi $t2
	beq $t2 $0 LaNamNhuan_ReturnTrue

	li $t1 4
	div $a0 $t1
	mfhi $t2

	beq $t2 $0 LaNamNhuan_TiepTucKT
	j LaNamNhuan_ReturnFalse
		LaNamNhuan_TiepTucKT:
			li $t1 100
			div $a0 $t1
			mfhi $t2
			bne $t2 $0 LaNamNhuan_ReturnTrue
			j LaNamNhuan_ReturnFalse
				LaNamNhuan_ReturnTrue:
					li $v0 1
				j LaNamNhuan_Thoat	
		LaNamNhuan_ReturnFalse:
			li $v0 0
	LaNamNhuan_Thoat:
	
	lw $ra ($sp)
	lw $a0 4($sp)
	lw $t1 8($sp)
	lw $t2 12($sp)
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





.globl Tai_CanChi
Tai_CanChi:
	# Can chi cua nam 
	# Truyen nam vao $a0
	# Tra ve: Can -> $v0, Chi -> $v1
	# 
	# DAU THU TUC
	
	# create stack	
	addi $sp,$sp,-28 

	# backup
	sw $ra,($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
	sw $t4,16($sp)
	sw $t5,20($sp)
	sw $a0,24($sp)
	
	# THAN THU TUC
	add $t0,$a0,$zero
	addi $t1,$0,10
	addi $t2,$0,12
	
	div $t0,$t1
	mfhi $t1
	
	div $t0,$t2
	mfhi $t2
Can:	
	beq $t1,0,Canh
	beq $t1,1,Tan
	beq $t1,2,Nham
	beq $t1,3,Quy
	beq $t1,4,Giap
	beq $t1,5,At
	beq $t1,6,Binh
	beq $t1,7,Dinh
	beq $t1,8,Mau
	beq $t1,9,Ky
	
Chi:
	beq $t2,0,Than
	beq $t2,1,Dau
	beq $t2,2,Tuat
	beq $t2,3,Hoi
	beq $t2,4,Ti
	beq $t2,5,Suu
	beq $t2,6,Dan
	beq $t2,7,Mao
	beq $t2,8,Thin
	beq $t2,9,Ty
	beq $t2,10,Ngo
	beq $t2,11,Mui
	
Tai_Ketthuc:
	
	# CUOI THU TUC
	
	# return can/chi
	move $v0,$t4
	move $v1,$t5
	
	# restore
	lw $ra,($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $t2,12($sp)
	lw $t4,16($sp)
	lw $t5,20($sp)
	lw $a0,24($sp)
	
	# delete stack
	addi $sp,$sp,28
	
	# 
	jr $ra
	
########################## CAN #########################
	
Canh:
	la $t4,Can_Canh
	j Chi
Tan:
	la $t4,Can_Tan
	j Chi
Nham:
	la $t4,Can_Nham
	j Chi
Quy:	
	la $t4,Can_Quy
	j Chi
Giap:
	la $t4,Can_Giap
	j Chi
At:
	la $t4,Can_At
	j Chi
Binh:
	la $t4,Can_Binh
	j Chi
Dinh:
	la $t4,Can_Dinh
	j Chi
Mau:
	la $t4,Can_Mau
	j Chi
Ky:
	la $t4,Can_Ky	
	j Chi

############################# CHI #############################	
			
Ti:
	la $t5,Chi_Ti
	j Tai_Ketthuc
Suu:
	la $t5,Chi_Suu
	j Tai_Ketthuc
Dan:
	la $t5,Chi_Dan
	j Tai_Ketthuc
Mao:
	la $t5,Chi_Mao
	j Tai_Ketthuc
Thin: 
	la $t5,Chi_Thin
	j Tai_Ketthuc
Ty:
	la $t5,Chi_Ty
	j Tai_Ketthuc
Ngo:
	la $t5,Chi_Ngo
	j Tai_Ketthuc
Mui:
	la $t5,Chi_Mui
	j Tai_Ketthuc
Than:
	la $t5,Chi_Than
	j Tai_Ketthuc
Dau:
	la $t5,Chi_Dau
	j Tai_Ketthuc
Tuat:
	la $t5,Chi_Tuat
	j Tai_Ketthuc
Hoi:
	la $t5,Chi_Hoi
	j Tai_Ketthuc





	.globl Tai_HaiNamNhuanGanNhat

Tai_HaiNamNhuanGanNhat:
	# Tim hai nam nhuan gan nhat voi nam truyen vao
	# Nam truyen vao $a0
	# Ket qua tra ve: $v0 va $v1
	
	# DAU THU TUC

	# create stack
	addi $sp,$sp,-20
	
	# backup
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $t0,8($sp)
	sw $t1,12($sp)
	sw $t2,16($sp)
	
	# THAN THU TUC
	
	addi $t0,$0,4
	slt $t2,$a0,$t0
	beq $t2,1,LessThanFour
	j NotLessThanFour
	
	LessThanFour:
		addi $t0,$0,4
		addi $t1,$0,8
		j TwoLeap_return
	
	NotLessThanFour:
		beq $a0,4,isFour
		j BiggerThanFour
	
		isFour:
			addi $t0,$0,8
			addi $t1,$0,12
			j TwoLeap_return

		BiggerThanFour:	
			# Kiem tra $a0 co phai nam nhuan
			jal LaNamNhuan
			beq $v0,1,pre_Leap
			j pre_notLeap

			# is Leap
			pre_Leap:
				subi $t0,$a0,4
				addi $t1,$a0,4
				j Leap_Smaller

				Leap_Smaller:
					move $a0,$t0
					jal LaNamNhuan
					beq $v0,$0,re_Leap_Smaller
					j Leap_Bigger

				re_Leap_Smaller:
					subi $t0,$t0,4
					j Leap_Smaller

				Leap_Bigger:
					move $a0,$t1
					jal LaNamNhuan
					beq $v0,$0,re_Leap_Bigger
					j TwoLeap_return

				re_Leap_Bigger:
					addi $t1,$t1,4
					j Leap_Bigger

			# is not Leap
			pre_notLeap:
				subi $t0,$a0,1
				j NotLeap_Smaller

				NotLeap_Smaller:	
					move $a0,$t0
					jal LaNamNhuan
					beq $v0,$0,re_NotLeap_Smaller

					addi $t1,$t0,4
					j NotLeap_Bigger

				re_NotLeap_Smaller:
					subi $t0,$t0,1
					j NotLeap_Smaller

				NotLeap_Bigger:	
					move $a0,$t1
					jal LaNamNhuan
					beq $v0,$0,re_NotLeap_Bigger

					j TwoLeap_return

				re_NotLeap_Bigger:
					addi $t1,$t1,4
					j NotLeap_Bigger
	
TwoLeap_return:
	
	# CUOI THU TUC
	# return
	move $v0,$t0
	move $v1,$t1
	
	# backup
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $t0,8($sp)
	lw $t1,12($sp)
	lw $t2,16($sp)

	# create stack
	addi $sp,$sp,20

	jr $ra





.globl Thong_Weekday

# tham so truyen vao: thanh ghi $a0 la mang ngay
# ham tra ve chuoi ket qua la ngay thu may trong tuan cua ngay duoc truyen vao
# ket qua tra ve luu trong thanh ghi $v0

Thong_Weekday:
	#Dau thu tuc
	addi $sp, $sp, -40
	#backup
	sw $ra,	($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $s1, 12($sp)
	sw $s2, 16($sp)
	sw $s3, 20($sp)
	sw $s4, 24($sp)
	sw $a0, 28($sp)
	sw $a1, 32($sp)
	sw $a2, 36($sp)
	
	#Than thu tuc
	# Lay tham so truyen vao
	lw $s1, ($a0)
	lw $s2, 4($a0)
	lw $s3, 8($a0)
	
	#Truyen tham so de goi ham SoNgayTu111
	sw $s1, ($a0)
	sw $s2, 4($a0)
	sw $s3, 8($a0)
	
	jal Thong_SoNgayTu111
	move $t0, $v0
	
	#Cong them 1 de dung voi cong thuc
	addi $t0, $t0, 1
	
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
	la $a0, Thong_sun
	move $v0, $a0
	j Thong_KetThucHam

Thong_ThuHai:
	la $a0,Thong_mon
	move $v0, $a0
	j Thong_KetThucHam
	
Thong_ThuBa:	
	la $a0,Thong_tues
	move $v0, $a0
	j Thong_KetThucHam

Thong_ThuTu:	
	la $a0,Thong_wed
	move $v0, $a0
	j Thong_KetThucHam

Thong_ThuNam:
	la $a0,Thong_thurs
	move $v0, $a0
	j Thong_KetThucHam
	
Thong_ThuSau:
	la $a0,Thong_fri
	move $v0, $a0
	j Thong_KetThucHam

Thong_ThuBay:
	la $a0,Thong_sat
	move $v0, $a0
	j Thong_KetThucHam

Thong_KetThucHam:	
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





.globl Thong_GetTime

# tham so truyen vao: thanh ghi $a0, $a1 la 2 mang ngay
# ham tra ve ket qua la khoang cach giua 2 chuoi ngay truyen vao
# ket qua tra ve luu trong thanh ghi $v0

Thong_GetTime:

	#Dau thu tuc
	addi $sp, $sp, -48
	#backup
	sw $ra,($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	sw $s0, 20($sp)
	sw $s1, 24($sp)
	sw $s2, 28($sp)
	sw $s3, 32($sp)
	sw $a0, 36($sp)
	sw $a1, 40($sp)
	sw $a2, 44($sp)
	
	#Than thu tuc
	#luu lai gia tri ngay thu nhat
	lw $t2, ($a0)
	lw $t3, 4($a0)
	lw $s0, 8($a0)
	
	#lay du lieu cho viec tinh toan ngay thu nhat
	lw $s1, ($a0)
	lw $s2, 4($a0)
	lw $s3, 8($a0)
	
	sw $s1, ($a0)
	sw $s2, 4($a0)
	sw $s3, 8($a0)
	
	jal Thong_SoNgayTu111
	
	#t0 luu khoang cach tu ngay 1/1/1 cua thu nhat
	move $t0, $v0
	
	#lay ngay thu 2 de tinh toan
	lw $s1, ($a1)
	lw $s2, 4($a1)
	lw $s3, 8($a1)
	
	sw $s1, ($a0)
	sw $s2, 4($a0)
	sw $s3, 8($a0)
	
	jal Thong_SoNgayTu111
	
	#Lay lai gia tri cho $a0: ngay thu nhat
	sw $t2, ($a0)
	sw $t3, 4($a0)
	sw $s0, 8($a0)
	
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
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	lw $s0, 20($sp)
	lw $s1, 24($sp)
	lw $s2, 28($sp)
	lw $s3, 32($sp)
	lw $a0, 36($sp)
	lw $a1, 40($sp)
	lw $a2, 44($sp)
	#Xoa stack
	addi $sp,$sp, 48
	#tra ve
	jr $ra





.globl Thong_SoNgayTu111
# tham so truyen vao: thanh ghi $a0 la mang ngay
# ham tra ve gia tri ngay thu n tu ngay 1/1/1 vao thanh ghi $v0
# chuc nang: cho biet ngay vua nhap (tham so truyen vao) la ngay thu may ke tu ngay 1/1/1

Thong_SoNgayTu111:
    	#Dau thu tuc
	addi $sp, $sp, -44
	#backup
	sw $ra,($sp)
	sw $t0,4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $s1, 16($sp)
	sw $s2, 20($sp)
	sw $s3, 24($sp)
	sw $s4, 28($sp)
	sw $a0, 32($sp)
	sw $a1, 36($sp)
	sw $a2, 40($sp)
	
	#Than thu tuc
	
	lw $s1, ($a0)
	lw $s2, 4($a0)
	lw $s3, 8($a0)
	#kiem tra thang < 3
	li $t1, 3
	slt $t2,$s2,$t1
	bne $t2,$0,Thong_TangThang_GiamNam
	j Thong_TiepTucNeuKhongTang
	#Truong hop thang < 3
Thong_TangThang_GiamNam:
	li $t1, 1
	sub $s3, $s3, $t1
	
	li $t1, 12
	add $s2, $s2, $t1

	
	#tinh so ngay tu 1/1/1
	# khoi tao so ngay (s) = 0
	
Thong_TiepTucNeuKhongTang:
	li $t0, 0
	
	li $t1, 365
	mult $t1, $s3
	mflo $s4
	
	# s = s + kq1
	add $t0, $t0, $s4
	
	#year /4
	li $t1, 4
	div $s3, $t1
	mflo $s4
	
	# s = s + kq2
	add $t0, $t0, $s4
	
	#year / 100
	li $t1, 100
	div $s3, $t1
	mflo $s4
	
	# s = s + kq3
	sub $t0, $t0, $s4
	
	#year / 400
	li $t1, 400
	div $s3, $t1
	mflo $s4
	
	# s = s + kq3
	add $t0, $t0, $s4
	
	
	# s = s + (153 * month - 457) / 5
	li $t1, 153
	mult $t1, $s2
	mflo $s4
	
	li $t1, 457
	sub $s4, $s4, $t1
	
	li $t1, 5
	div $s4, $t1
	mflo $s4
	
	# s = s + kq4
	add $t0, $t0, $s4
	
	# s = s + day
	add $t0, $t0, $s1
	
	li $t1, 306
	#s = s - 306
	sub $t0, $t0, $t1
	
	# s = s - 1 de tinh la ngay thu may tu ngay 1/1/1 
	subi $t0, $t0, 1
	
	# chuyen kq ve $v0
	move $v0, $t0
	
	#Cuoi thu tuc
	#restore thanh ghi
	lw $ra,($sp)
	lw $t0,4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $s1, 16($sp)
	lw $s2, 20($sp)
	lw $s3, 24($sp)
	lw $s4, 28($sp)
	lw $a0, 32($sp)
	lw $a1, 36($sp)
	lw $a2, 40($sp)
	#Xoa stack
	addi $sp,$sp, 44
	#tra ve
	jr $ra





# - Chuc nang: Cho phep nguoi dung nhap DAY, MONTH, YEAR tu ban phim
	# - Tra ve thanh ghi v0 chua dd, mm,yyyy (dd: 0($v0), mm: 4($v0), yyyy: 8($v0)
.globl suu_nhap
suu_nhap: 
	# Dau thu tuc
	addi $sp, $sp, -44
	# backup
	sw $ra,($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	sw $t4, 20($sp)
	sw $a0, 24($sp)
	sw $a1, 28($sp)
	sw $a2, 32($sp)
	sw $s0, 36($sp)
	sw $v1, 40($sp)
	# nhap DAY
	li $v0, 4
	la $a0, suu_tb1
	syscall
	la $v0, 8
	la $a0, suu_dd
	li $a1, 3
	syscall
	jal nhap_suu_atoi
	move $t0, $v0
	li $v0, 4
	la $a0, xd
	syscall
	#nhap MONTH
	li $v0, 4
	la $a0, suu_tb2
	syscall
	la $v0, 8
	la $a0, suu_mm
	li $a1, 3
	syscall
	jal nhap_suu_atoi
	move $t1 $v0
	li $v0, 4
	la $a0, xd
	syscall
	# nhap YEAR
	li $v0, 4
	la $a0, suu_tb3
	syscall
	la $v0, 8
	la $a0, suu_yyyy
	li $a1, 5
	syscall
	jal nhap_suu_atoi
	move $t2, $v0
	li $v0, 4
	la $a0, xd
	syscall
	# Than thu tuc
	move	$a0, $t0 
	move	$a1, $t1 
	move	$a2, $t2 
	# Kiem tra tinh hop le
	jal nhap_suu_kiemtrahople
	bne $v0,0,nhap_suu_accept
	bne $v0, 1, nhap_suu_unaccept
.globl nhap_suu_atoi
nhap_suu_atoi:
	#Backup...
	subi $sp $sp 36
	sw $ra ($sp)
	sw $a0 4($sp)
	sw $t0 8($sp)
	sw $s0 12($sp)
	sw $s1 16($sp)
	sw $t1 20($sp)
	sw $t2 24($sp)
	sw $v1 28($sp)
	sw $t3, 32($sp) 
	#Tim so chu so
	jal ChieuDaiChuoi
	move $s0 $v0
	#t0 = 10^(soCS - 1)
	li $t0 1
	li $t2 10
	subi $t1 $s0 1	#t1 = s0 - 1 = soCS - 1
	nhap_suu_atoi_Cond1:
	bne $t1 $0 nhap_suu_atoi_Loop1
	beq $t1 $0 nhap_suu_atoi_ExitLoop1
	nhap_suu_atoi_Loop1:
		mult $t0 $t2
		mflo $t0
		subi $t1 $t1 1
		j nhap_suu_atoi_Cond1
	nhap_suu_atoi_ExitLoop1:
	#Bat dau tinh toan
	li $t1 0	#Index
	li $v1 0	#ret
	nhap_suu_atoi_Cond:
	bne $t1 $s0 nhap_suu_atoi_Loop
	beq $t1 $s0 nhap_suu_atoi_ExitLoop
	nhap_suu_atoi_Loop:
		lb $s1 ($a0)	#Chu so dau tien duoc tach dang ascii
		beq $s1 ' ' nhap_suu_atoi_ExitLoop
		beq $s1 '\n' nhap_suu_atoi_ExitXd # Xuly ky tu \n
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
		
		j nhap_suu_atoi_Cond
	nhap_suu_atoi_ExitXd:
		li $t3 10
		div $v1 $t3
		mflo $v1 
		j nhap_suu_atoi_ExitLoop
	nhap_suu_atoi_ExitLoop:
	move $v0, $v1
	#Restore...
	lw $ra ($sp)
	lw $a0 4($sp)
	lw $t0 8($sp)
	lw $s0 12($sp)
	lw $s1 16($sp)
	lw $t1 20($sp)
	lw $t2 24($sp)
	lw $v1 28($sp)
	lw $t3, 32($sp) 
	addi $sp $sp 36
	jr $ra
#----------------------------------------------------------------------------------------------------------------
.globl nhap_suu_unaccept
nhap_suu_unaccept:
	li $v0, 4
	la $a0, suu_tb4
	syscall
	j suu_nhap
.globl nhap_suu_accept
nhap_suu_accept:
	# tra ve v0
	move $t3, $a0
	la $a0, 12
	li $v0, 9
	syscall
	add $v1, $t3, $zero
	sw $v1, 0($v0)
	add $v1, $a1, $zero
	sw $v1, 4($v0)
	add $v1, $a2, $zero
	sw $v1, 8($v0)
	j nhap_suu_ketthucham
.globl nhap_suu_kiemtrahople
nhap_suu_kiemtrahople:
	addi	$sp, $sp, -40
	# backup
	sw 	$t6, 36($sp)
	sw	$a0, 32($sp)
	sw	$ra, 28($sp)
	sw	$t0, 24($sp)
	sw	$t1, 20($sp)
	sw	$t2, 16($sp)
	sw	$t3, 12($sp)
	sw	$t4, 8($sp)
	sw 	$t5, 4($sp)
	sw	$s0, 0($sp)
	move	$t0, $a0 # dd
	move 	$t1, $a1 # mm
	move 	$t2, $a2 # yyyy
	li $t6, 1
	slt $t5,$t0,$t6 # kiem tra dd < 1
	bne $t5,$0,nhap_suu_khonghople
	li $t3, 13
	slt $t3, $t1, $t3 # kiem tra xem mm < 13?
	beq $t3,$0,nhap_suu_khonghople # mm > 13

	# Kiem tra DAY
	la	$s0, dayArr
	addi	$t4, $t1, -1
	sll	$t4, $t4, 2
	add	$s0, $s0, $t4
	lw	$s0, ($s0) # so ngay cua THANG da nhap

	li  $t4, 2
	bne $t1, $t4, nhap_suu_kiemtradate
	lw  $a0, 28($sp)
	jal nhap_suu_ktnamnhuan
	beq	$v0, $0, nhap_suu_kiemtradate 
	addi	$s0, $s0, 1 
	j 	nhap_suu_kiemtradate
.globl nhap_suu_kiemtradate
nhap_suu_kiemtradate: # Kiem tra xem so ngay cua Thang da nhap co phu hop voi Ngay da nhap hay khong
	slt	$t4, $s0, $t0
	bne	$t4, $0, nhap_suu_khonghople
	j	nhap_suu_hople
.globl nhap_suu_hople
nhap_suu_hople:
	li $v0, 1
	j nhap_suu_kt
.globl nhap_suu_khonghople
nhap_suu_khonghople:
	li $v0,0
	j nhap_suu_kt
.globl nhap_suu_kt
nhap_suu_kt:
	lw	$a0, 32($sp)
	lw	$ra, 28($sp)
	lw	$t0, 24($sp)
	lw	$t1, 20($sp)
	lw	$t2, 16($sp)
	lw	$t3, 12($sp)
	lw	$t4, 8($sp)
	lw 	$t5, 4($sp)
	lw	$s0, 0($sp)
	lw 	$t6, 36($sp)
	addi	$sp, $sp, 40
	jr 	$ra
.globl nhap_suu_ktnamnhuan
nhap_suu_ktnamnhuan:
	addi	$sp, $sp, -12
	sw	$ra, 8($sp)
	sw	$t0, 4($sp)
	sw	$t1, 0($sp)
	move	$t1, $a2 #yyyy
	li	$t0, 400
	div	$t1, $t0
	mfhi	$t0
	beq 	$t0, $0, nhap_suu_true

	li	$t0, 4
	div	$t1, $t0
	mfhi	$t0
	bne 	$t0, $0, nhap_suu_false

	li	$t0, 100
	div	$t1, $t0
	mfhi	$t0
	beq	$t0, $0, nhap_suu_false
.globl nhap_suu_true
nhap_suu_true:
	li	$v0, 1
	j	nhap_suu_break
.globl nhap_suu_false
nhap_suu_false:
	li	$v0, 0
	j	nhap_suu_break
.globl nhap_suu_break
nhap_suu_break:
	lw	$ra, 8($sp)
	lw	$t0, 4($sp)
	lw	$t1, 0($sp)
	addi	$sp, $sp, 12
	jr	$ra
.globl nhap_suu_ketthucham
nhap_suu_ketthucham:
	# cuoi thu tuc
	#restore
	lw $ra,($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	lw $t4, 20($sp)
	lw $a0, 24($sp)
	lw $a1, 28($sp)
	lw $a2, 32($sp)
	lw $s0, 36($sp)
	lw $v1, 40($sp)
	# xoa stack
	addi $sp, $sp, 44
	# tra ve
	jr $ra





# - Truyen dd,mm,yyyy vao cac thanh ghi tuong ung a0, a1, a2
	# - Tra ve thanh ghi v0 chua dd, mm,yyyy (dd: 0($v0), mm: 4($v0), yyyy: 8($v0))
.globl suu_Nhap_ThamSo
suu_Nhap_ThamSo: 
	# Dau thu tuc
	addi $sp, $sp, -44
	# backup
	sw $ra,($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	sw $t2, 12($sp)
	sw $t3, 16($sp)
	sw $t4, 20($sp)
	sw $a0, 24($sp)
	sw $a1, 28($sp)
	sw $a2, 32($sp)
	sw $s0, 36($sp)
	sw $v1, 40($sp)
	# Than thu tuc
	# Kiem tra tinh hop le
	jal suu_kiemtrahople
	bne $v0,0,suu_accept
	bne $v0, 1, suu_unaccept
.globl suu_unaccept
suu_unaccept:
	li $v0, 4
	la $a0, suu_tb4
	syscall
.globl suu_accept
suu_accept:
	# tra ve v0
	move $t3, $a0
	la $a0, 12
	li $v0, 9
	syscall
	add $v1, $t3, $zero
	sw $v1, 0($v0)
	add $v1, $a1, $zero
	sw $v1, 4($v0)
	add $v1, $a2, $zero
	sw $v1, 8($v0)
	j suu_ketthucham
.globl suu_kiemtrahople
suu_kiemtrahople:
	addi	$sp, $sp, -40
	# backup
	sw 	$t6, 36($sp)
	sw	$a0, 32($sp)
	sw	$ra, 28($sp)
	sw	$t0, 24($sp)
	sw	$t1, 20($sp)
	sw	$t2, 16($sp)
	sw	$t3, 12($sp)
	sw	$t4, 8($sp)
	sw 	$t5, 4($sp)
	sw	$s0, 0($sp)
	move	$t0, $a0 # dd
	move 	$t1, $a1 # mm
	move 	$t2, $a2 # yyyy
	li $t6, 1
	slt $t5,$t0,$t6 # kiem tra dd < 1
	bne $t5,$0,suu_khonghople
	li $t3, 13
	slt $t3, $t1, $t3 # kiem tra xem mm < 13?
	beq $t3,$0,suu_khonghople # mm > 13

	# Kiem tra DAY
	la	$s0, dayArr
	addi	$t4, $t1, -1
	sll	$t4, $t4, 2
	add	$s0, $s0, $t4
	lw	$s0, ($s0) # so ngay cua THANG da nhap

	li  $t4, 2
	bne $t1, $t4, suu_kiemtradate
	lw  $a0, 28($sp)
	jal suu_ktnamnhuan
	beq	$v0, $0, suu_kiemtradate 
	addi	$s0, $s0, 1 
	j 	suu_kiemtradate
.globl suu_kiemtradate
suu_kiemtradate: # Kiem tra xem so ngay cua Thang da nhap co phu hop voi Ngay da nhap hay khong
	slt	$t4, $s0, $t0
	bne	$t4, $0, suu_khonghople
	j	suu_hople
.globl suu_hople
suu_hople:
	li $v0, 1
	j suu_kt
.globl suu_khonghople
suu_khonghople:
	li $v0,0
	j suu_kt
.globl suu_kt
suu_kt:
	lw	$a0, 32($sp)
	lw	$ra, 28($sp)
	lw	$t0, 24($sp)
	lw	$t1, 20($sp)
	lw	$t2, 16($sp)
	lw	$t3, 12($sp)
	lw	$t4, 8($sp)
	lw 	$t5, 4($sp)
	lw	$s0, 0($sp)
	lw 	$t6, 36($sp)
	addi	$sp, $sp, 40
	jr 	$ra
.globl suu_ktnamnhuan
suu_ktnamnhuan:
	addi	$sp, $sp, -12
	sw	$ra, 8($sp)
	sw	$t0, 4($sp)
	sw	$t1, 0($sp)
	move	$t1, $a2 #yyyy
	li	$t0, 400
	div	$t1, $t0
	mfhi	$t0
	beq 	$t0, $0, suu_true

	li	$t0, 4
	div	$t1, $t0
	mfhi	$t0
	bne 	$t0, $0, suu_false

	li	$t0, 100
	div	$t1, $t0
	mfhi	$t0
	beq	$t0, $0, suu_false
.globl suu_true
suu_true:
	li	$v0, 1
	j	suu_break
.globl suu_false
suu_false:
	li	$v0, 0
	j	suu_break	
.globl suu_break
suu_break:
	lw	$ra, 8($sp)
	lw	$t0, 4($sp)
	lw	$t1, 0($sp)
	addi	$sp, $sp, 12
	jr	$ra
.globl suu_ketthucham
suu_ketthucham:
	# cuoi thu tuc
	#restore
	lw $ra,($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	lw $t2, 12($sp)
	lw $t3, 16($sp)
	lw $t4, 20($sp)
	lw $a0, 24($sp)
	lw $a1, 28($sp)
	lw $a2, 32($sp)
	lw $s0, 36($sp)
	lw $v1, 40($sp)
	# xoa stack
	addi $sp, $sp, 44
	# tra ve
	jr $ra