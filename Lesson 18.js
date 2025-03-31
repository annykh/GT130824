// use GT130824
// https://github.com/annykh/GT130824/blob/main/workers.txt

// Обновление данных

// replaceOne - Если нам нужно полностью заменить один документ другим, используем replaceOne.

// db.collection_name.replaceOne(filter, update [, options]) //options - true/false(по умолч.)

// filter: принимает запрос на выборку документа, который надо обновить

// update: представляет новый документ, который заместит старый при обновлении

// options: определяет дополнительные параметры при обновлении документов, основным из которых является параметр upsert.

    // Если параметр upsert имеет значение true, что mongodb будет обновлять документ, если он найден, и создавать новый, если такого документа нет. Если же он имеет значение false, то mongodb не будет создавать новый документ, если запрос на выборку не найдет ни одного документа.
    // По умолчанию false


// Полностью обновить документ с _id 2, где
// firstname: 'Boris'
// lastname: 'Orlov'
// age: 37
// position: 'Web programmer'
// salary: 5000
// skills: ['taking orders', 'suggesting meals', 'taking payments', 'javascript', 'coding', 'html/css']

db.workers.replaceOne(
    {_id: 2},
    {
        firstname: 'Boris',
        lastname: 'Orlov',
        age: 37,
        position: 'Web programmer',
        salary: 5000,
        skills: ['taking orders', 'suggesting meals', 'taking payments', 'javascript', 'coding', 'html/css'] 
    }
)

// Полностью обновить документ, где имя Denis, а фамилия Ivanov, если нет такого документа, создать новый.
// firstname: 'Denis'
// lastname: 'Ivanov'
// age: 34
// position: 'Sales manager'
// salary: 3000
// skills: ['taking orders', 'taking payments', 'teamworking']

db.workers.replaceOne(
    {firstname: 'Denis', lastname: 'Ivanov'},
    {
        firstname: 'Denis',
        lastname: 'Ivanov',
        age: 34,
        position: 'Sales manager',
        salary: 3000,
        skills: ['taking orders', 'taking payments', 'teamworking']
    },
    {upsert: true}
)


// Часто не требуется обновлять весь документ, а только значение одного или нескольких его свойств. Для этого применяются функции updateOne() (обновляет только один документ) и updateMany() (обновляет множество документов).
// db.collection_name.updateOne({filter}, {update})
// db.collection_name.updateMany({filter}, {update})

// $set - если нужно обновить отдельное поле, или если обновляемого поля нет, то оно создается
// $inc - для увеличения значения числового поля на определенное кол/во единиц, если обновляемого поля нет, то оно создается
// $unset - для удаления поля

// Изменить должность на 'Sales manager' для сотрудника с _id 2.

db.workers.updateOne(
    {_id: 2},
    {$set: {position: 'Sales manager'}}
 )

// mysql
// update workers
// set position = 'Sales manager'
// where _id = 2;

// Добавить свойство department со значением Sales для сотрудника с _id 2.

db.workers.updateOne(
    {_id: 2},
    {$set: {department: 'Sales'}}
)

//mysql
// alter table workers
// add column department varchar(128);

// update workers
// set department = 'Sales'
// where _id = 2;

// Изменить должность на 'Supervisor' для сотрудника с _id 4 и добавить свойство department со значением 'Hotel FO'.

db.workers.updateOne(
    {_id: 4},
    {$set: {position: 'Supervisor', department: 'Hotel FO'}}
)


// Увеличить зарплату сотрудника с именем Boris на 2000.
db.workers.updateOne(
    {firstname: 'Boris'},
    {$inc: {salary: 2000}}
)

// Уменьшить зарплату сотрудника с именем Marina на 500.
db.workers.updateOne(
    {firstname: 'Marina'},
    {$inc: {salary: -500}}
)

// Удалить поле department для сотрудника с _id 2.
db.workers.updateOne(
    {_id: 2},
    {$unset: {department: 1}}
)

// Для сотрудника с именем Denis изменить значение _id на 6.
db.workers.updateOne(
    {firstname: 'Denis'},
    {$set: {_id: 6}}
)
// Error: Performing an update on the path '_id' would modify the immutable field '_id'


// Добавить новое поле commission со значением 0 для всех сотудников
db.workers.updateMany(
    {},
    {$set: {commission: 0}}
)

