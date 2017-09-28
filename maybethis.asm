
.data
stringstore: .space 2000
numstore: .space 2000
prompt: .asciiz ">> "
str: .space 64
newline: .asciiz "\n"
madeit: .asciiz "made it"
nv: .asciiz "not a variable"
.text
la	$s0, stringstore
la	$s1, numstore
.globl main
main:
la      $a0, prompt     #calling opening prompt
li      $v0, 4
syscall
la $a0, str	#load address with my allocated space for string
li $a1 65		# allocate space
li $v0, 8		# user input string
syscall
la      $a0, newline    #newline
syscall
li      $t2, 0

lb $t0, str($t2)
sb $t0, ($s0) # load these characters
addi $s0, $s0, 1 # load these characters
bge $t0, 'A', checkZ #check if less than Z
#j notVariable
j main

checkZ:
ble $t0, 'Z', declareVar # start declaring variable

j lowerCase # jump to see if variable name starts with lowercase

lowerCase:
bge $t0, 'a', checkz #check if less than z

j main

checkz:
ble $t0, 'z', declareVar # start declaring variable

j main

declareVar:
add $t2, $t2, 1
lb $t0, str($t2) # load next character
sb $t0, ($s0) # load these characters
addi $s0, $s0, 1 
beq $t0, ' ', endOfVarName
beq $t0, $zero, main 

j declareVar

endOfVarName:
add $t2, $t2, 1
lb $t0, str($t2)
beq $t0, ' ', endOfVarName
beq $t0, '=', foundEqual
beq $t0, $zero, main

foundEqual:

add $t2, $t2, 1
lb $t0, str($t2)
beq $t0, ' ', foundEqual
bge $t0, '0', checkLessThanNine
beq $t0, $zero, main

checkLessThanNine:
ble $t0, '9' foundNumber

j main

foundNumber:
sb $t0, ($s1) # load these these numbers to address
addi $s1, $s1, 1 # load these these numbers to address
add $t2, $t2, 1
lb $t0, str($t2)
bge $t0, '0', checkLessThanNine

j main

check:
li $t0, ' '
sb $t0, ($s1) # load these these numbers to address
addi $s1, $s1, 1 # load these these numbers to address
add $t2, $t2, 1
la      $a0, newline    #newline
syscall
sb	$zero, ($s0) # just in case you want to see what is in the var in terms of the name
la	$a0, stringstore
li	$v0, 4
syscall
la      $a0, newline    #newline
syscall
sb	$zero, ($s1) # just in case you want to see what is in the var in terms of the name
la	$a0, numstore
li	$v0, 4
syscall
la      $a0, newline    #newline
syscall
j main

#notVariable:
#
#la      $a0, nv     #calling opening prompt
#li      $v0, 4
#syscall
#
#la      $a0, newline    #newline
#syscall
#
#j main