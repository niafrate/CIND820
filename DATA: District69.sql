#Figure out the district ID for accounts with null demographic features
select account_id, district_id from account where account_id = 10280;

#see the complete list of accounts with loans from district 69
select loan.account_id from loan 
join account on account.account_id = loan.account_id 
where account.district_id = 69;
#It matches 8 records in our finData table, so lets check the disctrict table for dis.69


select * from district 
where district_id = 69;
#There is no info on this district - so we can drop those these 8 rows since there is no 
#way basis to make any sort of assumptions for imputations. 

