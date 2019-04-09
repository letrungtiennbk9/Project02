.data
    	day: .word 1
	month: .word 1
	year: .word 1
	Thong_XuongDong: .asciiz "\n"

.text

.globl main
main:
   	lw $s1, day
	lw $s2, month
	lw $s3, year
	
	move $a0, $s1
	move $a1, $s2
	move $a2, $s3
	
	jal Thong_SoNgayTu111
	move $a0,$v0
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, Thong_XuongDong
	syscall
	
	move $a0, $s1
	move $a1, $s2
	move $a2, $s3
	
	jal Thong_NgayThuMayTrongTuan
	
	
	
	li $v0, 10
	syscall
