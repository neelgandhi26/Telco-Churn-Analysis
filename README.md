# Telco Churn Analysis: Project Overview

## Objective
- Find features that impact Churn in the Telco Industry
- Predict if a customer is likely to churn or not based on given features
## Data Cleaning
- Imputed missing values using mean and mode
- Removed Noise variable (CustomerID)
## Exploratory Data Analysis 
![alt text](https://github.com/neelgandhi26/Telco-Churn-Prediction/blob/master/SeniorCitizen.png) 
![alt text](https://github.com/neelgandhi26/Telco-Churn-Prediction/blob/master/InternetService.png)
![alt text](https://github.com/neelgandhi26/Telco-Churn-Prediction/blob/master/OnlineSecurity.png)
![alt text](https://github.com/neelgandhi26/Telco-Churn-Prediction/blob/master/PaperlessBilling.png)
![alt text](https://github.com/neelgandhi26/Telco-Churn-Prediction/blob/master/StreamingTV.png)
![alt text](https://github.com/neelgandhi26/Telco-Churn-Prediction/blob/master/StreamingMovies.png)
![alt text](https://github.com/neelgandhi26/Telco-Churn-Prediction/blob/master/OnlineBackup.png)
![alt text](https://github.com/neelgandhi26/Telco-Churn-Prediction/blob/master/TechSupport.png)
![alt text](https://github.com/neelgandhi26/Telco-Churn-Prediction/blob/master/DeviceProtection.png)
![alt text](https://github.com/neelgandhi26/Telco-Churn-Prediction/blob/master/Contract.png)
## Model Building
First, I created two dataset, one with all independent variables (x) and one with the dependent variable (y). Then both dataset were split into training and test datasets using train_test_split in Sklearn. Next, I scaled the data using MinMaxScaler. Finally, I built various classifiers to predict if a customer was likely to churn or not. 

#Classifers Used:
-KNN
-SVM
-Logisitc Regression
-Decision Tree
-Bagging
-Boosting
-Neural Network
## Model Performance
The accuracy of the logistic regression and decision tree models are fairly similar, but the logisitic regression is a bit better.
### Logistic Regression:
- Accuracy: 81.62%
- AUC: 86.37%

![alt text](https://github.com/neelgandhi26/Telco-Churn-Analysis/blob/master/ROC_Curve.png)
### Decision Tree
- Accuracy: 79.85%
![alt text](https://github.com/neelgandhi26/Telco-Churn-Analysis/blob/master/decision_tree.png)
