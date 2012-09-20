# Exceptions in Python are similar to Java "try/catch".
# You can read about them at:
#     http://docs.python.org/tutorial/errors.html
#
# This also introduces some more list notation: the expression 
# [0:3] means all items between positions 0 and 3, i.e., the first 
# three words. Similarly, [4:] means "everything from position 4 item to
# the end" and [:10] means "everything up to position 10".

try:
   filename = raw_input("Enter name of an existing text file: ")
   data = open(filename)
   print "Successfully opened",filename
   print "first three words are",
   words = data.read().split()[0:3]  # See header comments
   print words
   data.close()

   filename = raw_input("Enter name of a nonexistent text file: ")
   data = open(filename)
   print "Successfully opened",filename
   data.close()
except IOError:
   print "Unable to open",filename

print "That's all!"
