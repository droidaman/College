# Simulate a router with N input ports (with queues) and N output ports
# (with queues).
#
# Assumption: At each time unit, up to N packets arrive at
# randomly-chosen input ports. Specifically, we perform the following N
# times:
#       generate random value between 0 and 1
#       if value is less than some probability p:
#          generate a new arrival, randomly assign to an input queue
#
# Each packet is assigned to a randomly-chosen output port.
#
# At each time unit, one packet from each input queue can be transferred
# from the input queue to the corresponding output port.
#
# At each time unit, one packet from each output queue can be
# transmitted.
#
# If an input or output queue ever exceeds some maximum queue size,
# packets are dropped.

import random

time = 0        # simulation clock
packet = 0      # label of next packet to arrive
n = 3           # number of input/output ports
inpdropped = 0  # number of packets dropped from input queues
outdropped = 0  # number of packets dropped from output queues
maxq = 50        # maximum queue size
prob = 1       # probability of a packet arriving at a given time


inp = []        # list of input queues
out = []        # list of output queues

# Initialize all queues to empty:
for j in range(n):
   inp.append([])
   out.append([])

# Simulate for 1000 clock ticks:
while time < 1000:
   # Generate up to N random arrivals:
   for j in range(n):
      if random.random() <= prob:
         l = random.choice(range(n)) # pick input port
         k = random.choice(range(n)) # pick output port
         if len(inp[l]) < maxq:      # is input queue full?
            inp[l].append((packet,k))
            print "Time",time,": packet",packet,"arrives at input",l,
            print "destined for output",k
         else:
            print "TIME",time,": PACKET",packet,"DROPPED; INPUT QUEUE",l,
            print "IS FULL"
            inpdropped += 1
         packet += 1

   # Transfer packets from input queues to output queues; can do
   # one from each input queue (if anything is there, of course):
   for j in range(n):
      if len(inp[j]) > 0: # is there anything in queue j?
         p,k = inp[j][0]
         inp[j] = inp[j][1:]
         if len(out[k]) < maxq: # is the output queue full?
            out[k].append(p)
            print "Time",time,": packet",p,"switched to output queue",k
         else:
            print "TIME",time,": PACKET",p,"DROPPED; OUTPUT QUEUE",k,"IS FULL"
            outdropped += 1

   # Transmit packets from output queues; can transmit one packet from
   # each output queue (if anything is there, of course):
   for j in range(n):
      if len(out[j]) > 0:
         p = out[j][0]
         out[j] = out[j][1:]
         print "Time",time,": packet",p,"transmitted from output queue",j

   # Print summary of queue sizes for current time:
   print "Time",time,": input queue sizes:",
   for j in range(n):
      print len(inp[j]),
   print
   print "Time",time,": output queue sizes:",
   for j in range(n):
      print len(out[j]),
   print

   time += 1       # clock tick
   print "------"

# Print information on dropped packets:
print inpdropped,"dropped from input"
print outdropped,"dropped from output"
