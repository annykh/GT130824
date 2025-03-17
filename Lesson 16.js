// use GT130824

// https://github.com/annykh/GT130824/blob/main/emp.js
// db.emp.insertMany([
//     {
//       _id: 1,
//       firstname: 'Inga',
//       lastname: 'Petrova',
//       age: 27,
//       position: 'Barista',
//       salary: 1500,
//       skills: ['preparing drinks', 'cleaning equipment']
//     },
//     {
//       _id: 2,
//       firstname: 'Boris',
//       lastname: 'Orlov',
//       age: 36,
//       position: 'Server',
//       salary: 2400,
//       skills: ['taking orders', 'suggesting meals', 'taking payments']
//     },
//     {
//       _id: 3,
//       firstname: 'Ivan',
//       lastname: 'Demidov',
//       age: 32,
//       position: 'Chef',
//       salary: 3200,
//       skills: ['preparing food', 'baking bread']
//     },
//     {
//       _id: 4,
//       firstname: 'Marina',
//       lastname: 'Sidorov',
//       age: 22,
//       position: 'Hostess',
//       salary: 1700,
//       skills: ['greeting guests', 'seating guests', 'answering phone calls']
//     },
//     {
//       _id: 5,
//       firstname: 'Olga',
//       lastname: 'Ivanova',
//       age: 43,
//       position: 'Sommelier',
//       salary: 2500,
//       skills: ['curating a wine list', 'creating wine pairings']
//     }
//   ])


// Вывести все документы из коллекции
db.emp.find()

// select * from emp;

// Вывести документы по условию
// db.collection_name.find({Условие})

// select * from table_name
// where условие...


// Операторы сравнения

// $eq : значения равны - equal (column: value)
// $ne : значения не равны - not equal
// $gt : значение больше другого значения - greater than
// $gte : значение больше или равно другому значению - greater than equal
// $lt : значение меньше другого значения - less than
// $lte : значение меньше или равно другому значению - less than equal
// $in : значение соответствует одному из значений в массиве, {$in: [value1, value2, ...]}

// db.collection_name.find({поле: {$оператор: значение}})

// Вывести сотрудников где position 'Chef'
db.emp.find({position: 'Chef'})

db.emp.find({position: {$eq: 'Chef'}})

// Найти сотрудников, чьи зарлаты больше 2000
db.emp.find({salary: {$gt: 2000}})

db.emp.find({
    salary: 
    {
        $gt: 2000
    }
})

// Вывести сотрудников с именами Ivan, Olga, Boris
db.emp.find({firstname: {$in: ['Ivan', 'Olga', 'Boris']}})

// Вывести всех сотрудников, кроме Ivan-а.
db.emp.find({firstname: {$ne: 'Ivan'}})


// Логические операторы

// $and : возвращает документы, в которых выполняются оба условия
// $or : возвращает документы, в которых выполняется хотя бы одно условие
// $nor : возвращает документы, в которых оба условия не выполняются
// $not : возвращает документы, в которых условие не выполняется

// db.collection_name.find({$лог_оп: 
//     [
//         {условие1}, 
//         {условие2}, ...
//     ]
// })

// $лог_оп - логические операторы


// Вывести сотрудников, которым меньше 30 и больше 20.

db.emp.find({
    $and: [
        {age: {$gt: 20}},
        {age: {$lt: 30}}
    ]
})

db.emp.find({age: {$gt: 20, $lt: 30}})

// Вывести сотрудников, которым больше 20 и зарплата меньше 5000.
db.emp.find({
    $and: [
        {age: {$gt: 20}},
        {salary: {$lt: 5000}}
    ]
})

db.emp.find({
    age: {$gt: 20}, 
    salary: {$lt: 5000}
})

// Найти сотрудников, чьи зарплаты находятся в диапазоне от 2000(не вкл.) до 3000(вкл.).
db.emp.find({salary: {$gt: 2000, $lte: 3000}})

// Найти всех работников, чья зарплата меньше 3000 и имя либо Ivan либо Olga.
db.emp.find({
    salary: {$lt: 3000},
    firstname: {$in: ['Ivan', 'Olga']}
})

db.emp.find({
    $and: [
        {salary: {$lt: 3000}},
        {firstname: {$in: ['Ivan', 'Olga']}}
    ]
})