// Изменить значение commission на 10 для сотрудников с зарплатой выше 3000.
db.workers.updateMany(
    {salary: {$gt: 3000}},
    {$set: {commission: 10}}
)

// Удалить поле commission для всех сотрудников, кроме Ivan
db.workers.updateMany(
    {firstname: {$ne: 'Ivan'}},
    {$unset: {commission: 1}}
)

// У всех удалить поля commission и department.
db.workers.updateMany(
    {},
    {$unset: {commission: 1, department: 1}}
)

// Для всех документов создать поле age_cat со значением 'null'.
db.workers.updateMany(
    {},
    {$set: {age_cat: 'null'}}
)

// Если возраст сотрудников меньше 30, изменить значение поля age_cat на 'Junior'.
db.workers.updateMany(
    {age: {$lt: 30}},
    {$set: {age_cat: 'Junior'}}
)

// Если возраст сотурдников больше/равен 30, изменить значение поля age_cat на 'Senior'.
db.workers.updateMany(
    {age: {$gte: 30}},
    {$set: {age_cat: 'Senior'}}
)


// Обновление массивов

// $push - добавление элемента в массив
// $addToSet - Отличие от push в том, что addToSet добавляет данные, если их еще нет в массиве(через push данные дублируются)
// $push/$addToSet + $each - можно добавить сразу несколько значений

// $position - задает позицию в массиве для вставки элементов
// $slice -  указывает, сколько элементов оставить в массиве после вставки
// Работают только с $push и $each

// $pop - позволяет удалить один эл. из массива либо первый, либо последний
// если значение 1 то удалет последний эл., если -1, то первый

// $pull - удаляет каждое вхождение эл. в массив (можно удалить только один элемент)
// $pullAll - удаляет несколько элементов из массива

// Добавить новый навык сотруднику Boris со занчением 'team working'
db.workers.updateOne(
    {firstname: 'Boris'},
    {$push: {skills: 'team working'}}
)

db.workers.updateOne(
    {firstname: 'Boris'},
    {$push: {position: 'team working'}}
)
// The field 'position' must be an array but is of type string in document {_id: 2}


// Добавить новые навыки сотруднику Ivan со значениями creativity, Javascript
db.workers.updateOne(
    {firstname: 'Ivan'},
    {$push: {skills: {$each: ['creativity', 'Javascript']}}}
)

// Всем сотрудникам добавить новый навык 'Javascript'.
db.workers.updateMany(
    {},
    {$push: {skills: 'Javascript'}}
)

// Всем сотрудникам добавить новый навык 'Javascript', если такого навыка у них нет.
db.workers.updateMany(
    {},
    {$addToSet: {skills: 'Javascript'}}
)

// Добавить новые навыки сотруднику Marina со значениями 'teamwork', 'programming', 'seating guests', если таких навыков нет в массиве.
db.workers.updateOne(
    {firstname: 'Marina'},
    {$addToSet: {skills: {$each: ['teamwork', 'programming', 'seating guests']}}}
)

// Добавить навык 'organization' сотруднику Olga. Вставить новый навык с индексом 1.
db.workers.updateOne(
    {firstname: 'Olga'},
    {$push: 
        {skills: 
            {$each: ['organization'], $position: 1}
        }
    }
)

//Добавить новые навыки 'budgeting', 'organization' для сотрудника Ivan. Вставить новые навыки начиная со первого элемента (с индекса 0) и оставить 4 навыка в массиве.
db.workers.updateOne(
    {firstname: 'Ivan'},
    {$push: 
        {skills: 
            {$each: ['budgeting', 'organization'], $position: 0, $slice: 4}
        }
    }
)

// Удалить первый навык сотрудника Marina
db.workers.updateOne(
    {firstname: 'Marina'},
    {$pop: {skills: -1}}
)

// Удалить последний навык сотрудника Boris
db.workers.updateOne(
    {firstname: 'Boris'},
    {$pop: {skills: 1}}
)

// Удалить навык coding у Boris.
db.workers.updateOne(
    {firstname: 'Boris'},
    {$pull: {skills: 'coding'}}
)

// Удалить навык 'Javascript' у всех сотрудников.
db.workers.updateMany(
    {},
    {$pull: {skills: 'Javascript'}}
)

// Удалить навыки programming, teamworking у сотрудников которым больше 18.
db.workers.updateMany(
    {age: {$gt: 18}},
    {$pullAll: {skills: ['programming', 'teamworking']}}
)
