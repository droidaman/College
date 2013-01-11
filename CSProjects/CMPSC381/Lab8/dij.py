from random import *

# create a network:
n = int(raw_input("How many routers? "))

def l(i):
   return "ABCDEFGHIJKL"[i]

# seed(12345)
graph = []
for i in range(n):
   graph.append([])

for i in range(n):
   for j in range(n):
      if j < i:
         continue
      if j == i:
         graph[i].append((i,-1))
         continue
      dist = -1
      if random() < .7:
         dist = 1+int(randint(0,9))
      graph[i].append((j,dist))
      graph[j].append((i,dist))

print 'Network (a weight of "--" means "no edge"):'
for i in range(n):
   print l(i),":",
   for (j,dist) in graph[i]:
      if dist < 0:
         print "("+l(j)+",--) ",
      else:
         print "("+l(j)+","+repr(dist)+") ",
   print

table = [0]
for i in range(1,n):
   d = graph[0][i][1]
   if d > 0:
      table.append((d,0))
   else:
      table.append((-1,-1))

N1 = ['A']
for i in range(n-1):
   print "-------------------------------"
   print "Current best distances from 0:"
   for j in range(1,n):
      d = table[j][0]
      p = table[j][1]
      if d > 0:
          print "  distance to",l(j),"=",d,"(previous =",l(p),")",
      else:
          print "  distance to",l(j),"= infinity",
      if l(j) in N1:
          print "(FINISHED)"
      else:
          print 
   nxt = (raw_input("\nWhich router should I add next? ")[0]).upper()
   while nxt in N1 or nxt < l(0) or nxt >= l(n):
      if nxt in N1:
        print "That router has already been chosen; pick another"
      else:
        print "Illegal--must be between B and",l(n-1)+"; pick another"
      nxt = (raw_input("Which router should I add next? ")[0]).upper()
   N1.append(nxt)
   next="ABCDEFGHIJKL".index(nxt)
   print "\nCurrent best distance from A to",nxt,"is",table[next][0]
   for j in range(1,n):
      if l(j) in N1:
         continue
      d = graph[next][j][1]
      if d < 0:
         continue
      print "\nThere is an edge of weight",d,"from router",nxt,"to router",l(j)
      print "Update the distance from A to",l(j)," using",nxt,"? (y=yes, anything else = no)"
      ans = raw_input()
      if ans=='y':
         print "okay, changing distance to",l(j),"; new distance =",str(table[next][0]+graph[next][j][1]),"; changing previous to",nxt
         table[j]=(table[next][0]+graph[next][j][1],next)

print "-------------------------------"
print "Final distances from 0:"
for j in range(1,n):
   d = table[j][0]
   p = table[j][1]
   if d > 0:
       print "  distance to",l(j),"=",d,"(previous =",l(p),")",
   else:
       print "  distance to",l(j),"= infinity",
   if l(j) in N1:
       print "(FINISHED)"
   else:
       print 
