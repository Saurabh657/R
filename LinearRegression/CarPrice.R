rm(list = ls())

#Import Data



Data<-read.csv("CarPrice.csv")
#Check the missing values and the mean, median, mode

summary(Data)


hist(Data$car_ID)
sum(is.na(Data$carID))

#Lets have a look at the data

head(Data)

#As seen in the data, many of our variables are categorical, which we need to create as a dummy variables first 

Data$fueltype_gas<-as.numeric(Data$fueltype=="gas")
Data$fueltype_diesel<-as.numeric(Data$fueltype=="diesel")

Data$aspiration_std<-as.numeric(Data$aspiration=="std")
Data$aspiration_turbo<-as.numeric(Data$aspiration=="turbo")


Data$doornumber_four<-as.numeric(Data$doornumber=="four")
Data$doornumber_two<-as.numeric(Data$doornumber=="two")


Data$carbody_convertible<-as.numeric(Data$carbody=="convertible")
Data$carbody_hardtop<-as.numeric(Data$carbody=="hardtop")
Data$carbody_hatchback<-as.numeric(Data$carbody=="hatchback")
Data$carbody_sedan<-as.numeric(Data$carbody=="segan")
Data$carbody_wagon<-as.numeric(Data$carbody=="wagon")


Data$drivewheel_4wd<-as.numeric(Data$drivewheel=="4wd")
Data$drivewheel_fwd<-as.numeric(Data$drivewheel=="fwd")
Data$drivewheel_rwd<-as.numeric(Data$drivewheel=="rwd")

Data$enginelocation_front<-as.numeric(Data$enginelocation=="front")
Data$enginelocation_rear<-as.numeric(Data$enginelocation=="rear")

Data$enginetype_dohc<-as.numeric(Data$enginetype=="dohc")
Data$enginetype_dohcv<-as.numeric(Data$enginetype=="dohcv")
Data$enginetype_l<-as.numeric(Data$enginetype=="l")
Data$enginetype_ohc<-as.numeric(Data$enginetype=="ohc")
Data$enginetype_ohcf<-as.numeric(Data$enginetype=="ohcf")
Data$enginetype_ohcv<-as.numeric(Data$enginetype=="ohcv")
Data$enginetype_rotor<-as.numeric(Data$enginetype=="rotor")

Data$cylindernumber_eight<-as.numeric(Data$cylindernumber=="eight")
Data$cylindernumber_five<-as.numeric(Data$cylindernumber=="five")
Data$cylindernumber_four<-as.numeric(Data$cylindernumber=="four")
Data$cylindernumber_six<-as.numeric(Data$cylindernumber=="six")
Data$cylindernumber_three<-as.numeric(Data$cylindernumber=="three")
Data$cylindernumber_twelve<-as.numeric(Data$cylindernumber=="twelve")
Data$cylindernumber_two<-as.numeric(Data$cylindernumber=="two")

Data$fuelsystem_mpfi<-as.numeric(Data$fuelsystem=="mpfi")
Data$fuelsystem_2bbl<-as.numeric(Data$fuelsystem=="2bbl")
Data$fuelsystem_idi<-as.numeric(Data$fuelsystem=="idi")
Data$fuelsystem_1bbl<-as.numeric(Data$fuelsystem=="1bbl")
Data$fuelsystem_4bbl<-as.numeric(Data$fuelsystem=="4bbl")

#Checking the dummy variables
head(Data)
#removing the categorical columns
final_data <- Data[ -c(1,3,4,5,6,7,8,9,15,16,18) ]

set.seed(56952)

#lets check our final data

head(final_data)
#we first start with Univariate Analysis, outlier detection of independent variables using a box plot

par(mfrow=c(1,2))


#we first start with Univariate Analysis, outlier detection of independent variables using a box plot

par(mfrow=c(1,2))

bx = boxplot(final_data$symboling)

bx = boxplot(final_data$wheelbase)

quantile(final_data$wheelbase, seq(0,1,0.02))
final_data$wheelbase<-ifelse(final_data$wheelbase>114.2,114.2,final_data$wheelbase)

bx = boxplot(final_data$carlength)
quantile(final_data$carlength, seq(0,1,0.01))
final_data$carlength<-ifelse(final_data$carlength<144.816,144.816,final_data$carlength)

bx = boxplot(final_data$carwidth)
quantile(final_data$carwidth, seq(0,1,0.01))
final_data$carwidth<-ifelse(final_data$carwidth>70.852,70.852,final_data$carwidth)

bx = boxplot(final_data$carheight)
bx = boxplot(final_data$curbweight)

#--------------------
bx = boxplot(final_data$enginesize)
quantile(final_data$enginesize, seq(0,1,0.02))
final_data$enginesize<-ifelse(final_data$enginesize>209,209,final_data$enginesize)

bx = boxplot(final_data$boreratio)
bx = boxplot(final_data$stroke)

