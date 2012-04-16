# Braden Licastro
# CMPSC210
# Lab 5 Problem 3 - Assembly Language
# Fall 2011
	
	.data
	.align	2
f:	.word	0	# declare f as 0
g:	.word	5	# declare g as 5
h:	.word	7	# declare h as 7
k:	.word	2	# declare k as 2
arr:	.word 6, 5, 4, 3, 2, 1
Outp:	.asciiz	"Problem Output:\n"	# declare Output as problem output
Outp2:	.asciiz	"f = g + h - a[k]\n"	# declare Output2 as the function
Outp3:	.asciiz	"g = 5, h = 7, k = 2, arr = 6, 5, 4, 3, 2, 1\n\n" # declare Output3 as the values
Outp4:	.asciiz	"Result:\n"	# declare Output4 as result

	.text
	.align	2
	.globl	main
main:	lw $s0, f	# loads f into $s0
	lw $s1, g	# loads g into $s1
	lw $s2, h	# loads h into $s2
	lw $s3, k	# loads k into $s3
	la $s7, arr	# loads arr into $s7

	lw $t0, 8($s7)	# loads contents of a3 into $t0

	add $t1, $s1, $s2	# $t0 = g + h
	sub $s0, $t1, $t0	# $t0 = g + h - a[k]
	
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