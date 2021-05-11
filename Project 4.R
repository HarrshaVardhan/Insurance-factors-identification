Insurance <- read.csv("D:/Simplilearn/Project Data Sets/4/1559641988_insurance_factor_identification/Insurance.csv")
 
View(Insurance)

# To know each field of the data collected

summary(Insurance)

# Descriptive Analysis

lm1 <- lm(Insurance$Payment~Insurance$Claims+Insurance$Insured)

lm1

summary(lm1)

# To find the relation between the number of claims and the 
# the number of insured policy years

cor(Insurance$Claims,Insurance$Payment)

cor(Insurance$Insured,Insurance$Payment)

# To visualize the results for better understanding

library(ggplot2)

plot(Insurance$Insured,Insurance$Payment)

plot(Insurance$Payment,Insurance$Insured)

# To find which terms are affecting the payment

lm2 <- lm(Insurance$Payment~., data = Insurance)

lm2

# To establish a new branch office 

new_branch <- apply(Insurance[,c(5,6,7)], 2, 
              function(x) tapply(x,Insurance$Zone,mean))

new_branch

# to find at what location, kilometer, and bonus level their 
 # insured amount, claims, and payment gets increased.

high_claims <- apply(Insurance[,c(5,6,7)],2,
              function(x)tapply(x,Insurance$Kilometres,mean))

high_claims

max_pay <- apply(Insurance[,c(5,6,7)],2,
              function(x)tapply(x,Insurance$Bonus,mean))

max_pay

# To understand which affects their claim rates

affect_claim <- lm(Claims~Kilometres+Zone+Bonus+Make+Insured,
                   data = Insurance)

summary(affect_claim)
