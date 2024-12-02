use gt130824;

create table phones(
	id int primary key auto_increment,
    product_name varchar(128) not null,
    product_count int, 
    product_price int
);

insert into phones(product_name, product_count, product_price)
values ('iPhone 11', 4, 700), 
		('iPhone 11 pro', 10, 750),
        ('iPhone 11 pro max', 4, 800),
        ('iPhone 12 mini', 18, 800),
        ('iPhone 12', 10, 810),
        ('iPhone 12 pro', 0, 850),
        ('iPhone 12 pro max', 1, 900),
        ('iPhone 13', 16, 950),
        ('iPhone 13 pro', 0, 1000),
        ('iPhone 13 pro max', 1, 1100),
        ('iPhone 14', 13, 1200),
        ('iPhone 14 pro', 0, 1250),
        ('iPhone 14 pro max', 25, 1300);

select * from phones;

select product_name as title, product_price as price
from phones; 

-- Вывести поле product_name как title, посчитать и вывести общую сумму заказов 
-- (product_count * product_price) как total_sum

select product_name as title, product_count * product_price as total_sum
from phones;

-- Вывести поле product_name как title, 
-- посчитать и вывести общую сумму заказов 
-- Если product_count > 0 - (product_count * product_price) как total_sum
-- Если product_count = 0 - product_price как total_sum

-- select product_name as title, product_count * product_price as total_sum
-- from phones
-- where product_count > 0;

-- select product_name as title, product_price as total_sum
-- from phones
-- where product_count = 0;

-- Условные операторы(ветвление)
-- Функция CASE проверяет истинность набора условий и в зависимости от результата проверки может возвращать тот или иной результат. Эта функция принимает следующую форму:

-- case
-- 	when условие1 then действие/результат
--     when условие2 then действие/результат
--     when условие3 then действие/результат
--     ...
--     else альтернативный результат
-- end

-- Вывести поле product_name как title, 
-- посчитать и вывести общую сумму заказов 
-- Если product_count > 0 - (product_count * product_price) как total_sum
-- Если product_count = 0 - 'нет товара в наличии' как total_sum

select product_name as title, case
									when product_count > 0 then product_count * product_price
									when product_count = 0 then 'нет товара в наличии'
								end as total_sum
from phones;

-- Создать новое поле total_sum с типом varchar
-- Заполнить новое поле total_sum:
-- Если product_count > 0 - (product_count * product_price) как total_sum
-- Если product_count = 0 - 'нет товара в наличии' как total_sum

alter table phones
add column total_sum varchar(128);

select *
from phones;

set sql_safe_updates = 0;

update phones
set total_sum = case
					when product_count > 0 then product_count * product_price
					when product_count = 0 then 'нет товара в наличии'
				end;
                
select * from phones;

-- Вывести product_name, product_count, новое поле count_info, заполнить ее: 
-- Если Product_Count меньше/равно 2, count_info = 'Товар заканчивается',
-- Если Product_Count меньше/равно 5, count_info = 'Мало товара',
-- Если Product_Count меньше/равно 10, count_info = 'Есть в наличии',
-- В остальных случаях count_info ='Много товара';

select product_name, product_count, case
										when product_count <= 2 then 'Товар заканчивается'
										when product_count <= 5 then 'Мало товара'
										when product_count <= 10 then 'Есть в наличии'
										else 'Много товара'
									end as count_info
from phones;

-- Создать новое поле count_info, заполнить ее: 
-- Если Product_Count меньше/равно 2, category = 'Товар заканчивается',
-- Если Product_Count меньше/равно 5, category = 'Мало товара',
-- Если Product_Count меньше/равно 10, category = 'Есть в наличии',
-- В остальных случаях category ='Много товара';

alter table phones
add column count_info varchar(128);

update phones
set count_info = case
					when product_count <= 2 then 'Товар заканчивается'
					when product_count <= 5 then 'Мало товара'
					when product_count <= 10 then 'Есть в наличии'
					else 'Много товара'
				end;

select * from phones;

-- Переименовать поле product_price на starting_price
alter table phones
change product_price starting_price int;

-- Вывести product_name, starting_price и новое поле tax 
-- Заполнить поле tax:
-- Если начальная цена меньше/равно 700, tax = null,
-- если больше 700 и меньше 850, tax = 15,
-- если больше или равно 850, tax = 25

select product_name, starting_price, case 		
											when starting_price <= 700 then null
                                            when starting_price < 850 then 15
                                            when starting_price >= 850 then 25
										end as tax
from phones;

-- Создать новое поле tax целое число
-- Заполнить поле tax
-- Если начальная цена меньше/равно 700, tax = null,
-- если больше 700 и меньше 850, tax = 15,
-- если больше или равно 850, tax = 25

alter table phones
add column tax int;

update phones
set tax = case 		
				when starting_price <= 700 then null
				when starting_price < 850 then 15
                when starting_price >= 850 then 25
			end;
            
select * from phones;

-- Посчитать конечную цену и представить его как Final_price
-- final_price = (starting_price + starting_price * tax / 100)

select product_name, starting_price, tax, case 
												when tax is null then starting_price
												else round(starting_price + starting_price * tax / 100, 2)
											end as final_price
from phones;

-- Функция COALESCE принимает список значений и возвращает первое из них, 
-- которое не равно NULL:                  
-- coalesce(value1, value2, value3...)

-- coalesce(null, null, 0, null, 10) -- 0 
-- coalesce(null * 10, 10 * 10, null + 20 * 10) -- 100

 select product_name, starting_price, tax, coalesce(starting_price + starting_price * tax / 100, starting_price) as final_price
 from phones;
 

-- Создать поле final_price с типом decimal и заполнить:
-- если tax = null тогда starting_price
-- если tax != null тогда starting_price + starting_price * tax / 100
alter table phones
add column final_price decimal;

alter table phones
modify column final_price decimal(10, 2);
-- 10 общее кол/во цифр
-- 2 кол/во цифр поле точки

update phones
set final_price = coalesce(starting_price + starting_price * tax / 100, starting_price);

select * from phones;


create table users(
	id int primary key auto_increment,
    first_name varchar(128),
    last_name varchar(128),
    email varchar(128),
    phone varchar(128)
);

insert into users(first_name, last_name, email, phone)
values ('Tom', 'Smith', 'toms@gmail.com', null),
		('Bob', 'Brown', null, '+12345678'),
        ('John', 'Jameson', 'johnj@gmail.de', '+31246743'),
        ('Lola', 'Smith', null, null),
        ('Jane', 'Simpson', 'janes@gmail.com', null),
        ('Den', 'Brown', 'denb@gmail.de', '+31234534');

-- Вывести имена и фамилии пользоватлей, и поле send_message со значениями:
-- Если указан email, тогда send_message = email
-- Если email не указан, но указан phone, тогда send_message = phone
-- Если email и phone не указаны, тогда send_message = 'нет информации'

select first_name, last_name, case
								when email is not null then email
								when phone is not null then phone
								else 'нет информации'
							end as send_message
from users;

select first_name, last_name, coalesce(email, phone, 'нет информации') as send_message
from users;
