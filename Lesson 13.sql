-- Работа с датой и временем

-- yyyy-mm-dd
-- yyyy-m-dd
-- yy-m-dd

-- hh:mm:ss

-- DATE: хранит даты с 1 января 1000 года до 31 деабря 9999 года (c "1000-01-01" до "9999-12-31").
-- По умолчанию для хранения используется формат yyyy-mm-dd. Занимает 3 байта.

-- TIME: хранит время от -838:59:59 до 838:59:59. По умолчанию для хранения времени применяется формат "hh:mm:ss". 
-- Занимает 3 байта.

-- DATETIME: объединяет время и дату, диапазон дат и времени - с 1 января 1000 года по 31 декабря 9999 года 
-- (с "1000-01-01 00:00:00" до "9999-12-31 23:59:59"). Для хранения по умолчанию используется формат "yyyy-mm-dd hh:mm:ss". 
-- Занимает 8 байт

-- TIMESTAMP: также хранит дату и время, но в другом диапазоне: от "1970-01-01 00:00:01" UTC до "2038-01-19 03:14:07" UTC.
--  Занимает 4 байта

-- YEAR: хранит год в виде 4 цифр. Диапазон доступных значений от 1901 до 2155. Занимает 1 байт.

-- create table test_table1(
-- 	id int primary key auto_increment,
--     full_name varchar(128),
--     hire_date date
-- );

-- Функции для работы с датой и временем

-- текущая дата и время
select now();
select sysdate();
select current_timestamp();

-- текущая дата
select curdate();
select current_date();

-- текущее время
select curtime();
select current_time();

-- Парсинг даты и времени

-- '2024-08-25'

select dayofmonth('2024-08-25'); -- возвращает день месяца в виде числового значения
select dayofweek('2024-08-25'); -- возвращает день недели в виде числового значения (1 - sunday)
select dayofyear('2024-08-25'); -- возвращает номер дня в году
select dayofmonth(curdate());

-- https://github.com/annykh/GT210524-260324/blob/main/employees_wd.sql

-- Вывести тех сотрудников, которых приняли на работу 23 числа.
select * 
from employees
where dayofmonth(hire_date) = 23;

select first_name, last_name, hire_date, dayofmonth(hire_date)
from employees;

select month('2024-08-25'); -- возвращает месяц даты

-- Вывести сотрудников, которых приняли на работу в августе
select *
from employees
where month(hire_date) = 8;

select year('2024-08-25'); -- возвращает год из даты

-- WEEK(date [, first]) возвращает номер недели года. Необязательный параметр позволяет задать стартовый день недели. 
-- Если этот параметр равен 1, то первым днем считается понедельник, иначе воскресенье
select week('2024-05-25'); -- 20
select week('2024-05-25', 1); -- 21

select dayname('2024-08-25'); -- возвращает название дня недели

select monthname('2024-08-25'); -- возвращает название месяца

-- Вывести сотрудников, которых приняли на работу в августе
select *
from employees
where monthname(hire_date) = 'August';

select hour('10:34:26'); -- возвращает час времени
select minute('10:34:26'); -- возвращает минуту времени
select second('10:34:26'); -- возвращает секунду времени


-- Функция EXTRACT извлекает из даты и времени какой-то определенный компонент.
-- extract(param from datetime/timestamp)

-- Значения param:
 
-- SECOND (секунды)
-- MINUTE (минуты)
-- HOUR (час)
-- DAY (день)
-- MONTH (месяц)
-- YEAR (год)
-- MINUTE_SECOND (минуты и секунды)
-- HOUR_MINUTE (часы и минуты)
-- DAY_HOUR (день и часы)
-- YEAR_MONTH (год и месяц)
-- HOUR_SECOND (часы, минуты и секунды)
-- DAY_MINUTE (день, часы и минуты)
-- DAY_SECOND (день, часы, минуты и секунды)

select extract(day from '2024-05-25 10:54:20'); -- 25
select extract(day_hour from '2024-05-25 10:54:20'); -- 2510

-- Вывести день и часы формате 'dd hh'
select concat(left(extract(day_hour from '2024-05-25 10:54:20'), 2), ' ', right(extract(day_hour from '2024-05-25 10:54:20'), 2));

