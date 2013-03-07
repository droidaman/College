pdf(file='Desktop/ChickWeight.pdf')
plot(weight ~ feed, data = chickwts, xlab = "Type of feed", ylab = "Weight at 6 weeks", main = "Chicken Weights by Feed Type")
dev.off()
