datatour1 = read.table("30.50.01.1.1.10000.pal.out",header=F)
datatour3 = read.table("30.50.01.3.1.10000.pal.out",header=F)
datatour5 = read.table("30.50.01.5.1.10000.pal.out",header=F)

print("Tournament size 1:")
print(summary(datatour1$V7))
print("Tournament size 3:")
print(summary(datatour3$V7))
print("Tournament size 5:")
print(summary(datatour5$V7))

boxplot( datatour1$V7, datatour3$V7, datatour5$V7)
