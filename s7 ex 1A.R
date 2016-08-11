
#Exercise 1 ------------------------------
states.data <- readRDS("dataSets/states.rds") 
states.info <- data.frame(attributes(states.data)[c("names", "var.labels")])
plot (states.data$energy)

#Initial Model - We are to estimate energy using metro
model1 = lm(energy ~ metro , data=states.data)
summary(model1)

#Improved Model - We are to play with the data to see if we can find a better model
#Model below gives us a higher r^2 when omitting metro 
model2 = lm(energy ~ toxic + green , data=states.data)
summary(model2)

#Exercise 2 ------------------------------

#Adding interaction between toxic and green
model3 = lm(energy ~ toxic*green, data=states.data)
summary(model3)

#Adding Region
states.data$region <- factor(states.data$region)
model4 <- lm(energy ~ toxic*green + region,data=states.data) 
summary(model4)
