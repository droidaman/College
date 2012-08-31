# Braden Licastro #
# 28 Aug 2012 #
# Experimenting with alphanumeric input and output #

name = raw_input('What is your name? ')
age = float(raw_input('What is your age? '))
wish = float(raw_input('What age do you wish you were? '))
until = wish - age
print "It's alright ", name, ", you'll be ", wish, " in ", until, " years."
