# A simple "stop and wait" file transfer server. This server works
# only in conjunction with a SINGLE client (in other words, it doesn't
# distinguish between messages received from two different clients).
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
# When 20 packets have been received, the resulting message is printed
# out and the packet count is reset to zero.

from socket import *
from random import *

port = 12345
socket = socket(AF_INET, SOCK_DGRAM)
socket.bind(('', port))

# First packet should have a 0 header:
expecting = 0

# Final message:
result = ''

# Count of distinct packets received:
count = 0

while 1:
   # Wait for a client message:
   message, address = socket.recvfrom(2048)

   # Extract the header:
   bit = int(message[0])

   # Is it the one we are expecting?
   if bit == expecting:
      result = result + message[1:]
      expecting  = 1-expecting
      count += 1

   # Send ack:
   if random() < .9: # artificially simulate 10% lost packets
      socket.sendto(str(expecting), address)

   # See if message is complete; if so, print it:
   if count == 20:
      print "Server got:",result
      count = 0
      result = ''
