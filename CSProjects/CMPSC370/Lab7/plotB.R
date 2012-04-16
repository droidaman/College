# Braden Licastro

x = -10:10
y = (-0.7697931938911641*x +2.7472806060833213)/-1.1140240926637692

plot(y~x,type="l")

y2 = -(22.601195547818065*x +4.974779340505542)/-23.291768888284732
lines(y2~x,type="l",col="green")

pos = read.table("pospts",header=F)
neg = read.table("negpts",header=F)

points(pos$V2 ~ pos$V1,col="blue")
points(neg$V2 ~ neg$V1,col="red")
