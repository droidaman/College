# Read the Python documentation for more information on using files:
#     http://docs.python.org/tutorial/inputoutput.html

# Opening a file for input is easy:
filename = raw_input("Enter name of a text file: ")
inputdata = open(filename)

# We can read in the whole file as a list of words:
wordlist = inputdata.read().split()

print "File as a list of words:"
for i in range(0,len(wordlist)):
   print wordlist[i], # removing comma yields one word per line
inputdata.close()

print
print

# Or we can read it in as a list of lines:
inputdata = open(filename)
lines = inputdata.readlines()

print "File as a list of lines:"
for line in lines:
   print "length=",len(line) # to show that the newline is included
   print line,   # removing comma yields double-spaced
inputdata.close()
