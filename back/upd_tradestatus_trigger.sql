delimiter ||  
drop trigger if exists upd_tradestatus||  
create trigger upd_tradestatus after update on table_sales_cashless for each row
begin  
  
 if (old.trade_status='1' and (new.trade_status='2' OR new.trade_status='4')) then
		set @clientId=(SELECT c.client_id
			FROM table_sales_cashless a 
				LEFT JOIN table_machine b ON a.machine_id = b.machine_id 
			LEFT JOIN table_client c ON b.client_id = c.client_id WHERE a.trade_no=new.trade_no);
				
		set @nowClientCount = (SELECT count(1) FROM table_total_money where client_id = @clientId);
		if @nowClientCount>0 THEN
			if new.pay_interface='微信' THEN
				update table_total_money set wx_account=(IFNULL(wx_account,0) + IFNULL(new.reality_sale_number,0)*new.trade_amount) where client_id=@clientId;
			elseif new.pay_interface='支付宝' THEN
				update table_total_money set ali_account=(IFNULL(ali_account,0)+IFNULL(new.reality_sale_number,0)*new.trade_amount) where client_id=@clientId;
			end if;
		elseif @nowClientCount=0 THEN 
			if new.pay_interface='微信' THEN
				INSERT INTO table_total_money(client_id,wx_account) VALUES(@clientId,IFNULL(new.reality_sale_number,0)*new.trade_amount);
			elseif new.pay_interface='支付宝' THEN
				INSERT INTO table_total_money(client_id,ali_account) VALUES(@clientId,IFNULL(new.reality_sale_number,0)*new.trade_amount);
			end if;
		 
		end if;

  end if;
  
end||  
delimiter;