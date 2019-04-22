.data
endl:	.asciiz	"\n"

.text
.globl main
main:
	li $v0, 5
	syscall
	move $a0, $v0	# $a0 = a
	
	li $v0, 5
	syscall
	move $a1, $v0	# $a1 = b
	
	li $v0, 5
	syscall
	move $a2, $v0	# $a2 = m
	
	jal mod_op
	move $s0, $v0	# $s0 = return value
	
	li $v0, 1	# cout << mod
	move $a0, $s0
	syscall
	
	li $v0, 4	#cout << endl
	la $a0, endl
	syscall
	
	li $v0, 10
	syscall


.text
mod_op:
	addi $sp, $sp, -16
	sw $ra, 12($sp)
	sw $a2, 8($sp)
	sw $a1, 4($sp)
	sw $a0, 0($sp)
	
	bne $a1, $zero, L1	# if ( y!=0 )
	addi $v0, $zero, 1	# return 1
	addi $sp, $sp, 16
	jr $ra
	
L1:
	addi $t2, $zero, 2	# $t2 = 2
	div $a1, $t2
	mfhi $t1		# ¨ú¾l¼Æ
	mflo $a1		# $a1= floor(y/2)
	
	bne $t1, $zero,L2	# y%2==1 ¸õ¨ìL2
	jal mod_op
	lw $a0, 0($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	mul $s1, $v0, $v0
	div $s1, $a2
	mfhi $v0
	jr $ra
	
L2:
	jal mod_op
	lw $a0, 0($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	mul $s1, $v0, $v0
	
	div $a0, $a2
	mfhi $t2
	mul $s1, $s1, $t2
	
	div $s1, $a2
	mfhi $v0
	jr $ra



