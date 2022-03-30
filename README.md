# CIND820

CIND820 Capstone Project Current files:

*** EACH FILE IN THE REPO HAS A KEY AT THE START OF ITS FILE NAME ***


DATA: Collection of files where the data was collected from MySQL dbq.
    
    district69.sql - When joining the extracted features it was found that 8 rows had NULL records in the demographic related features 
    (total_inhabitants, avg_unemp_rt, avg_crime_rt, avg_salary). This file is me exploring this issue and discovering that all 8 records belong
    to district 69 which does not contain any information within the district table. As there is no basis to make any assumptions for how to make 
    accurate or fair imputations, and the percentage of records is small compared to the sample, they were excluded from the final version of finData.csv.
    
    featExtraction.sql - The file used to pull features from the raw dataset over a series of queries. Includes brief explinations in the script. 

    finData.csv - The table of features put together from the querries in featExtraction.sql - This will be loaded to python. 

INITIAL CODE: Collection of notebooks where EDA, initial preprocessing, and initial model results took place. 

    berka_cleaned.csv - The dataframe from preprocessing notebook exported to .csv. Models will be run on this file imported to python notebooks. 

    niafrate - 820(EDA).ipynb - Exploritory data analysis of finData. Visualizations for each variable.
    
    niafrate 820 - (RF).ipynb - First run of RF classifier on berka_cleaned.csv, with and without SMOTE applied.
    
    niafrate 820 - (SVM).ipynb - First run of SVM classifier on berka_cleaned.csv, with and without SMOTE applied. 

    niafrate 820 - data preprocessing.ipynb - Cleaning up some features, encoding qualitative attributes, correlation matrix and plot. Exported the altered dataframe
                                            to .csv on local drive to make it easier for modeling. 
                                            
FINAL CODE: Collection of notebooks where changes based on instructor feedback were implemented, and model tuning is applied.

* Changes include:  - Implementation of pipeline for each model type (K-Fold Cross Validation, One-hot Encoding, Standard Scalar, SMOTE)
                    - GridSearch for Hyperparameter tuning
                    - Updated Preprocessing file to extract ready to use .csv
                    - Updated version of berka_cleaned.csv

**Please note that for this section each model will have a separate notebook with and without SMOTE, 
           
    DT(Tuned v.1).ipynb - Updated decision tree model with pipeline applied
    
    DT-SMOTE(Tuned v.1).ipynb - Updated decision tree model with pipeline applied with SMOTE
    
    RF(Tuned v.1).ipynb - Updated random forest model with pipeline applied
    
    RF-SMOTE(Tuned v.1).ipynb - Updated forest model with pipeline applied with SMOTE
    
    SVM(Tuned v.1).ipynb - Updated SVM model with pipeline applied
    
    SVM-SMOTE(Tuned v.1).ipynb - Updated SVM model with pipeline applied with SMOTE
    
    berka_cleaned.csv - Updated output file from pre-processing. All models in "FINAL CODE" section were run on this data
    
    niafrate - 820 (Preprocessing) - Updated preprocessing notebook to include one-hot encoding on binary features
