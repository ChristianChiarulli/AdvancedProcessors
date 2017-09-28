#Program 1 - Takes a string and reverses the string
#
# 
# takes variables starting with either upper or lower case letter

.data

prompt: .asciiz ">> "
newline: .asciiz "\n"
invalid: .asciiz " invalid input "
notvarms: .asciiz " not var" 
madeAVar: .asciiz "made a var"
iamhere: .asciiz "here i am"
inputString: .space 64


.text
.globl main

main:
la      $a0, prompt     #calling opening prompt
li      $v0, 4		# load 4
syscall

# ==============================================================================

la $a0, inputString	#load address with my allocated space for string
li $a1 65		# allocate space
li $v0, 8		# user input string
syscall

#la      $a0, newline    #newline

syscall

li      $t2, 0


#bgt $t2, 0, notvar # so it only checks the first character
lb $s0, inputString($t2) # load first char into register
#add $t2, $t2, 1		# iterate to second char
syscall
bgeu  $s0, 'A', checkIfLessThanZ # checks caps

j notvar # not a var if not between A-Z


# declares a variable
declareVar:

lb $t0, inputString($t2)
add $t2, $t2, 1
beq $t0, ' ', endOfVarName
beq $t0, $zero, main # finds end of string
add $t2, $t2, 1

j declareVar
	
inv:

la      $a0, invalid   #calling opening prompt
li      $v0, 4
syscall

la      $a0, newline    #newline
syscall

j main

notvar:

la      $a0, notvarms   #calling opening prompt
li      $v0, 4
syscall

la      $a0, newline    #newline
syscall


j main


#################################### variable declaration #####################################
checkIfLessThanZ:
bleu  $t0, 'Z', declareVar # checks caps
j lowercase
CheckIfLessThanz:
bleu  $t0, 'z', declareVar # checks caps
j inv # this is where I stoppped
lowercase:
bgeu  $t0, 'a', CheckIfLessThanz # checks caps
j notvar


endOfVarName:
add $t2, $t2, 1
lb $t0, inputString($t2)
beq $t0, ' ', endOfVarName # keep loading spaces until you see = 
beq $t0, '=', FindNumber

j hereiam

FindNumber:
add $t2, $t2, 1
lb $t0, inputString($t2)
beq $t0, ' ', FindNumber # keep loading spaces until you see a number
beq $t0, '+', FindNumber # keep loading + until you see a number
beq $t0, '-', FindNumber # keep loading - until you see a number
bgeu $t0, 0, CheckLessThanNine

j inv

CheckGreaterThanZero:
bleu $t0, 0, CheckLessThanNine #ready to find the number
j inv

CheckLessThanNine:
bleu $t0, 9, keepGoing #ready to find the number
j inv

keepGoing:
#GOTOstore


la      $a0, madeAVar   #calling opening prompt
li      $v0, 4
syscall

la      $a0, newline    #newline
syscall

beq $t0, $zero, main # finds end of string




#################################### variable declaration #####################################

hereiam:

la      $a0, iamhere  #calling opening prompt
li      $v0, 4
syscall

la      $a0, newline    #newline
syscall

j main
