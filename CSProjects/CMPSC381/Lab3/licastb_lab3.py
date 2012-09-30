# Braden Licastro
# CMPSC381
# Lab 3
# Professor Roos

# Universal inputs
linkNums = int(raw_input("How many links? "))
pSize = float(raw_input("Packet size (in bits)? "))
pDelay = float(raw_input("Propogation delay (in m/sec)? "))
print

compoundingTime = 0

# For n links
for i in range(linkNums):
    # Information per link
    transRate = float(raw_input("Transmission rate for link " + str(i) + " (bits/sec)? "))
    linkLength = float(raw_input("Length of link " + str(i) + "? "))

    print

    # Transmission Delay L/R
    compoundingTime += pSize/transRate
    # Propagation Delay d/s
    compoundingTime += linkLength/pDelay

# Convert from seconds to milliseconds and print the final result.
compoundingTime *= 1000
print("The total end-to-end delay is " + str(compoundingTime) + " milliseconds.")