-- Вывести из даты день, месяц и год в формате 'dd mm yyyy'
select concat_ws(' ', extract(day from '2024-05-25 10:54:20'), extract(month from '2024-05-25 10:54:20'), extract(year from '2024-05-25 10:54:20'));

-- Форматирование дат и времени

-- date_format(date/datetime, format) -- возвращает объект DATE или DATETIME, отформатированный с помощью шаблона format
-- time_format(time/datetime, format) -- возвращает объект TIME или DATETIME, отформатированный с помощью шаблона format

-- Значеиня format:
	-- %m: месяц 01-12
	-- %c: месяц 1-12
    -- %M: название месяца(January...December)
    -- %b: аббревиатура месяца (Jan..Dec)
    
    -- %d: день месяца 01..31
    -- %e: день месяца 1...31
    -- %D: номер дня месаца (1st, 2nd, 3rd...)
    
    -- %y: год в виде двух цифр yy
    -- %Y: год в виде четырех цифр yyyy
    
    -- %W: название дня недели(Sunday...Saturday)
    -- %a: аббревиатура дня недели(Sun..Sat)
    
    -- %H: час 00..23
	-- %k: час 0..23
    -- %h: час 01..12
    -- %l: час  1..12
    -- %p: AM/PM

	-- %i: минуты 00..59
    -- %S: секунды 00..59
    
    -- %r: время в 12-ти часавом формате (hh:mm:ss AM/PM)
    -- %T: время в 12-ти часавом формате (hh:mm:ss)


-- yyyy-mm-dd -> dd mm yy    
select date_format('2024-05-25', '%d %m %y');

-- yyyy-mm-dd -> Day - dd, Month - mm, Year - yyyy
select date_format('2024-05-25', 'Day - %d, Month - %m, Year - %Y');

-- Вывести имена и фамилии фотрудников, даты когда приняли на работу в формате 'dd - mm - yyyy'
select first_name, last_name, date_format(hire_date, '%d - %m - %Y') as hire_date
from employees;

-- hh:mm:ss -> h-mm-ss
select time_format('09:28:30', '%k-%i-%S');

-- hh:mm:ss - > hh:mm:ss AM/PM
select time_format('09:28:30', '%r');

-- str_to_date(string, format) - из сторки возвращает дату в формате yyyy-mm-dd
-- string - Строка, которая будет отформатирована до даты
-- format - Может быть одно или комбинация значений из списка данных format, которые соответствуют строке.

select str_to_date('February 20 2025', '%M %d %Y'); -- 2025-02-20
select str_to_date('2nd-Jan-2024', '%D-%b-%Y'); -- 2024-01-02

-- '1998 Nov 5' -> 5/11/98
select date_format(str_to_date('1998 Nov 5', '%Y %b %e'), '%e/%m/%y');

-- '23 August 99' -> yyyy-mm-dd
select str_to_date('23 August 99', '%d %M %y');

-- '23 August 99' -> dd mm yyyy
select date_format(str_to_date('23 August 99', '%d %M %y'), '%d %m %Y');

-- Вывести имена и фамилии сотрудников, которых приняли на работу в апреле 1998 года.
select first_name, last_name
from employees
where month(hire_date) = 4 and year(hire_date) = 1998;

select first_name, last_name, extract(year_month from hire_date)
from employees
where extract(year_month from hire_date) = 199804;

select first_name, last_name
from employees
where date_format(hire_date, '%c %Y') = '4 1998';

-- Вывести сотрудников, которых приняли на работу в интервале от 1 марта 1998 до 10 апреля 2001.
select first_name, last_name, hire_date
from employees
where hire_date between '1998-03-01' and '2001-04-10';

-- Вывести кол/во сотурников, которых приняли на работу 1997.
select count(employee_id)
from employees
where year(hire_date) = 1997;

-- Определить сколько сотрудников приняли на работу в каждый месяц 1998 года. Вывести название месяца и кол/во сотрудников.
select monthname(hire_date), count(employee_id)
from employees
where year(hire_date) = 1998
group by monthname(hire_date);
