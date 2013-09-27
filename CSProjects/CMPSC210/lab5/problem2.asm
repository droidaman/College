# Braden Licastro
# CMPSC210
# Lab 5 Problem 2 - Assembly Language
# Fall 2011
	
	.data
	.align	2
f:	.word	0	# declare f as 0
g:	.word	8	# declare g as 8
h:	.word	4	# declare g as 4
arr:	.word 5, 4, 3, 2, 1
Outp:	.asciiz	"Problem Output:\n"	# declare Output as problem output
Outp2:	.asciiz	"f = g - a[3] - h + 10\n"	# declare Output2 as the function
Outp3:	.asciiz	"g = 8, h = 4, arr = 5, 4, 3, 2, 1\n\n"	# declare Output3 as the values
Outp4:	.asciiz	"Result:\n"	# declare Output4 as result

	.text
	.align	2
	.globl	main
main:	lw $s0, f	# loads f into $s0
	lw $s1, g	# loads g into $s1
	lw $s2, h	# loads h into $s2
	la $s7, arr	# loads arr into $s7
	lw $t0, 12($s7) # loads contents of a3 into $t0

	sub $t0, $s1, $t0	# $t0 = g - a[3]
	sub $t0, $t0, $s2	# $t0 = g - a[3] - h
	addi $s0, $t0, 10	# $t0 = g - a[3] - h + 10
	
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
	move $a0, $s0	# move contents of $t0 into $a0
	syscall		# print the integer

	li $v0, 10	# send a call for program exit
	syscall		# exit
