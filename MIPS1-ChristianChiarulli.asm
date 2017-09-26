
	.data #let processor know we will be submitting data to program now (these are currently in RAM)

		prompt: .asciiz ">>> "
		myWord: .space 64

	.text #enables text input/output
main:
	
	# prompt user for first input
	li $v0, 4 # ready to accept string
	la $a0, prompt # load the string the address
	syscall # display
	
	# gets expression
	la $a0, myWord # loads space for word in a0
	li $a1 65 # specifies amount of characters to be read in 65-1 = 64
	li $v0, 8 # accept string from user
	syscall
	
	#la $t1, myWord
	li $t1, 0
	

loop:
	lb $t2, myWord($t1)
	beq $t2, '?', loop1
	add $t1, $t1, 1
	j loop
	
loop1:
	sub $t1,$t1,1
	move $a0,$t1 
	li $v0,4 
	syscall 

	li $v0,10 
	syscall
