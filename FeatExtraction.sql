#Feature extraction: 

#account_id, amount, duration, payments, status, frequency, loan_date, account_date, date_diff(days between account open and loan issue)

select loan.account_id, 
amount, 
duration, 
payments, 
loan.date as loan_date, 
status, 
account.frequency, 
account.date as account_date,
DATEDIFF(loan.date, account.date) AS date_diff
from loan
left join account on account.account_id = loan.account_id;
#pulled to excel

#card_type

# First check the Number of cards on account to see if any have multiple: No the max number for our records is 1.
select loan.account_id, count(card.card_id) as cards_on_account
from loan
join disp on disp.account_id = loan.account_id
left join card on disp.disp_id = card.disp_id
group by loan.account_id;

#I am assuming that if an account has 1 credit card it will belong to the account owner. 
select loan.account_id, card.type as card_type
from loan
join disp on disp.account_id = loan.account_id
left join card on disp.disp_id = card.disp_id
where disp.type = 'OWNER'; #pulled this query

#Check assumption  
select loan.account_id, count(card.card_id) as cards_on_account
from loan
join disp on disp.account_id = loan.account_id
left join card on disp.disp_id = card.disp_id
group by loan.account_id
having count(card.card_id) != 0; #returned 170 records

#check assumption
select loan.account_id, card.type as card_type, status
from loan
join disp on disp.account_id = loan.account_id
left join card on disp.disp_id = card.disp_id
where disp.type = 'OWNER'
and card.type is not null; #returned 170 records 

#This checks out, so I can pull the card type query to excel and merge to previous data using account_id as index

#no_orders, avg_order
select account_id, count(order_id) as no_orders, round(AVG(amount),2) as avg_order
from pay_order 
group by account_id
having account_id in(
select account_id from loan);
#Pull to excel

#avg_trans, avg_bal, no_of_trans

select account_id, avg(amount) as avg_trans, avg(balance) as avg_bal, count(trans_id) as no_of_trans
from trans
group by account_id
having account_id in(
select account_id from loan);
#pull to excel


#Account district demographics
#total_inhabitants
#avg_unemp_rt
#avg_crime_rt
#avg_salary

select account.account_id,
district.A4 as total_inhabitants,
round((district.A12 + district.A13)/2,3) as avg_unemp_rt,
round(((district.A15 + district.A16)/2)/district.A4,3) as avg_crime_rt,
district.A11 as avg_salary
from account 
left join district on 
account.district_id = district.district_id
where account_id in (select account_id as account_id from loan);


#Owner Information
#owner_age
#gender
#account_owner_district 

select loan.account_id, round((DATEDIFF(loan.date, client.birth_number))/365) as age_at_loan, client.gender
from loan
join disp on disp.account_id = loan.account_id
left join client on client.client_id = disp.client_id
where disp.type = 'OWNER';
#pull to excel

select account.account_id, account.district_id as account_district, client.district_id as client_district
from account
left join disp on disp.account_id = account.account_id
left join client on disp.client_id = client.client_id
where account.account_id in(select account_id from loan)
and disp.type = "OWNER";
#pull to excel and create #account_owner_district where
# 0 = No, the district is not the same, 1 = yes, the district is the same

#Will merge all of these onto 1 excel sheet to then load to python

