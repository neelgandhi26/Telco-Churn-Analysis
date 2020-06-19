suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(caret))
suppressPackageStartupMessages(library(e1071))
suppressPackageStartupMessages(library(corrplot))
suppressPackageStartupMessages(library(caTools))
suppressPackageStartupMessages(library(rpart))
suppressPackageStartupMessages(library(rpart.plot))

df <- read.csv('C://Users//neelg//Downloads//WA_Fn-UseC_-Telco-Customer-Churn.csv')

dim(df)

colnames(df)

summary(df)

str(df)

df$customerID <- NULL

df$SeniorCitizen <- as.factor(df$SeniorCitizen)

sapply(df, function(x) sum(is.na(x)))

df[!complete.cases(df), ]

df <- na.omit(df)

percentData <- df %>% group_by(SeniorCitizen) %>% count(Churn) %>%
    mutate(ratio=scales::percent(n/sum(n)))
ggplot(df, aes(x = SeniorCitizen,fill=Churn)) +  
geom_bar(position='fill') +
 geom_text(data=percentData, aes(y=n,label=ratio),
              position=position_fill(vjust=0.5))

percentData <- df %>% group_by(Contract) %>% count(Churn) %>%
    mutate(ratio=scales::percent(n/sum(n)))
ggplot(df, aes(x = Contract,fill=Churn)) +  
geom_bar(position='fill') +
 geom_text(data=percentData, aes(y=n,label=ratio),
              position=position_fill(vjust=0.5))

percentData <- df %>% group_by(OnlineSecurity) %>% count(Churn) %>%
    mutate(ratio=scales::percent(n/sum(n)))
ggplot(df, aes(x = OnlineSecurity,fill=Churn)) +  
geom_bar(position='fill') +
 geom_text(data=percentData, aes(y=n,label=ratio),
              position=position_fill(vjust=0.5))

percentData <- df %>% group_by(InternetService) %>% count(Churn) %>%
    mutate(ratio=scales::percent(n/sum(n)))
ggplot(df, aes(x = InternetService,fill=Churn)) +  
geom_bar(position='fill') +
 geom_text(data=percentData, aes(y=n,label=ratio),
              position=position_fill(vjust=0.5))

percentData <- df %>% group_by(TechSupport) %>% count(Churn) %>%
    mutate(ratio=scales::percent(n/sum(n)))
ggplot(df, aes(x = TechSupport,fill=Churn)) +  
geom_bar(position='fill') +
 geom_text(data=percentData, aes(y=n,label=ratio),
              position=position_fill(vjust=0.5))

corrplot(cor(df[c(5,18,19)]), method = "color",tl.col="black", tl.cex=0.8, tl.srt=60)

ggplot(df, aes(x=tenure, y=TotalCharges)) +
geom_point()

chisquared <- lapply(df[-c(5,18,19,20)], function(x) chisq.test(table(x, df$Churn)))
chisquared

set.seed(430)
index = createDataPartition(df$Churn, p = 0.75, list = FALSE)
train = df[index,]
test = df[-index,]

model <- glm(Churn ~ ., family = "binomial", train)

pred<- predict(model, test,type='response')

pred_class <- ifelse(pred>0.5,'Yes','No')

confusionMatrix(as.factor(pred_class),test$Churn)

colAUC(pred, test$Churn, plotROC = TRUE)

tree <- rpart(Churn~., data=train, cp=.02)
rpart.plot(tree, box.palette="RdBu", shadow.col="gray", nn=TRUE)

predict_tree <- predict(tree,test,type='class')
table(predict_tree,test$Churn)

tree$variable.importance






