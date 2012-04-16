# Braden Licastro
# CS 210 - Fall 2011
# Lab 6 - Problem 1
# Assembly Language
# Takes in an integer and this integer is compared to EACH value in the array. If the integer is larger than each item in the array, return 1, otherwise return -1.

			.data
			.align 2
Position:		.word 	0
Array:		.word	40
Inp:			.asciiz	"\n Enter the number you want to compare the array values to: "
Inp2:		.asciiz	"\n Enter the size of the array: "
Inp3:		.asciiz	"\n Enter an array value: "
Outp:		.asciiz	"\nProblem Output:\n"		# declare Output as problem output
Outp2:		.asciiz	"\nNumber to be compared: "	# declare Output2 as the compare
Outp3:		.asciiz	"\nArray Size: "				# declare Output3 as the arr size
Outp4:		.asciiz	"\nArray: "					# declare Output4 as the array values
Outp5:		.asciiz	"\nResult: "				# declare Output5 as result
Blank:		.asciiz	", "						# declare Blank as spacer

		.text
		.globl main
main:	la $s0, Array			# Load the base address of the array into $s0
		sw $s0, Position		# Save position as $s0

		move $s6, $zero		# Move 0 into $s6
		
		li $v0, 4				# Send a call for printing
		la $a0, Inp			# Load address for printing
		syscall				# Print out string
		li $v0, 5				# Send a call for input
		syscall				# Read in the integer
		add $s1,$v0,$zero		# Copy the input to $s0

		li $v0, 4				# Send a call for printing
		la $a0, Inp2			# Load address for printing
		syscall				# Print out_string
		li $v0, 5				# Send a call for input
		syscall				# Read in the integer
		add $s2,$v0,$zero		# Copy the input to $s1
		addi $s2, $s2, -1		# Decrement array sizes so it is the location of the last index.
		
		la $s3, Position		# Load address of Position into $s3
		jal inLoop				# Jump to the array input loop.
	
		add	$s6, $zero, $zero	# Reset counter to zero
		la $s3, Position		# Load address of Position into $s3
		jal compare			# Jump to the array comparison loop.

		li $v0, 4				# Send a call for printing
		la $a0, Outp			# Load address for printing
		syscall				# Print out_string
		li $v0, 4				# Send a call for printing
		la $a0, Outp2			# Load address for printing
		syscall				# Print out_string
		li $v0, 1				# Send a call for printing
		move $a0, $s1			# Load address for printing
		syscall				# Print out_string

		li $v0, 4				# Send a call for printing
		la $a0, Outp3			# Load address for printing
		syscall				# Print out_string
		li $v0, 4				# Send a call for printing
		move $a0, $s2			# Load address for printing
		syscall				# Print out_string

		li $v0, 4				# Send a call for printing
		la $a0, Outp4			# Load address for printing
		syscall				# Print out_string
		add	$s6, $zero, $zero	# Reset counter to zero
		la $s3, Position		# Load address of Position into $s3
		jal prtLoop			# Jump into the print loop

		li $v0, 10				# Call to exit the program
		syscall				# Just exit finally...

inLoop:	li $v0, 4				# Send a call for printing
		la $a0, Inp3			# Load address for printing
		syscall				# Print out_string
		li $v0, 5				# Send a call for input
		syscall				# Read in the integer
		move $s7, $v0			# Move $v0 into $s1 - every pass.
		
		mul $t0, $s6, 4			# Multiply $s6 by 4
		add $t1, $s0, $t0		# Add $s0 to $t0
		sw $s7, ($t1)			# Store the contents of $t1 in $s7
		addi $s6, $s6, 1		# Incriment the counter by 1
		blt  $s6, $s2, inLoop		# Reenter the loop if the whole array isn't done.
		jr $ra				# Jump back to the last location in main.

prtLoop:	mul $t0, $s6, 4			# Multiply $s6 by 4
		add $t1, $s0, $t0		# Add $s0 to $t0
		lw $s7, ($t1)			# Load the contents of $t1 into $s7
		li $v0, 4				# Send a call for printing
		add $a0, $s7, $zero		# Load address for printing
		syscall				# Print out_string
		li $v0, 4				# Send a call for printing
		la $a0, Blank			# Print the blank space.
		syscall

		addi $s6, $s6, 1		# Incriment the counter by one.
		blt $s6, $s2, prtLoop	# Reenter the loop if the whole array isn't done.
		jr $ra				# Jump back to the last location in main.

		.text
		.globl compare
compare:	mul $t0, $s6, 4			# Multiply $s6 by 4
		add $t1, $s0, $t0		# Add $s0 to $t0
		lw $s7, ($t1)			# Load the contents of $t1 into $s7
		slt $s5, $s1, $s7		# If $s1 is less than $s0 make $s5 1
		bgt $s5, $zero, fixnum	# Make things equal to -1 and not 0
		seq $s4, $s5, 1		# Save state in $s4 if its a 1
		addi $s6, $s6, 1		# Incriment $s6 by 1
		blt $s6, $s2, compare	# Reenter the loop if the whole array isn't done.
		jr $ra

fixnum:	addi $s5, $s5, -1