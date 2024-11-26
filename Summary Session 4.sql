-- TASKS

1. Создать и активировать базу данных new_tasks
2. В этой базе данных создать таблицу workers с полями:
 • id – целое число - первичный ключ с автозаполнением 
 • first_name - строка максимум 128 символов
 • last_name - строка максимум 128 символов
 • department - строка максимум 128 символов - не пустое
 • age - целое число - больше 18 
 • username - строка максимум 128 символов - уникальное значение
3. Заполнить таблицу workers следующими данными:
Сотрудник с именем John, фамилией Doe, отделом HR, возрастом 39 лет, и именем пользователя jdoe.
Сотрудник с именем Jane, фамилией Smith, отделом IT, возрастом 25 лет, и именем пользователя jsmith.
Сотрудник с именем Michael, фамилией Johnson, отделом Finance, возрастом 22 года, и именем пользователя mjohnson.
Сотрудник с именем Emily, фамилией Brown, отделом Marketing, возрастом 29 лет, и именем пользователя ebrown.
Сотрудник с именем Daniel, фамилией White, отделом Sales, возрастом 34 года, и именем пользователя dwhite.
4. Используя код, добавить еще данные в таблицу:
INSERT INTO workers (first_name, last_name, department, age, username)
VALUES 
    ('Sophia', 'Taylor', 'HR', 28, 'staylor'),
    ('Liam', 'Williams', 'IT', 30, 'lwilliams'),
    ('Olivia', 'Martinez', 'Finance', 26, 'omartinez'),
    ('Noah', 'Brown', 'Markketing', 32, 'nbrown'),
    ('Emma', 'Davis', 'Sales', 35, 'edavis'),
    ('James', 'Garcia', 'HR', 40, 'jgarcia'),
    ('Isabella', 'Hernandez', 'IT', 27, 'ihernandez'),
    ('Lucas', 'Lopez', 'Finance', 31, 'llopez'),
    ('Amelia', 'Wilson', 'Markketing', 29, 'awilson'),
    ('Mason', 'Moore', 'Sales', 33, 'mmoore'),
    ('Harper', 'Taylor', 'HR', 24, 'htaylor'),
    ('Ethan', 'Anderson', 'IT', 28, 'eanderson'),
    ('Mia', 'Thomas', 'Finance', 25, 'mthomas'),
    ('Alexander', 'Jackson', 'Marketing', 34, 'ajackson'),
    ('Charlotte', 'White', 'Sales', 36, 'cwhite'),
    ('Benjamin', 'Harris', 'HR', 29, 'bharris'),
    ('Evelyn', 'Martin', 'IT', 23, 'emartin'),
    ('Elijah', 'Clark', 'Finance', 32, 'eclark'),
    ('Avery', 'Rodriguez', 'Markketing', 28, 'arodriguez'),
    ('Scarlett', 'Lewis', 'Sales', 30, 'slewis');
5. Вывести всех сотрудников, чьи фамилии начинаются с буквы T.
6. Вывести сотрудников, возраст которых находится в диапазоне от 25 до 35 лет.
7. Найти сотрудников, работающих в департаментах "HR", "IT" или "Finance".
8. Вывести сотрудников, упорядочив их по имени в убывающем порядке.
9. Найти первых 5 сотрудников по возрастанию возраста.
10. Вывести имя и фамилию сотрудников, работающих в департаменте "Finance", и объединить их в один столбец full_name.
11. Добавить столбец salary с типом данных DECIMAL в таблицу workers.
12. Изменить тип данных столбца salary на INT.
13. Удалить столбец salary из таблицы workers.
14. Увеличить возраст всех сотрудников на 1 год.
15. Обновить департамент сотрудников, у которых департамент "Markketing", на "Marketing".
16. Установить имя сотрудника с id 1 в верхнем регистре.
17. Удалить всех сотрудников, чей возраст меньше 25 лет.
18. Удалить всех сотрудников из департамента "Marketing".
19. Удалить таблицу workers.
20. Удалить базу данных new_tasks.
  
