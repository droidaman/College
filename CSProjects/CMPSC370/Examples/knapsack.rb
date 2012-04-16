# Probability that any given bit will be mutated:
Mutateprob = 0.01

# Probability that a pair of selected chromosomes will be crossed over:
Crossprob  = 0.9

# Size of population:
Popsize = 30

# Number of generations:
Maxgens = 100

#################################################################
# readProblem:
#
# Input a knapsack instance as a file of integers in the form:
#
#     n
#     1 val[0] wt[0]
#     2 val[1] wt[1]
#        ...
#     n val[n-1] wt[n-1]
#     cap
#
# Such a file might be created by the program "generator.c" by David
# Pisinger [http://www.diku.dk/~pisinger/codes.html]
#
# Returns the values n,val,wt,cap -- the number n, of items, the array
# val of values or "profits" for each item, the array wt of item weights,
# and the capacity, cap, of the knapsack.
#################################################################

def readProblem()
  # If not provided on command line, prompt user for input file:
  if ARGV[0] == nil
    printf "Data file? "
    fname = gets.chomp!
  else
    fname = ARGV[0]
  end
  infile = open(fname)

  # Read it all in, first n...
  n = infile.gets.to_i

  # ... then the values and weights...
  val = Array.new(n)
  wt = Array.new(n)
  for i in 0..n-1
    dummy,val[i],wt[i] = infile.gets.split.map {|x| x.to_i}
  end

  # ... and finally the capacity:
  cap = infile.gets.to_i
    
  return n,val,wt,cap
end

##########################################################
# mutate:
#
# Mutate a binary string
##########################################################
def mutate(s)
  for i in 0..s.length-1
    if rand() <= Mutateprob
      s[i] = (1-s[i..i].to_i).to_s
    end
  end
  return s
end

##############################################################
# cross:
#
#Crossover two strings
##############################################################
def cross(s1,s2)
  if rand() < Crossprob
    # Choose a random point to perform crossover:
    loc = 1+rand(s1.length-1)
    t1 = s1[0..loc-1] + s2[loc..-1]
    t2 = s2[0..loc-1] + s1[loc..-1]
  else
    t1 = s1
    t2 = s2
  end
  return t1,t2
end

#############################################################
# fitness:
#
# Returns the fitness of a given string:
#############################################################
def fitness(s,val,wt,cap)
  v = 0
  w = 0
  for i in 0..s.length-1
    mult = s[i..i].to_i
    w += mult * wt[i]
    if w > cap
       return 0
    end
    v += mult * val[i]
  end
  return v
end

##################################################
# randomPop:
#
# Returns an array of randomly-generated chromosomes
###################################################
def randomPop(n)
  pop = []
  for i in 0..Popsize-1
    bits = ""
    for i in 0..n-1
      bits += rand(2).to_s
    end
    pop = pop << bits
  end
  return pop
end

######################################################
# select:
#
# performs roulette wheel selection. An index is selected
# with probability proportional to the fitness of the element
# located at that index.
#######################################################
def select(pop,fit,fitsum,totalfit)
  r = rand()
  j = 0
  while fitsum[j+1]/totalfit <= r
    j += 1
  end
  return j
end

########################################################
# MAIN PROGRAM STARTS HERE
########################################################
datafile = File.new("knapsack.out","w")
itemcount = 1
n,val,wt,cap = readProblem()

# Print out the problem data:
for i in 0..n-1
  printf "%d %d\n",val[i],wt[i]
end
printf "%d\n",cap

fit = []
fitsum = [0]
maxfit = -1
maxfitindex = 0

# Create a random population, calculate fitness, max fitness, and
# maintain a running sum of fitnesses (for proportional selection):
pop = randomPop(n)
for i in 0..Popsize-1
  fit[i] = fitness(pop[i],val,wt,cap)
  fitsum[i+1] = fitsum[i] + fit[i]
  if fit[i] > maxfit
    maxfit = fit[i]
    maxfitindex = i
  end
end
totalfit = fitsum[-1]*1.0
globalbest = maxfit

=begin
printf "Generation 0:\n"
for i in 0..Popsize-1
  printf "%s fitness = %d (frac = %f)\n",pop[i],fit[i], fitsum[i+1]/totalfit
end
=end

#printf "%3d: best = %f, globalbest = %f, avg = %f\n",0,maxfit,globalbest,totalfit/Popsize
datafile.printf "{%d,%f}",0,totalfit/Popsize

# Evolve for Maxgens generations:
for gen in 1..Maxgens
#  printf "Generation %d:\n",gen
  newpop = []
  newfit = []
  newfitsum = [0]
  newmaxfit = -1
  newmaxfitindex = 0

  # Selection: pick Popsize/2-1 random elements from pop:
  for i in 0..Popsize/2-1
    j = select(pop,fit,fitsum,totalfit)
    newpop[i] = pop[j]
    newfit[i] = fit[j]
    newfitsum[i+1] = newfitsum[i] + newfit[i]
    if newfit[i] > newmaxfit
      newmaxfit = newfit[i]
      newmaxfitindex = i
    end
  end

  # Crossover and mutation: pick Popsize/2 random pairs of elements and 
  # cross them over; mutate the results:
  i = Popsize/2
  while i < Popsize-1
    j1 = select(pop,fit,fitsum,totalfit)
    j2 = select(pop,fit,fitsum,totalfit)
    new1,new2 = cross(pop[j1],pop[j2])
    newpop[i] = mutate(new1)
    newpop[i+1] = mutate(new2)
    newfit[i] = fitness(new1,val,wt,cap)
    newfit[i+1] = fitness(new2,val,wt,cap)
    newfitsum[i+1] = newfitsum[i] + newfit[i]
    newfitsum[i+2] = newfitsum[i+1] + newfit[i+1]
    if newfit[i] > newmaxfit
      newmaxfit = newfit[i]
      newmaxfitindex = i
    end
    if newfit[i+1] > newmaxfit
      newmaxfit = newfit[i+1]
      newmaxfitindex = i+1
    end
    i += 1
  end

  # Copy over the new population data to the old population
  pop = newpop
  fit = newfit
  fitsum = newfitsum
  maxfit = newmaxfit
  maxfitindex = newmaxfitindex
  globalbest = [globalbest,maxfit].max
  totalfit = fitsum[-1]*1.0
  printf "%3d: best = %f, globalbest = %f, avg = %f\n",gen,maxfit,globalbest,totalfit/Popsize
  datafile.printf ","
  if itemcount %4 == 0
    datafile.printf "\n"
  end
  itemcount += 1
  datafile.printf "{%d,%f}",gen,totalfit/Popsize

=begin
  for i in 0..Popsize-1
    printf "%s fitness = %d (frac = %f)\n",pop[i],fit[i], fitsum[i+1]/totalfit
  end
=end
end



=begin
# For debugging...
for i in 0..n-1
  printf "%d %d\n",val[i],wt[i]
end
printf "%d\n",cap

for i in 0..Popsize-1
  puts pop[i],fit[i],fitsum[i+1]
end
for i in 0..Popsize/2-1
  puts newpop[i],newfit[i],newfitsum[i+1]
end
=end
