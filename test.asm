#Program 1 - Takes a string and reverses the string
#
# 
# Cosc 300

.data

prompt: .asciiz ">> "
newline: .asciiz "\n"
invalid: .asciiz " invalid input " 

inputString: .space 64


.text
.globl main

main:
la      $a0, prompt     #calling opening prompt
li      $v0, 4
syscall

# ==============================================================================

la $a0, inputString
li $a1 65
li $v0, 8
syscall

la      $a0, newline    #newline
syscall

#la      $a0, ans        #initial text for reversed string
#syscall

li      $t2, 0

loop:
lb $t0, inputString($t2)
beq $t2, ')', inv
add $t2, $t2, 1
j loop
	
inv:

la      $a0, invalid   #calling opening prompt
li      $v0, 4
syscall

la      $a0, newline    #newline
syscall

j main

#strLen:                 #getting length of string
#lb      $t0, inputString($t2)   #loading value
#add     $t2, $t2, 1
#bne     $t0, $zero, strLen
#sub     $t2, $t2, 1
#li      $v0, 11         #load imediate - print low-level byte

#Loop:
#la      $t0, str($t2)   #loading value
#lb      $a0, ($t0)
#syscall
#sub     $t2, $t2, 1
#bnez    $t2, Loop

#li $v0, 10              #program done: terminating
#syscall
