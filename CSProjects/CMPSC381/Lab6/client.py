# A simple "stop and wait" file transfer client. 
#
# A file is exactly 20 packets long; each packet has a
# 1-character "header", either '0' or '1'.
#
# Headers for successive packets alternate (so packets 0, 2, 4, ...
# have header '0', packets 1, 3, 5, 7, ... hava header '1')
# A packet is acknowledged with a single-character message containing
# the number of the NEXT header expected. Thus, the ack for a '0'
# packet is '1', the ack for a '1' packet is '0'.
#
# If no ack is received after 1 second, the client re-sends the packet

from socket import *
from signal import *
import time

serverName = 'localhost'
serverPort = 12345
clientSocket = socket(AF_INET, SOCK_DGRAM)

# Set a "timeout" action. (This is not the most elegant solution!)
def timeout_handler(signum, frame):
   raise Exception

# Associate the signal "SIGALRM" with the timeout-handler method:
signal(SIGALRM,timeout_handler)

# First header is 0:
bit = '0'

# Stats: count number of unacked packets:
dropped = 0

# Packets successfully sent so far:
i = 0
message = "abcdefghijklmnopqrst"
while i < 20:
   packet = bit+message[i] # header plus packet payload
   print "sending",packet
   alarm(1)

   # Send packet, wait for ack:
   try:
      clientSocket.sendto(packet,(serverName, serverPort))
      ack, serverAddress = clientSocket.recvfrom(2048)
      print "ack =",ack

      # Is it the ack we were expecting?

      ###########
      # FILL IN CODE HERE (you may need to use "int(...)" and "str(...)"
      # to convert back and forth between 0 and '0', 1 and '1')
      ###########

   except Exception: # timeout
      print "no response"
      dropped += 1

clientSocket.close()
print dropped,"dropped packets"
