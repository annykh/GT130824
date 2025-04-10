// Удаление данных/документов

// db.collection_name.deleteOne({Условие}) - удаляет один документ
// db.collection_name.deleteMany({Условие}) - удаляет несколько документов

// Агрегация

// Кол/во документов в коллекции
// db.collection_name.countDocuments()
// db.collection_name.find().count()

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

// use GT130824

// 1. Создать коллекцию orders со свойствами _id, customer, product, amount, city используя следующие данные:

// 1 Olga Apple 15.55 Berlin
// 2 Anna Apple 10.05 Madrid
// 3 Olga Kiwi 9.6 Berlin
// 4 Anton Apple 20 Roma
// 5 Olga Banana 8 Madrid
// 6 Petr Orange 18.3 Paris


db.orders.insertMany([
    {
        _id: 1, 
        customer: 'Olga',
        product: 'Apple',
        amount: 15.55,
        city: 'Berlin'
    },
    {
        _id: 2, 
        customer: 'Anna',
        product: 'Apple',
        amount: 10.05,
        city: 'Madrid'
    },
    {
        _id: 3, 
        customer: 'Olga',
        product: 'Kiwi',
        amount: 9.6,
        city: 'Berlin'
    },
    {
        _id: 4, 
        customer: 'Anton',
        product: 'Apple',
        amount: 20,
        city: 'Rome'
    },
    {
        _id: 5, 
        customer: 'Olga',
        product: 'Banana',
        amount: 8,
        city: 'Madrid'
    },
    {
        _id: 6, 
        customer: 'Petr',
        product: 'Orange',
        amount: 18.3,
        city: 'Paris'
    }
])

// 2. Найти сколько всего было совершено покупок / кол/во документов.
db.orders.countDocuments()

db.orders.find().count()

db.orders.aggregate(
    {$count: 'orders_count'}
)

db.orders.aggregate([
    {$group: {_id: null, orders_count: {$sum: 1}}}
])

// 3. Найти сколько всего раз были куплены яблоки.
db.orders.find({product: 'Apple'}).count()

db.orders.aggregate([
    {$match: {product: 'Apple'}},
    {$count: 'apple_orders_count'}
])

db.orders.aggregate([
    {$match: {product: 'Apple'}},
    {$group: {_id: null, orders_count: {$sum: 1}}}
])

// 4. Вывести все документы отсортированными по стоимости покупки - от самой недорогой до самой дорогой.
db.orders.find().sort({amount: 1})

db.orders.aggregate([
    {$sort: {amount: 1}}
])

// 5. Вывести три самые дорогие покупки.
db.orders.find().sort({amount: -1}).limit(3)

db.orders.aggregate([
    {$sort: {amount: -1}},
    {$limit: 3}
])

// 6. Найти сколько всего покупок было совершено в Берлине
db.orders.find({city: 'Berlin'}).count()

db.orders.aggregate([
    {$match: {city: 'Berlin'}},
    {$count: 'berlin_orders_count'}
])

// 7. Найти количество покупок яблок в городах Берлин и Мадрид
db.orders.find({product: 'Apple', city: {$in: ['Berlin', 'Madrid']}}).count()

db.orders.aggregate([
    {$match: {product: 'Apple', city: {$in: ['Berlin', 'Madrid']}}},
    {$count: 'orders_count'}
])

// 8. Найти сколько было потрачено каждым покупателем
db.orders.aggregate([
    {$group: {_id: '$customer', total_amount: {$sum: '$amount'}}}
])

// 9. Найти сколько было потрачено на каждый товар
db.orders.aggregate([
    {$group: {_id: '$product', total_amount: {$sum: '$amount'}}}
])
