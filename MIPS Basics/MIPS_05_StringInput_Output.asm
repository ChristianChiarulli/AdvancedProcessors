# This program takes an input string from user and print it to the console
# Procedure:
# 1. Create a buffer ("inputString" in this case) to store the input string
# 2. Load the address of the buffer to register $a0
# 3. Load the length of the buffer to register $a1
# 4. Load register $v0 with 8
# 5. Issue "syscall"
.data			# What follows will be data
inputString: .space 64	# set aside 64 bytes to store the input string
prompt: .asciiz "Enter a string: "
display: .asciiz "You typed: "
.text			# What follows will be actual code
main: 
	# Display prompt
	la	$a0, prompt	# display the prompt to begin
	li	$v0, 4	# system call code to print a string to console
	syscall
	# get the string from console
	la	$a0, inputString	# load $a0 with the address of inputString; procedure: $a0 = buffer, $a1 = length of buffer
	la	$a1, inputString	# maximum number of character
	li	$v0, 8	# The system call code to read a string input
	syscall
	# Print "You typed: " to console
	la	$a0, display	
	li	$v0, 4
	syscall
	# Print the entered string to console
	la	$a0, inputString
	li	$v0, 4
	syscall
	
	