// Вывести сотрудников, которым либо больше 35, либо меньше 25.
db.emp.find({
    $or: [
        {age: {$gt: 35}},
        {age: {$lt: 25}}
    ]
})

// (-Infinity; 25) and (35; +Infinity)
// not [25; 35]

db.emp.find({age: 
    {$not: 
        {$gte: 25, $lte: 35}
    }
})


// Вывести сотрудников, которым не зарабатывают больше 3000 и position не Chef.
db.emp.find({
    $nor: [
        {salary: {$gt: 3000}},
        {position: 'Hostess'}
    ]
})

// Работа с вложенным масивом 

// Вывести сотрудников, у которых в навыках есть baking bread.
db.emp.find({skills: 'baking bread'})
db.emp.find({skills: {$eq: 'baking bread'}})

// Вывести сотрудников, у которых навык равен baking bread.
db.emp.find({skills: ['baking bread']})
db.emp.find({skills: {$eq: ['baking bread']}})

// Вывести сотрудников, у которых навык равен ['preparing food', 'baking bread'].
db.emp.find({skills: ['preparing food', 'baking bread']})

// Вывести сотрудников, у которых в навыках есть taking orders, taking payments или seating guests
db.emp.find({skills: {$in: ['taking orders', 'taking payments', 'seating guests']}})

db.emp.find({
    $or: [
        {skills: 'taking orders'},
        {skills: 'taking payments'},
        {skills: 'seating guests'}
    ]
})

// Вывести сотрудников, у которых навык равен либо ['curating a wine list', 'creating wine pairings'], либо ['taking orders', 'suggesting meals', 'taking payments']
db.emp.find({
    $or: [
        {skills: ['curating a wine list', 'creating wine pairings']},
        {skills: ['taking orders', 'suggesting meals', 'taking payments']}
    ]
})

db.emp.find({skills: 
    {$in: [
        ['curating a wine list', 'creating wine pairings'],
        ['taking orders', 'suggesting meals', 'taking payments']
    ]
}})

// Вывести сотрудников, у которых в навыках нет baking bread.
db.emp.find({skills: {$ne: 'baking bread'}})

db.emp.find({skills: {$not: {$eq: 'baking bread'}}})

// вывести сотрудников, у которых первый навык 'taking orders'.
db.emp.find({'skills.0': 'taking orders'})


// 'массив.индекс'


// Работа с вложенными объектами

// Пример документа

// {
//           _id: 5,
//           firstname: 'Olga',
//           lastname: 'Ivanova',
//           age: 43,
//           position: 'Sommelier',
//           salary: 2500,
//           skills: ['curating a wine list', 'creating wine pairings'],
//           company: {
//                 name: 'Modern art rest',
//                 country: 'USA' 
//             }
//         }

// 'объект.свойство'
// 'company.country'
// 'company.name'


// Проекция - вывод конкретных полей

// mysql
// select column1, column2
// from table_name;

// db.collection_name.find({Условие}, {Проекция})

// Проекция - {column_name: 1, column_name: 0}

// 1(true) - выводим поле
// 0(false) - не выводим поле

// Вывести только имена и фамилии сотрудников, которым больше 30.
db.emp.find({age: {$gt: 30}}, {firstname: 1, lastname: 1})
// Вывод - _id, firstname, lastname
// _id по умолчанию всегда выводится

db.emp.find({age: {$gt: 30}}, {firstname: 1, lastname: 1, _id: 0})

// Вывести все поля, кроме _id и skills сотрудников, которым больше 30.
db.emp.find({age: {$gt: 30}}, {_id: 0, skills: 0})

// Вывести имена, фамилии, возраст всех сотрудников.
db.emp.find({}, {firstname: 1, lastname: 1, age: 1, _id: 0})

//  Найти всех работников, чья зарплата больше 2000 и возраст больше 20. Вывести только имя, фамилию и зарплату, без _id.
db.emp.find({salary: {$gt: 2000}, age: {$gt: 20}}, {firstname: 1, lastname: 1, salary: 1, _id: 0})

// Вывести всю информацию о всех сотрудниках, кроме зарплаты.
db.emp.find({}, {salary: 0})

// Найти всех работников, чья зарплата меньше 3000 или возраст больше 40. Вывести все поля, кроме зарплаты и ИД
db.emp.find({
    $or:[
        {salary: {$lt: 3000}}, 
        {age: {$gt: 40}}
    ]
}, {salary: 0, _id: 0})
