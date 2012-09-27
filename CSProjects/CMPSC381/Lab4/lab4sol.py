# Braden Licastro
# Lab 4
# Professor Roos

# Start catching some errors!
try:

    # Ask for the input file and accept the input:
    filename = raw_input("Filename? ")
    inputFile = open(filename)

    # Pull all lines out of the file
    lineQueue = inputFile.readlines()

    # Ask what line they want to work with and get that line from the file:
    line = raw_input("Which line? ")
    lineRequested = lineQueue[int(line)]

    # Put all words from requested line in a queue
    wordQueue = lineRequested.split()

    # Ask what line they want to work with and get that line from the file:
    word = raw_input("Which word in line " + str(line) + "? ")
    wordRequested = wordQueue[int(word)]

    # Print the requested word
    print wordRequested
    
    inputFile.close()

# What?? An invalid file you say?
except IOError:
    print "Can't open file"

# Sentence or word out of bound error??
except IndexError:
    print "Index out of bounds"

except NameError:
    print ""
print
