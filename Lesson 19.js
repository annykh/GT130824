// use db_name

// db.createCollection('new_collection')

// db.collection_name.insertOne({})
// db.collection_name.insertMany([{}, {}, ...])

// db.collection_name.find({Условие}, {Проекция/Пагинация массива})

// db.collection_name.find().skip()
// db.collection_name.find().limit()
// db.collection_name.find().sort()

// db.collection_name.replaceOne(filter, update, [options])

// db.collection_name.updateOne()
// db.collection_name.updateMany()



// Удаление данных/документов

// db.collection_name.deleteOne({Условие}) - удаляет один документ
// db.collection_name.deleteMany({Условие}) - удаляет несколько документов

// use GT130824
// https://github.com/annykh/GT130824/blob/main/workers.txt


// Удалить сотрудника с именем Inga.
db.workers.deleteOne({firstname: 'Inga'})

// Удалить сотрудников, которым меньше 30.
db.workers.deleteMany({age: {$lt: 30}})

// Удалить все документы из коллекции
db.workers.deleteMany({})

// Удалить коллекцию workers
db.workers.drop()

// Удалить коллекцию staff
db.staff.drop()


// https://github.com/annykh/GT130824/blob/main/staff.txt

// Агрегация

// Кол/во документов в коллекции
// db.collection_name.countDocuments()
// db.collection_name.find().count()

// Вывести кол/во докумнетов в коллекции staff
db.staff.countDocuments()
db.staff.find().count()

// Вывести кол/во сотрудников из департамента IT
db.staff.find({department: 'IT'}).count()

// Вывести кол/во сотурдников, которым больше 30.
db.staff.find({age: {$gt: 30}}).count()


// Функция distinct 

// Вывести названия департаментов всех сотрудников
db.staff.find({}, {department: 1, _id: 0})

// Вывети список департманетов (без дубликатов)
db.staff.distinct('department')


// Функция aggregate

// db.collection_name.aggregate([Операторы функции aggregate])

// Операторы функции aggregate:

// $match - Фильтрация/условие
// $project - Проекция(поля, которые нужно вывести)
// $skip - Пагинация(кол/во документов, которое нужно пропусить)
// $limit - Пагинация(кол/во документов, которое нужно вывести)
// $sort - Сортировка
// $group - Группировка

// Агрегатные операторы
// $sum
// $avg
// $min
// $max

// db.collection_name.aggregate([
//     {$match: {Условие}},
//     {$project: {Проекция}}, //поле1: 1, поле2: 0
//     {$sort: {Сортировка}}, // поле1: 1/-1
//     {$skip: {Пагинация}}, // кол/во
//     {$limit: {Пагинация}}, // кол/во
//     {$group: {_id: null(если нет группировки)/'$поле'(поле группировки), имя_агрегатного_поля: {агрегатный_оператор: '$поле'}}}
// ])

// _id и имя_агрегатного_поля - новые поля, где в _id хранится null, если нет группировки,
// или УНИКАЛЬНЫЕ значения поля '$поле', если есть группировка по этому полю. А 'имя_агрегатного_поля' это название нового поля, в котором храним значения агрегатной функции.

// https://github.com/annykh/GT130824/blob/main/workers2.txt

// Найти сумму зарплат всех сотрудников.
db.workers2.aggregate([
    {$group: {_id: null, total_sum: {$sum: '$salary'}}}
])

// mysql
// select sum(salary) as total_sum
// from workers2;

// Найти среднюю зарплату в компании.
db.workers2.aggregate([
    {$group: {_id: null, avg_salary: {$avg: '$salary'}}}
])

// mysql
// select avg(salary) as avg_salary
// from workers2;

// Найти сумму зарлат сотрудников, которым больше 30.
db.workers2.aggregate([
    {$match: {age: {$gt: 30}}},
    {$group: {_id: null, total_sum: {$sum: '$salary'}}}
])

// mysql
// select sum(salary) as total_sum
// from workers2
// where age > 30;

// Найти суммы зарплат по должностям(position)
db.workers2.aggregate([
    {$group: {_id: '$position', total_sum: {$sum: '$salary'}}}
])

// mysql
// select position as _id, sum(salary) as total_sum
// from workers2
// group by position;

// Найти суммы зарплат по должностям сотрудников, которым больше 30.
db.workers2.aggregate([
    {$match: {age: {$gt: 30}}},
    {$group: {_id: '$position', total_sum: {$sum: '$salary'}}}
])

// mysql
// select position as _id, sum(salary) as total_sum
// from workers2
// where age > 30
// group by position;


// 1. Найти средние зарплаты по должностям.
db.workers2.aggregate([
    {$group: {_id: '$position', avg_salary: {$avg: '$salary'}}}
])

// 2. Найти средний возраст среди всех сотрудников.
db.workers2.aggregate([
    {$group: {_id: null, avg_age: {$avg: '$age'}}}
])

// 3. Найти сумму зарплат сотрудников, которые получают меньше 5000.
db.workers2.aggregate([
    {$match: {salary: {$lt: 5000}}},
    {$group: {_id: null, total_sum: {$sum: '$salary'}}}
])


// Найти суммы зарплат по должностям. Вывести только те, где сумма больше 5000.
db.workers2.aggregate([
    {$group: {_id: '$position', total_sum: {$sum: '$salary'}}},
    {$match: {total_sum: {$gt: 5000}}}
])

// mysql
// select position, sum(salary) as total_sum
// from workers2
// group by position
// having total_sum > 5000;

// Найти суммы зарплат по должностям. Отсортировать по возрастанию сумм.
db.workers2.aggregate([
    {$group: {_id: '$position', total_sum: {$sum: '$salary'}}},
    {$sort: {total_sum: 1}}
])

// mysql
// select position, sum(salary) as total_sum
// from workers2
// group by position
// order by total_sum asc;


// Найти максимальную зарплату среди всех сотрудников.
db.workers2.aggregate([
    {$group: {_id: null, max_salary: {$max: '$salary'}}}
])

// Найти минимальные зарплаты по должностям.
db.workers2.aggregate([
    {$group: {_id: '$position', min_salary: {$min: '$salary'}}}
])


// Найти максимальную зарплату среди сотрудников старше 30 лет.
db.workers2.aggregate([
    {$match: {age: {$gt: 30}}},
    {$group: {_id: null, max_salary: {$max: '$salary'}}}
])

// Найти максимальные зарплаты по должностям. Отсортировать по убыванию максимальных зарплат.
db.workers2.aggregate([
    {$group: {_id: '$position', max_salary: {$max: '$salary'}}},
    {$sort: {max_salary: -1}}
])

// Найти минимальные зарплаты по должностям. Вывести те, где минимальные зарплаты меньше 3000.
db.workers2.aggregate([
    {$group: {_id: '$position', min_salary: {$min: '$salary'}}},
    {$match: {min_salary: {$lt: 3000}}}
])


// Найти кол/во сотрудников с помощью aggregate и дать полю название workers_count.
db.workers2.aggregate([
    {$count: 'workers_count'}
])

// Найти кол/во сотрудников, которые получают больше 5000.
db.workers2.aggregate([
    {$match: {salary: {$gt: 5000}}},
    {$count: 'high_salary_workers_count'}
])

// Найти кол/во сотрудников по должностям.
db.workers2.aggregate([
    {$group: {_id: '$position', workers_count: {$sum: 1}}}
])

// {$sum: 1} - заменяет функцию count


// Посчитать, сколько работников с одинаковыми именами (firstname)
db.workers2.aggregate([
    {$group: {_id: '$firstname', names_count: {$sum: 1}}}
])
