data(ToothGrowth)
summary(ToothGrowth)
head(ToothGrowth)

hist(ToothGrowth$len, xlab = 'len', main = 'ToothGrowth')

# Mean of Len
mean(ToothGrowth$len)

# Sd of Len
sd(ToothGrowth$len)

plot <- ggplot(ToothGrowth, 
               aes(x=factor(dose),y=len,fill=factor(dose)))
plot + geom_boxplot(notch=F) + facet_grid(.~supp) +
  scale_x_discrete("Dosage (Milligram)") +   
  scale_y_continuous("Length of Teeth") +  
  ggtitle("Effect of Dosage and Supplement Type on Tooth Growth")

supp.t1 <- t.test(len~supp, paired=F, var.equal=T, data=ToothGrowth)
supp.t2 <- t.test(len~supp, paired=F, var.equal=F, data=ToothGrowth)
supp.result <- data.frame("p-value"=c(supp.t1$p.value, supp.t2$p.value),
                          "Conf-Low"=c(supp.t1$conf[1],supp.t2$conf[1]),
                          "Conf-High"=c(supp.t1$conf[2],supp.t2$conf[2]),
                          row.names=c("Equal Var","Unequal Var"))
supp.result