
	.data #let processor know we will be submitting data to program now (these are currently in RAM)

		number1: .asciiz "\nEnter the first number: "
		number2: .asciiz "Enter the second number: "
		operation: .asciiz "Operation: "
		ans: .asciiz "\nAns: "
		inf: .asciiz "infinity"
		und: .asciiz "undefined"
		opChars: .byte '+','-','*','/'

	.text #enables text input/output
main:
	
	# prompt user for first input
	li $v0, 4 # ready to accept string
	la $a0, number1 # load the string the address
	syscall # display
	
	# get first input
	li $v0, 5
	syscall
		
	# store first number
	move $t0, $v0
	
	# prompt user for second input
	li $v0, 4
	la $a0, number2
	syscall
	
	# get second input
	li $v0, 5
	syscall
	
	# store seconf input
	move $t1, $v0
	
	# prompt user for operation
	li $v0, 4
	la $a0, operation 
	syscall
	
	li $v0, 12 # load a character 
	syscall
	
	move $t2, $v0 # store operation input
	
	la $t3, opChars # load t3 with the array of characters
	
	# show answer
	li $v0, 4
	la $a0, ans 
	syscall
	
	########## Ready check what operation was chosen ##########
	
	lb $t4, 0($t3)
	beq $t2, $t4, add
	lb $t4, 1($t3)
	beq $t2, $t4, sub
	lb $t4, 2($t3)
	beq $t2, $t4, mul
	lb $t4, 3($t3)
	beq $t2, $t4, div
	
	# add numbers
	add:
	
	add $t0, $t0, $t1
	li $v0, 1
	move $a0, $t0
	syscall
	
	j main
	
	# subtract numbers
	sub:
	
	sub $t0, $t0, $t1
	li $v0, 1
	move $a0, $t0
	syscall
	
	j main
	
	# multiply numbers
	mul:
	
	mul $t0, $t0, $t1
	li $v0, 1
	move $a0, $t0
	syscall
	
	j main
	
	# divide numbers
	div:
	
	beqz $t1, infinite # check if denominator = 0
	
	div $t0, $t0, $t1
	li $v0, 1
	move $a0, $t0
	syscall
	
	j main
	
	infinite:
	
	beqz $t0, undefined
	
	li $v0, 4 # ready to accept string
	la $a0, inf # load the string the address
	syscall # display
	
	j main
	
	undefined:
	
	li $v0, 4 # ready to accept string
	la $a0, und # load the string the address
	syscall # display
	
	j main