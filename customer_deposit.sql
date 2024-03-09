
create table cb_customer_deposits
(
id number generated always as identity primary key,
customer_id number,
deposit_product_id number,
contact_no varchar2(30),
deposit_amount number(22,2),
profit_amount number(22,2),
start_date date
);


create or replace procedure cb_customer_deposits_insert
(p_customer_id number,p_deposit_product_id number,p_contact_no varchar2,p_deposit_amount number,p_profit_amount number,
p_start_date date)
is 
begin
insert into  cb_customer_deposits (customer_id ,deposit_product_id ,contact_no ,deposit_amount ,profit_amount,
start_date)
values (p_customer_id ,p_deposit_product_id ,p_contact_no ,p_deposit_amount ,p_profit_amount ,
p_start_date );
commit;
end;

create or replace procedure cb_customer_deposits_update
(p_id number,p_customer_id number default null,p_deposit_product_id number default null,p_contact_no varchar2 default null
,p_deposit_amount number default null,p_profit_amount number default null,
p_start_date date default null) is
begin
update cb_customer_deposits
set 
customer_id=nvl(p_customer_id,customer_id),
deposit_product_id=nvl(p_deposit_product_id,deposit_product_id),
contact_no=nvl(p_contact_no,contact_no),
deposit_amount=nvl(p_deposit_amount,deposit_amount),
profit_amount=nvl(p_profit_amount,profit_amount),
start_date=nvl(p_start_date,start_date)
where id=p_id;
commit;
end;








