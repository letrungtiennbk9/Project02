.data 
	nhapnam:.asciiz "\nNhap nam: "
	output:.asciiz "\nKQ: "
	
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
.text
	.globl Tai_CanChi
Tai_CanChi:
	######### NHAP DE TEST #########
	#                              #
	li $v0,4
	la $a0,nhapnam
	syscall
	
	li $v0,5
	syscall
	#                              #
	###### XIN DUNG SAN SI :( ######


	add $t0,$v0,$zero
	addi $t1,$t1,10
	addi $t2,$t2,12
	
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
	li $v0,4
	la $a0,output
	syscall
	
	move $a0,$t4
	syscall
	
	move $a0,$t5
	syscall
	
	jr $ra
	
	li $v0,10
	syscall 
	
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


	
	
	
