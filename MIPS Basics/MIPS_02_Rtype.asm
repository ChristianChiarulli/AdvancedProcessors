# Register Operand Example
# f = (g + h) - (i + j)
# f in $s0
# g = 2 (in $s1)
# h = 10 (in $s2)
# i = 3 (in $s3)
# j = 1 (in $s4)
#
# load the vaules into corresponding registers
li $s1, 2	# load 2 to $s1
li $s2, 10	# load 10 to $s2
li $s3, 3	# load 3 to $s3
li $s4, 1	# lo
# perform operations
add $t0, $s1, $s2	# $t0 = $s1 + $s2
add $t1, $s3, $s4	# $t1 = $s3 + $s4
sub $s0, $t0, $t1	# $s0 = $t0 - $t1


