# Read in a string:

name = raw_input("Type in your name: ")

# Read in an int:

L = int(raw_input("What is the packet size in bits? "))

# Read in a float:

p = float(raw_input("Enter propagation speed in meters/sec: "))

# Can join things in "print" using "," (which inserts a space), or
# can use concatenation operator "+", which requires conversion 
# of numbers to string using the "str(...)" function:

print "Hi,",name,"packet size is",L,"bits and propagation rate is",p,"bits/sec"

print name+", you entered the values "+str(L)+" and "+str(p)
