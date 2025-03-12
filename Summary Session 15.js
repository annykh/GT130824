// use 

// db.createCollection('collection_name')

// db.collection_name.insertOne({
//     key: value,
//     key: value, ...
// })

// db.collection_name.insertMany([
//     {
//         key: value, 
//         key: value, ...
//     },
//     {
//         ...
//     }, 
//     {
//         ...
//     }
// ])

// db.collection_name.find()

// db.collection_name.drop()

// db.dropDatabase()

// show databases

// show collections

// cls

// db.fruits.insertMany([
//     {
//         id: 1,
//         title: 'Apple',
//     },
//     {
//         id: 2, 
//         title: 'Kiwi'
//     }
// ])

// db.fruits.insertMany([
//     {
//         _id: 3,
//         title: 'Orange',
//     },
//     {
//         _id: 4, 
//         title: 'Avocado'
//     }
// ])



// TASKS

// 1. В базе данных tasks создать пустую коллекцию employees.
use tasks
db.createCollection('employees')

// 2. Заполнить коллекцию свойствами firstname, lastname, age, position, salary, skills.
    // 1. Inga Petrova, 27, Barista, 1500, [’preparing drinks’, ‘cleaning equipment’] 
    // 2. Boris Orlov, 36, Server, 2400, [’taking orders’, ‘suggesting meals’, ‘taking payments’]
    // 3. Ivan Demidov, 32, Chef, 3200, [’preparing food’, ‘baking bread’]
    // 4. Marina Sidorova, 22, Hostess, 1700, [’greeting guests’, ‘seating guests’, ‘answering phone calls’]
    // 5. Olga Ivanova, 43, Sommelier, 2500, [’curating a wine list’, ‘creating wine pairings’]

    db.employees.insertMany([
        {
          firstname: "Inga",
          lastname: "Petrova",
          age: 27,
          position: "Barista",
          salary: 1500,
          skills: ["preparing drinks", "cleaning equipment"]
        },
        {
          firstname: "Boris",
          lastname: "Orlov",
          age: 36,
          position: "Server",
          salary: 2400,
          skills: ["taking orders", "suggesting meals", "taking payments"]
        },
        {
          firstname: "Ivan",
          lastname: "Demidov",
          age: 32,
          position: "Chef",
          salary: 3200,
          skills: ["preparing food", "baking bread"]
        },
        {
          firstname: "Marina",
          lastname: "Sidorova",
          age: 22,
          position: "Hostess",
          salary: 1700,
          skills: ["greeting guests", "seating guests", "answering phone calls"]
        },
        {
          firstname: "Olga",
          lastname: "Ivanova",
          age: 43,
          position: "Sommelier",
          salary: 2500,
          skills: ["curating a wine list", "creating wine pairings"]
        }
      ])

// 3. Вывести коллекцию employees.
db.employees.find()

// 4. Найти и исправить ошибку в коде:
//  db.employee.insertOne({
//           firstname: 'Lida',
//           lastname: 'Petrova',
//           age: 27,
//           salary: 1500,
//           skills: ['coding', 'team-working']) 

 db.employee.insertOne({
          firstname: 'Lida',
          lastname: 'Petrova',
          age: 27,
          salary: 1500,
          skills: ['coding', 'team-working']}) 

// 5. Найти и исправить ошибку в коде:
//  db.employee.insertMany([{
//           firstname: 'Lida',
//           lastname: 'Petrova',
//           age: 27,
//           salary: 1500,
//           skills: ['coding', 'team-working']]})

 db.employee.insertMany([{
          firstname: 'Lida',
          lastname: 'Petrova',
          age: 27,
          salary: 1500,
          skills: ['coding', 'team-working']
        }])

// 6. Найти и исправить ошибки в коде:
// db.students.insertMany([
// 	{
// 	     id: 1,
// 	     name: 'Amy,
// 	     avg_mark: 5		
// 	},
// 	{
// 	     id: 2,
// 	     name: 'Sam',
// 	     avg_mark: 3		
// 	}
// 	{
// 	     id: 3,
// 	     name: 'Ben'
// 	     avg_mark: 4.7		
// 	},
// 	{
// 	     id: 4,
// 	     name: 'Max',
// 	     avg_mark: 2		
// 	}
// ))


db.students.insertMany([
	{
	     id: 1,
	     name: 'Amy',
	     avg_mark: 5		
	},
	{
	     id: 2,
	     name: 'Sam',
	     avg_mark: 3		
	},
	{
	     id: 3,
	     name: 'Ben',
	     avg_mark: 4.7		
	},
	{
	     id: 4,
	     name: 'Max',
	     avg_mark: 2		
	}
])

// 7. Создать бд shop
use shop

// 8. Создать коллекцию products1 и заполнить документами (6 штук) со следующими свойствами (_id, title, price, count). Используйте следующие данные
  // 1 Велосипед 45000 12
  // 2 Самокат 1500 10
  // 3 Ролики 2000 20
  // 4 Лыжи 22000 15
  // 5 Скейт 19000 4
  // 6 Сноуборд 33000 17

  db.products1.insertMany([
    { _id: 1, title: "Велосипед", price: 45000, count: 12 },
    { _id: 2, title: "Самокат", price: 1500, count: 10 },
    { _id: 3, title: "Ролики", price: 2000, count: 20 },
    { _id: 4, title: "Лыжи", price: 22000, count: 15 },
    { _id: 5, title: "Скейт", price: 19000, count: 4 },
    { _id: 6, title: "Сноуборд", price: 33000, count: 17 }
  ])

// 9. Удалить коллекцию products1
db.products1.drop()

// 10. Удалить бд shop
db.dropDatabase()
