# Short example: shows how to remove the '\n' from a line read from a
# file. Negative indices are counted from the right of the list.
# Note that strings are treated like lists of characters: for instance, if
# s = "abcde", then s[4] = 'e', s[2:] = 'cde', s[:3] = 'abc', s[-2] = 'd',
# s[1:3] = 'bc', and s[1:-1] = 'bcd'

file = open(raw_input("file? "))
data = file.readlines()
for i in range(0,len(data)):
  line = data[i][:-1] # everthing in line i excluding the last character
  print line
