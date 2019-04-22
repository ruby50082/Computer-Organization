.data
blank:	.asciiz	" "
star:	.asciiz	"*"
endl:	.asciiz	"\n"

.text
.globl	main
main:
	li $v0, 5
	syscall
	move $a0, $v0
	add $s3, $a0, $zero	# $s3 = n
	
	addi $s0, $zero, 1	# $s0 = i	i=1
loop1:	slt $t0, $s3, $s0
	bne $t0, $zero, e1 
	
	addi $s1, $zero, 1	# $s1 = j	j=1
	mul $t1, $s0, -1	# $t1 = -i
	add $t2, $s3, $t1	# $t2 = n-i
loop2:	
	slt $t0, $t2, $s1
	bne $t0, $zero, e2
	
	li $v0, 4		# print " "
	la $a0, blank
	syscall
	addi $s1, $s1, 1	# j++
	j loop2
e2:
	addi $s2, $s3, 1
	mul $t0, $s0, -1	# $t0 = -i
	add $s2, $s2, $t0	# $s2 = j = n-i+1
	add $t1, $s3, $s0	# $t1 = n+i
loop3:	
	slt $t0, $s2, $t1
	beq $t0, $zero, e3
	
	li $v0, 4		# print "*"
	la $a0, star
	syscall
	addi $s2, $s2, 1	# j++
	j loop3
e3:	li $v0, 4		# print "\n"
	la $a0,endl
	syscall
	addi $s0, $s0, 1	# i++
	j loop1
e1:
	addi $s0, $s3, -1	# $s0= i  i = n -1
loop4:	slti  $t0, $s0, 1
	bne $t0, $zero, e4
	
	addi $s1, $zero, 1	# $s1 = j =1
	mul $t1, $s0, -1	# $t1 = -i
	add $t2, $s3, $t1	# $t2 = n-i
loop5:	slt $t0, $t2, $s1
	bne $t0, $zero, e5
	li $v0, 4		# print " "
	la $a0, blank
	syscall
	addi $s1, $s1, 1
	j loop5
e5:	addi $t3, $t2, 1	# $t3 j  = n-i+1
	add $t4, $s3, $s0	# $t4 = n+i
loop6:	slt $t0, $t3, $t4
	beq $t0, $zero, e6
	li $v0, 4		# print "*"
	la $a0, star
	syscall
	addi $t3, $t3, 1
	j loop6
e6:	li $v0, 4		# print "\n"
	la $a0,endl
	syscall
	addi $s0, $s0, -1
	j loop4
	
e4:	li $v0, 10
	syscall
	