bx = boxplot(final_data$compressionratio)
bx$stats
quantile(final_data$compressionratio, seq(0,1,0.02))
final_data$compressionratio<-ifelse(final_data$compressionratio>22.35,22.35,final_data$compressionratio)
final_data$compressionratio<-ifelse(final_data$compressionratio<7.5,7.5,final_data$compressionratio)

bx = boxplot(final_data$horsepower)
quantile(final_data$horsepower, seq(0,1,0.02))
final_data$horsepower<-ifelse(final_data$horsepower>182,182,final_data$horsepower)

bx = boxplot(final_data$peakrpm)
quantile(final_data$peakrpm, seq(0,1,0.04))
final_data$peakrpm<-ifelse(final_data$peakrpm>6000,6000,final_data$peakrpm)

bx = boxplot(final_data$citympg)
quantile(final_data$citympg, seq(0,1,0.01))
final_data$citympg<-ifelse(final_data$citympg>44.72,44.72,final_data$citympg)

bx = boxplot(final_data$highwaympg)
quantile(final_data$highwaympg, seq(0,1,0.01))
final_data$highwaympg<-ifelse(final_data$highwaympg>46.92,46.92,final_data$highwaympg)

#now lets check the dependent variable

par(mfrow=c(1,2))

hist(final_data$price, main = 'Dependent')

#boxplot for the dependent 

boxplot(final_data$price)

library(car)

scatterplot(final_data$symboling,final_data$price)
scatterplot(final_data$wheelbase,final_data$price)

scatterplot(final_data$carlength,final_data$price)

scatterplot(final_data$carwidth,final_data$price)

scatterplot(final_data$carheight,final_data$price)

scatterplot(final_data$curbweight,final_data$price)

scatterplot(final_data$enginesize,final_data$price)
scatterplot(final_data$boreratio,final_data$price)

scatterplot(final_data$stroke,final_data$price)

scatterplot(final_data$compressionratio,final_data$price)

scatterplot(final_data$horsepower,final_data$price)
scatterplot(final_data$peakrpm,final_data$price)
scatterplot(final_data$citympg,final_data$price)
scatterplot(final_data$highwaympg,final_data$price)

cor(final_data)

final_data1<- lm(price~.,data=final_data)
vif(final_data1)

summary(final_data1)

final_data2 <- lm(price~ curbweight + stroke + compressionratio + carwidth + horsepower + peakrpm + fueltype_gas + carbody_hatchback + carbody_wagon + enginelocation_front +enginetype_dohc + enginetype_l + enginetype_ohc + enginetype_ohcf   + fuelsystem_mpfi + fuelsystem_2bbl + fuelsystem_1bbl,data = final_data)
summary(final_data2)
step(final_data2)
plot(final_data2)

#1 - Autocorrelation

durbinWatsonTest(final_data2)
#2 - Normality of errors

hist(residuals(final_data2))
#3 - Homoscedasticity

plot(final_data$price, residuals(final_data2))


#Checking the cook's distance
library(predictmeans)

cooksd=CookD(final_data2)
summary(final_data2)

# Create Training and Test data -
set.seed(100)  # setting seed to reproduce results of random sampling
0.7*nrow(final_data) #imp train data
0.3*nrow(final_data) #test data
t <- sample(1:nrow(final_data), 0.8*nrow(final_data))  # row indices for training data
trainingData <- final_data[t, ]  # model training data
testData  <- final_data[-t, ]   # test data
lmMod <- lm(price~ curbweight + stroke + compressionratio + carwidth + horsepower + peakrpm + fueltype_gas + carbody_hatchback + carbody_wagon + enginelocation_front +enginetype_dohc + enginetype_l + enginetype_ohc + enginetype_ohcf   + fuelsystem_mpfi + fuelsystem_2bbl + fuelsystem_1bbl, data=trainingData)
# build the model
pricePred <- predict(lmMod, testData)  # predict
summary(lmMod)
actuals_preds <- data.frame(cbind(actuals=testData$price, predicteds=pricePred))  # make actuals_predicteds dataframe.
correlation_accuracy <- cor(actuals_preds)
head(actuals_preds)

library(DMwR)
DMwR::regr.eval(actuals_preds$actuals, actuals_preds$predicteds)
predict(lmMod, data.frame(curbweight = 2548, stroke = 2.68, compressionratio = 9,carwidth=64.1,horsepower=111,peakrpm=5000,fueltype_gas = 1,carbody_hatchback=1,carbody_wagon=0,enginelocation_front=1,enginetype_dohc= 1,enginetype_l=1,enginetype_ohc=1,enginetype_ohcf=1,fuelsystem_mpfi = 1,fuelsystem_2bbl = 1,fuelsystem_1bbl = 1)) #impppppppppppppppppppppppppppp
trainingData$charges=predict(lmMod,newdata=trainingData,type = "response")

trainingData$price=predict(lmMod,newdata=trainingData,type = "response")
View(trainingData)
testData$price= predict(lmMod, testData, type="response")
View(testData)
AIC(final_data2)
AIC(lmMod)
BIC(final_data2)
BIC(lmMod)