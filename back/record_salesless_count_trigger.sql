delimiter ||  
drop trigger if exists record_salesless_count_trigger||  
create trigger record_salesless_count_trigger after INSERT on table_sales_cashless for each row
begin  
        
        insert into table_record_count(client_id,client_name,sales_date,machine_id,pay_interface,trade_status,trade_amount,reality_sale_number,service_charge)
		(SELECT c.client_id,c.client_name, a.sales_date,a.machine_id,a.pay_interface,a.trade_status, a.trade_amount,a.reality_sale_number,a.service_charge
			FROM table_sales_cashless a 
			LEFT JOIN table_machine b ON a.machine_id = b.machine_id 
			LEFT JOIN table_client c ON b.client_id = c.client_id WHERE a.trade_no=new.trade_no);
end||  
delimiter;