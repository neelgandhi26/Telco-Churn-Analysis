# Telco Churn Analysis: Project Overview

## Objective
- Find features that impact Churn in the Telco Industry
- Predict if a customer is likely to churn or not based on given features
## Data Cleaning
- Imputed missing values
- Removed Noise variable (CustomerID)
## Exploratory Data Analysis 
![alt text](https://github.com/neelgandhi26/Telco-Churn-Prediction/blob/master/EDA1.PNG)
![alt text](https://github.com/neelgandhi26/Telco-Churn-Analysis/blob/master/Contract_Plot.png)
![alt text](https://github.com/neelgandhi26/Telco-Churn-Analysis/blob/master/InternetService_Plot.png)
![alt text](https://github.com/neelgandhi26/Telco-Churn-Analysis/blob/master/OnlineSecurity_Plot.png)
![alt text](https://github.com/neelgandhi26/Telco-Churn-Analysis/blob/master/TechSupport_Plot.png)
![alt text](https://github.com/neelgandhi26/Telco-Churn-Analysis/blob/master/Corrplot.png)
![alt text](https://github.com/neelgandhi26/Telco-Churn-Analysis/blob/master/Scatterplot.png)
## Model Building
First, I split the data into train/test set with a 80/20 split.Next, I trained a logisitic regression and decision tree models using the caret and rpart packages.
## Model Performance
The accuracy of the logistic regression and decision tree models are fairly similar, but the logisitic regression is a bit better.
### Logistic Regression:
- Accuracy: 81.62%
- AUC: 86.37%

![alt text](https://github.com/neelgandhi26/Telco-Churn-Analysis/blob/master/ROC_Curve.png)
### Decision Tree
- Accuracy: 79.85%
![alt text](https://github.com/neelgandhi26/Telco-Churn-Analysis/blob/master/decision_tree.png)
