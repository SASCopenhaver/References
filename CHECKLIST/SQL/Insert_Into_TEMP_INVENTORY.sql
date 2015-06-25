insert into temp_inventory
  (country, city, app_name, app_type)
(select  t1.e_country, t1.e_city, t1.e_comm_app, 'COMM'
from exist_inventory_from_excel t1
where 1 = (select Count(t3.e_city) from exist_inventory_from_excel t3 where t1.e_city = t3.e_city)
union
select  t2.e_country, t2.e_city, t2.e_cust_app, 'CUST'
from exist_inventory_from_excel t2
where 1 = (select Count(t4.e_city) from exist_inventory_from_excel t4 where t2.e_city = t4.e_city))


