nsim = 1:1000
n = 40
lambda = 0.2

mns = NULL
for (i in nsim) mns = c(mns, mean(rexp(n,lambda)))


meanofmean = mean(mns)

# Expected Mean
expectedmean = 1/lambda

# Standard Deviation
standardd = sd(mns)

# Expected sd
expectedstandard = (1/lambda) / sqrt(n)

# Varaince
variance = var(mns)

# Expected variance
expectedvariance = ((1/lambda) / sqrt(n))^2

library(ggplot2)
plotdata <- data.frame(mns);
plot1 <- ggplot(plotdata, aes(x =mns))
plot1 <- plot1 +geom_histogram(aes(y=..density..), colour="black",
                               fill = "blue")
plot1<-plot1+labs(title="Density of 40 Numbers from Exp. Distribution", x="Mean of 40 Selections", y="Density")
plot1<-plot1 +geom_vline(xintercept=expectedmean,size=1.0, color="green",linetype ="longdash")
plot1<-plot1 +geom_vline(xintercept=meanofmean,size=1.0, color="yellow",linetype = "longdash")
plot1<-plot1 +stat_function(fun=dnorm,args=list( mean=expectedmean, sd=sqrt(expectedvariance)),color = "green", size = 1.0)
plot1<-plot1 +stat_function(fun=dnorm,args=list( mean=meanofmean, sd=sqrt(variance)),color = "yellow", size = 1.0)
print(plot1)
