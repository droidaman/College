x = -10:10
y = (2.172927996771259*x +-0.35045549034652834)/4.067698081762149

plot(y~x,type="l")

pos = read.table("pospoints",header=F)
neg = read.table("negpoints",header=F)

points(pos$V2 ~ pos$V1,col="blue")
points(neg$V2 ~ neg$V1,col="red")
