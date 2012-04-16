# Braden Licastro
# CMPSC 210
# Fall Semester - 2011
# Lab 7
# Exercise 3
# MIPS String Reverser

		.data
		.align 1
inString:	.word 0				# Make space for the sentence to be reversed (input string).
in1:		.asciiz "How many characters are in the sentence?: "	# Declare in1 to be sentence length
in2:		.asciiz "Input a sentence to be reversed: "		# Declare in2 to be the sentence
out1:		.asciiz "\nInput: "		# Declare out1 to be input -output
out2:		.asciiz "\nOutput: "		# Declare out2 to be output -output

		.text
		.globl main
main:		add $t0, $zero, $zero		# Set $t0 to zero

		li $v0, 4			# System call for printing strings
		la $a0, in1			# Load address for printing
		syscall				# Print out the string
		li $v0, 5			# System call for input
		syscall				# Read in the integer
		addi $s0, $v0, -1		# Set the end of the string to be changed

		li $v0, 4			# System call for printing strings
		la $a0, in2			# Load the address for printing
		syscall				# Print out the string

input:	
		li $v0, 12			# System call for reading in characters
		syscall				# Read the sentence characters in
		add $t1, $v0, $zero		# Move the input character into a temporary register
		sb $t1, inString($t0)		# Store the character in the string
		
		addi $t0, $t0, 1		# Incriment the input counter: $t0++
		slt $t1, $s0, $t0		# Is $s0 less than the length of the sentence yet?
		beq $t1, $zero, input		# Continue to loop until the whole sentence has been input

		sb $zero, inString($t0)		# Put a zero in the end of the string as a termination, keeps exra prints away

		li $v0, 4			# System call for printing strings
		la $a0, out1			# Load the address for printing
		syscall				# Print out the string

		li $v0, 4			# System call for printing strings
		la $a0, inString		# Load the address for printing the sentence
		syscall				# Print out the string
		
		add $a1, $zero, $s0		# Give the 
		jal reverse			# Reverse the stored sring

		li $v0, 4			# System call for printing strings
		la $a0, out2			# Load the address for printing the string
		syscall				# Print out the string

		li $v0, 4			# System call for printing strings
		la $a0, inString		# Load the address for printing the string
		syscall				# Print out the string

		li $v0, 10			# System call for a soft exit
		syscall				# Exit the program

reverse:
		add $t0, $a0, $zero 		# Move the address of the string to $t1
		add $t1, $zero, $zero		# Start the first register at the first character
		add $t2, $s0, $zero		# Start the second register at the last character

pointerloop:
		add $t3, $t0, $t1		# Add the starting address to the location of our left hand letter
		lb  $t4, 0($t3)			# Load the byte located at the registers address into yet another temp
		add $t5, $t0, $t2		# Add the starting address to the location of our right hand letter
		lb $t6, 0($t5)			# Load the byte located at the registers address into yet anotherrrrr temp

		sb $t4, 0($t5)			# Move the byte from the second register to the first register
		sb $t6, 0($t3)			# Move the byte from the first register to the second register

		addi $t1, $t1, 1		# Increment the first register by one to get to the next character
		addi $t2, $t2, -1		# Decrement the second register by one to get to the next character.
		slt $t6, $t2, $t1		# If the first and second registers are the same set $t6 to 1 otherwxise 0
		beq $t6, $zero, pointerloop	# The string hasn't been completely reversed? Re-loop the pointers!

		jr $ra				# Jump out of the loop and back into the program