## Loading Libraries 
library(tidyverse) 
library(Hmisc)
library(broom)
library(ggplot2)
library(corrplot)
library(dplyr)
library(MASS)
library(InformationValue)
library(rpart)
library(rpart.plot)
## Import Data 
churn_data <- read.csv('C://Users//neelg//Downloads//WA_Fn-UseC_-Telco-Customer-Churn.csv')
## Check Class of Data
sapply(churn_data,class)
## Finding and Removing Missing Values 
table(complete.cases(churn_data))
unique(unlist(lapply(churn_data,function(x) which(is.na(x)))))
churn_data <- na.omit(churn_data)
## Correlation of numerical variables
cor(churn_data[c(6,19,20)])
## Turning categorical variables into Binary Variables
churn_data$gender <- ifelse(churn_data$gender=='Male',1,0)
churn_data$Partner <- ifelse(churn_data$Partner=='Yes',1,0)
churn_data$Dependents <- ifelse(churn_data$Dependents=='Yes',1,0)
churn_data$PhoneService <- ifelse(churn_data$PhoneService=='Yes',1,0)
churn_data$MultipleLines <- ifelse(churn_data$MultipleLines=='Yes',1,0)
churn_data$InternetService <- ifelse(churn_data$InternetService=='DSL'|churn_data$InternetService=='Fiber optic',1,0)
churn_data$OnlineSecurity <- ifelse(churn_data$OnlineSecurity=='Yes',1,0)
churn_data$OnlineBackup <- ifelse(churn_data$OnlineBackup=='Yes',1,0)
churn_data$DeviceProtection <- ifelse(churn_data$DeviceProtection=='Yes',1,0)
churn_data$TechSupport <- ifelse(churn_data$TechSupport=='Yes',1,0)
churn_data$StreamingTV <- ifelse(churn_data$StreamingTV=='Yes',1,0)
churn_data$StreamingMovies <- ifelse(churn_data$StreamingMovies=='Yes',1,0)
churn_data$M2M <- ifelse(churn_data$Contract=='Month-to-month',1,0)
churn_data$OneYear <- ifelse(churn_data$Contract=='One year',1,0)
churn_data$PaperlessBilling <- ifelse(churn_data$PaperlessBilling=='Yes',1,0)
churn_data$ElectornicCheck <- ifelse(churn_data$PaymentMethod=='Electronic check',1,0)
churn_data$MailedCheck <- ifelse(churn_data$PaymentMethod=='Mailed check',1,0)
churn_data$BankTransfer <- ifelse(churn_data$PaymentMethod=='Bank transfer (automatic)',1,0)
churn_data$Churn <- ifelse(churn_data$Churn=='Yes',1,0)
churn_data$customerID <- NULL
churn_data$Contract <- NULL
churn_data$PaymentMethod <- NULL
## Chi-Squared Test 
chisquared <- lapply(churn_data[-length(churn_data)], function(x) chisq.test(table(x, churn_data$Churn)))
chisquared
## Turning variables into factor data-type
churn_data[c(1:4,6:15,18:23)]= lapply(churn_data[c(1:4,6:15,18:23)],factor)
## Spliting Data into training/test 
set.seed(1000)
dt = sort(sample(nrow(churn_data),nrow(churn_data)*.7))
train <- churn_data[dt,]
test<-churn_data[-dt,]
## Builing Logisitic Regression Models
model <- glm(Churn~SeniorCitizen+Partner+Dependents+tenure+InternetService+OnlineSecurity+TechSupport+M2M+ElectornicCheck+MonthlyCharges+PaperlessBilling+OneYear,data=train,family=binomial(link='logit'))
summary(model)
model2 <- glm(Churn~SeniorCitizen+Dependents+tenure+InternetService+OnlineSecurity+TechSupport+M2M+ElectornicCheck+MonthlyCharges+PaperlessBilling+OneYear,data=train,family=binomial(link='logit'))
summary(model2)
## Predicting test data using Logistic Regression Model 
probabilities <- predict(model2,test,type="response")
plotROC(test$Churn,probabilities)
confusionMatrix(test$Churn,probabilities,0.5)
# Builing a Decision-Tree Model
tree <- rpart(Churn~., data=train, cp=.02)
rpart.plot(tree, box.palette="RdBu", shadow.col="gray", nn=TRUE)
# Predicting Test data using Decision Tree Model
probs <- predict(tree,test,type='class')
table(probs,test$Churn)