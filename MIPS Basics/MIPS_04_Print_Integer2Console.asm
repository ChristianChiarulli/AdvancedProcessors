# This program allows a user to input an integer through the I/O window using keyboard
# Procedure to print an integer to the I/O window:
# 1. Load the integer to be printed to $a0
# 2. Load $v0 with 1
# 3. Issue "syscall"
.data	# What follows will be data
prompt: .asciiz "Please enter an integer: "	# the string " Please enter an integer: " 
						# is stored in the buffer named "prompt"
display: .asciiz "The number you entered is: "
.text	# What follows will be actual code
main: 	
	# Diplay prompt			
	la	$a0, prompt	# Load the address of "prompt" to $a0
	li	$v0, 4		# Load register $v0 with 4
	syscall			# print prompt to the I/O window
	# Read an integer
	li	$v0, 5
	syscall
	move	$t0, $v0	# Need to move content of $v0 to another available temporary register ($t0 in this case)
	# Display "The number you entered is: " to console
	la	$a0, display	# Load the address of "display" to $a0
	li 	$v0, 4
	syscall
	# Display the entered integer
	move	$a0, $t0	# move the integer to be printed to $a0
	li	$v0, 1		# Load $v0 with 1
	syscall
	