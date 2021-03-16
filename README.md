# Telco Churn Analysis: Project Overview

## Objective
- Find features that impact Churn in the Telco Industry
- Predict if a customer is likely to churn or not based on given features
## Data Cleaning
- Imputed missing values using mean and mode
- Removed Noise variables
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
First, I created two dataset, one with all independent variables (x) and one with the dependent variable (y). Then both dataset were split into training and test datasets using train_test_split in Sklearn. Next, I scaled the data using MinMaxScaler. Finally, I built various classifiers to predict if a customer was likely to churn or not. I also performed Hyper-parameter tuning to increase precision of the classifer.

### Classifers Used:
- KNN
- SVM
- Logisitc Regression
- Decision Tree
- Bagging
- Gradient Boosting
- AdaBoost with Logistic Regression
## Model Performance
The metric used to determine the best model was precision. 
### KNN:
- Precision: 0.56
![alt text](https://github.com/neelgandhi26/Telco-Churn-Prediction/blob/master/KNN.png)
### SVM
- Precision: 0.72
- Type of SVM: RBF
### Logistic Regression
- Precision: 0.65
![alt text](https://github.com/neelgandhi26/Telco-Churn-Prediction/blob/master/Logistic_Regression.png)
### Decision Tree
- Precison: 0.58
### Bagging
- Precision 0.63
- Type: Bagging using Random Forest
### Gradient Boosting
- Precision: 0.65
### AdaBoost with Logistic Regression
- Precision: 0.63
## Features that Impact Customer Churn
![alt text](https://github.com/neelgandhi26/Telco-Churn-Prediction/blob/master/Feature_Importance.png)

