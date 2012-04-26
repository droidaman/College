datamuta2 = read.table("30.50.02.2.1.10000.pal.out",header=F)
datamuta4 = read.table("30.50.04.2.1.10000.pal.out",header=F)
datamuta8 = read.table("30.50.08.2.1.10000.pal.out",header=F)

print("Mutation Probability 2%:")
print(summary(datamuta2$V7))
print("Mutation Probability 4%:")
print(summary(datamuta4$V7))
print("Mutation Probability 8%:")
print(summary(datamuta8$V7))

boxplot( datamuta2$V7, datamuta4$V7, datamuta8$V7)
