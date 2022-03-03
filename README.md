# CIND820
CIND820 Capstone Project 
Current files: 

featExtraction.sql  - The file used to pull features from the raw dataset over a series of queries. Includes brief explinations in the script.
berka.mwb   -   Extracted database I put together using the 8 raw csv files from the link in paper (Reference 1).
finData.csv   -   The table of features put together from the querries in featExtraction.sql - This will be loaded to python. 
district69.sql    -   When joining the extracted features it was found that 8 rows had NULL records in the demographic related features (total_inhabitants,
                      avg_unemp_rt, avg_crime_rt, avg_salary). This file is me exploring this issue and discovering that all 8 records belong to district 69 
                      which does not contain any information within the district table. As there is no basis to make any assumptions for how to make accurate 
                      or fair imputations, and the percentage of records is small compared to the sample, they were excluded from the final version of 
                      finData.csv.
                    
