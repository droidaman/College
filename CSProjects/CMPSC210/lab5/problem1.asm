# Braden Licastro
# CMPSC210
# Lab 5 Problem 1
# Fall 2011
	
	.data
	.align	2
f:	.word	2	# declare f as 2
g:	.word	6	# declare g as 6
h:	.word	10	# declare g as 10
Outp:	.asciiz	"Problem Output:\n"	# declare Output as problem output
Outp2:	.asciiz	"f = f + g - h * (f + 5)\n"	# declare Output2 as the function
Outp3:	.asciiz	"f = 2, g = 6, h = 10\n\n"	# declare Output3 as the values
Outp4:	.asciiz	"Result:\n"	# declare Output4 as result

	.text
	.align	2
	.globl	main
main:	lw $s1, f	# loads f into $s1
	lw $s2, g	# loads g into $s2
	lw $s3, h	# loads h into $s3

	addi $t0, $s1, 5	# $t0 = f + 5
	mul $t0, $s3, $t0	# $t0 = h * (f + 5)
	sub $t0, $s2, $t0	# $t0 = g - (h * (f + 5))
	add $t0, $s1, $t0	# $t0 = f + (g - (h * (f + 5)))

	li $v0, 4	# send a call for printing
	la $a0, Outp	# load address for printing
	syscall		# print the string

	li $v0, 4	# send a call for printing
	la $a0, Outp2	# load address for printing
	syscall		# print the string

	li $v0, 4	# send a call for printing
	la $a0, Outp3	# load address for printing
	syscall		# print the string

	li $v0, 4	# send a call for printing
	la $a0, Outp4	# load address for printing
	syscall		# print the string

	li $v0, 1	# send a call for printing an integer
	move $a0, $t0	# move contents of $t0 into $a0
	syscall		# print the integer

	li $v0, 10	# send a call for program exit
	syscall		# exit