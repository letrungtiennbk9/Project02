	.data
tien_tbTong:	.asciiz "-----------Ban hay lua chon mot trong nhung thao tac duoi day-----------\n"
tien_tb1: 	.asciiz "\t1.Xuat chuoi TIME theo dinh dang DD/MM/YYYY\n"
tien_tb2: 	.asciiz "\t2.Chuyen doi chuoi TIME thanh mot trong cac dinh dang sau:\n\t\tA.MM/DD/YYYY\n\t\tB.Month DD, YYYY\n\t\tC.DD Month, YYYY\n"
tien_tb3: 	.asciiz "\t3.Kiem tra nam trong chuoi TIME co phai nam nhuan hay khong\n"
tien_tb4: 	.asciiz "\t4.Cho biet ngay vua nhap la ngay thu may trong tuan\n"
tien_tb5: 	.asciiz "\t5.Cho biet ngay vua nhap la ngay thu may ke tu 1/1/1\n"
tien_tb6: 	.asciiz "\t6.Cho biet can chi nam vua nhap\n"
tien_tb7: 	.asciiz "\t7.Cho biet khoang thoi gian giua TIME_1 va TIME_2\n"
tien_tb8: 	.asciiz "\t8.Chi biet 2 nam nhuan gan nhat voi nam trong chuoi TIME\n"
tien_tb9: 	.asciiz "\t9.Nhap input tu file input.txt va xuat toan bo ket qua ra file output.txt\n"
tien_tb10: 	.asciiz "------------------------------------------------------------------------"
tien_tbLuaChon: .asciiz "\nLua chon: "
tien_tbKQ: 	.asciiz "Ket qua: "
tien_tbNhuan: .asciiz "Nam nhuan"
tien_tbKhongNhuan: .asciiz "Khong nhuan"
tien_tbNhapTime2: .asciiz "--Nhap time2:--\n"
	
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

	switch:
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
	beq $s1 10 Thoat

	Cau1:
		move $a0 $s0
		#jal hqthinh_XuatTime
		j switch

	Cau2:
		move $a0 $s0
		jal hqthinh_xuat
		j switch

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
			la $a0 tien_tbNhuan
			syscall
			j Cau3_KetThuc
		inKhongNhuan:
			li $v0 4
			la $a0 tien_tbKhongNhuan
			syscall
			j Cau3_KetThuc
		Cau3_KetThuc:
		
		j switch

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

		j switch

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

		j switch
	Cau6:
		lw $v0 8($s0)
		jal Tai_CanChi

		j switch

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

		j switch
	Cau8:
	Cau9:
	Thoat:
		li $v0 10
		syscall
