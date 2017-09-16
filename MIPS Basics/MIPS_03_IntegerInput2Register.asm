# This program allows a user to input an integer through the I/O window using keyboard
# Procedure to read an integer through the I/O window:
# 1. Load register $v0 with 5
# 2. Issue a "syscall"
# 3. Move the content of $v0 to another available temp. register
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
