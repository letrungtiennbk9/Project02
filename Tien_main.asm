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
tien_tb10: 	.asciiz "------------------------------------------------------------------------\n"
tien_tbLuaChon: .asciiz "Lua chon: "
tien_tbKQ: 	.asciiz "Ket qua: "
	
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
	move $v0 $s1	#s1 = option

	beq $s1 1 Cau1
	beq $s1 2 Cau2
	beq $s1 3 Cau3




	move $a0 $s0
	jal hqthinh_xuat 





	li $v0 4
	la $a0 tien_tbKQ
	syscall

	li $v0 10
	syscall
