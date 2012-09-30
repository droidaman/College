R = []   # empty list
d = []

n = int(raw_input("How many links? "))
for i in range(n):
  print "Enter transmission rate for node",i,"in bits/sec:",
  R.append(float(raw_input()))

  print "Enter distance from node",i,"to node",(i+1),"in meters:",
  d.append(float(raw_input()))

# Iterate over the indices 0, 1, ..., len(R)-1:
for i in range(len(R)):
  print "Node",i,"transmits at",R[i],"bits/sec"
  print "It is",d[i],"meters to node",(i+1)

# Iterate over the values in the list:
for i,transrate in enumerate(R):
  print transrate,
print

for i,distance in enumerate(d):
  print distance,
print
