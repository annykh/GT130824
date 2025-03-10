// Mysql
// Таблица

// MongoDB
// Коллекция

// Mysql
// Записи/данные/сторки

// MongoDB
// Документы



// MONGODB

// enter - Запуск кода
// shift+enter - Перенос сторки 

// Созаднине базы данных/активация базы данных 
// use db_name
use GT130824

// Создание коллекции
// db.createCollection('collection_name')
db.createCollection('users')

db.createCollection('products')

// Очистить скрипт/терминал
cls 

// Показать все базы данных 
show databases

// Показать все коллекции
show collections

// Удалить коллекцию
db.collection_name.drop()

// Удалить базу данных 
db.dropDatabase()


use GT130824
db.createCollection('users')

// // Добавить в коллекцию один документ
// db.collection_name.insertOne({Объект/Документ})

// // Добавить в коллекцию несколько документов(массив документов)
// db.collection_name.insertMany([{Объект}, {Объект}, ...])

db.users.insertOne({
	first_name: 'John', 
	last_name: 'Smith', 
	age: 25,
	email: 'jsmith@gmail.com'
})

db.users.insertMany([
    {
        first_name: 'Bob',
        last_name: 'Brown',
        age: 30,
        email: 'bbrown@gmail.com'
    },
    {
        first_name: 'Ben',
        last_name: 'King',
        age: 18,
        email: 'bking@gmail.com'
    },
    {
        first_name: 'Helen',
        last_name: 'Jameson',
        age: 27,
        email: 'hjameson@gmail.com'
    },
    {
        first_name: 'Jane',
        last_name: 'Thomson',
        age: 47,
        email: 'jthomas@gmail.com'
    }
])

// Вывод всех документов из коллекции
// db.collection_name.find()

db.users.find()

// insertOne и insertMany создают новую коллекцию (если ее нет) и заполняют документами

// Создать коллекцию fruits и заполнить документами со следующими свойствами: 
// title, price, count. Используйте следующие данные:

//  Apple 280 4
//  Lemon 300 8
//  Lime 500 3
//  Orange 200 8

db.fruits.insertMany([
    {
        title: 'Apple',
        price: 280,
        count: 4
    },
    {
        title: 'Lemon',
        price: 300,
        count: 8
    },
    {
        title: 'Lime',
        price: 500,
        count: 3
    },
    {
        title: 'Orange',
        price: 200,
        count: 8
    }
])
