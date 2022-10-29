import Foundation
/*
В Swift существуют следующие виды операторов:
-> Простые операторы, выполняющие операции со значениями (операндами). В их состав входят унарные и бинарные операторы.
-> Унарные операторы выполняют операцию с одним операндом. Они могут находиться перед операндом (префиксные) или после него (постфиксные).
Оператор var, с помощью которого объявляется хранилище данных, или
оператор минус (-a), с помощью которого создаются отрицательные числа,
являются унарными префиксными.
Далее в книге будут рассмотрены примеры постфиксных операторов, например, многоточие (...) в выражении 1... указывает на все целые числа после
единицы.
-> Бинарные операторы выполняют операцию с двумя операндами. Оператор,
который располагается между операндами, называется инфиксным.
Оператор инициализации (=) и оператор сложения (+) являются бинарными
инфиксными, так как использует в работе два операнда и находятся между
ними (value1 = 12 или 34+12).
-> Структурные операторы влияют на ход выполнения программы. Например,
останавливают выполнение программы при определенных условиях или указывают программе, какой блок кода должен быть выполнен при определенных
условиях. Подробно структурные операторы будут рассмотрены в главе «Операторы управления».
*/

//        <--- Markdown-Комментарии --->
//: это markdown-комментарий
//: объявим переменную
var str = "Motherfucker"
//: а это - *курсивный текст*
//: а это - **жирный текст**

// Вкл/Выкл форматирование комментариев Editor > Show Rendered Markup / Editor > Show Raw Markup
//---------------------------------------------------------------------------------


//        <--- Интерполяция --->
print("Hello, \(str)!")
//---------------------------------------------------------------------------------


//        <--- Объявление/Инициализация и Явное указание типа --->
var variable: Int = 15
var variableOne = Int(13)
var criptoMoney = Double("0.100000000000000000000000000000000001")
var apples = Optional(10)
var apples1: Int? = 10
var apples2: Optional<Int> = 10
//---------------------------------------------------------------------------------


//        <--- Строки --->
var stringFromCharacter = String(["h", "e", "l", "l", "o"])

str = """
    Hello, \(str)!
    """
/* !НЕКОРРЕКТНО!
"""
Hello
 """
*/
//---------------------------------------------------------------------------------


//        <--- Unicode-скаляры --->
let myCharOverUnicode: Character = "\u{041A}"
let stringOverUnicode = "\u{41C}\u{438}\u{440}\u{20}\u{412}\u{430}\u{43C}\u{21}"
//---------------------------------------------------------------------------------


//        <--- Определение псевдонима для типа --->
typealias exampleName = UInt8
var example: exampleName = 29
typealias UserInfo = (firstName: String, lastName: String)
//---------------------------------------------------------------------------------


//        <--- Tuple --->
var wordsAfterLose: (String, String, String) = ("I", "love", "your mother")
// (.0 ..., .1 ..., .2 ...)
/* объявляем tuple с указанием имен элементов в описании типа */
let statusTuple: (statusCode: Int, statusText: String, statusConnect: Bool)
= (200, "In Work", true)
let statusTuple1: (Int, String, Bool)
= (statusCode: 200, statusText: "In Work", statusConnect: true)

// запись значений tuple в переменные
let (firstWord, secondWord, _) = wordsAfterLose
print("\(firstWord)\(secondWord) your mother")

/*
 -- вывод через индексы tuple --
print("\(wordsAfterLose.0)\(wordsAfterLose.1)\(wordsAfterLose.2)")

-- вывод через имена tuple --
print("\(statusTuple1.statusCode)\(statusTuple1.statusText)\(statusTuple1.statusConnect)")
*/
//---------------------------------------------------------------------------------


//        <--- Dictionary --->
var phoneBookMothersOfTheDistrict: [String: String] = [:]
var phoneBookMothersOfTheDistrict1 = [String: String]()
var phoneBookMothersOfTheDistrict2 = ["Galochks":"+79999990011", "Julia":"+78990991423"]

phoneBookMothersOfTheDistrict2["Galochka"] = "+79999990012"
phoneBookMothersOfTheDistrict2["Tamara"] = "+79997790012"
print(phoneBookMothersOfTheDistrict2)

if phoneBookMothersOfTheDistrict2.updateValue("+79999990000", forKey: "Galochka") != nil {
    print("Updated successfully!")
} else {
    print("It's new record!")
}
print(phoneBookMothersOfTheDistrict2["Galochka"])

if let phone = phoneBookMothersOfTheDistrict2["Galochka"] {
    print(phone)
}
//---------------------------------------------------------------------------------


//        <--- Массивы --->
var animals: [String] = ["Wolf", "Bear", "Rabbit"]
var animals1 = [String]()
var animals2 = Array<String>()


animals[2] = "Cat"
animals.append("Dog")
animals.insert("Pig", at: 1)
print(animals)
animals.remove(at: 0)
print(animals)
animals.removeAll()

let newAnimals = ["Ёж", "Рысь", "Олень"]
animals += newAnimals
animals.shuffle() // Перемешивает исходный массив
animals.shuffled() // Возвращает перемешанный новый массив

// Замыкание
let filteredAnimals = animals.filter { animal in
    animal.first == "W"
}
print(filteredAnimals)
// Замыкание
let numbers = [2, 3, 4, 5, 67, 87, 200]
let oddNumbers = numbers.filter { number in
    number % 2 == 0
}
print(oddNumbers)
// Замыкание с сортировкой по алфавиту
animals.sort { firstAnimal, lastAnimal in
    firstAnimal < lastAnimal
}
// Замыкание с сортировкой по алфавиту методом sorted, который возвращает измененный массив
let alphabetAnimals = animals.sorted { firstAnimal, secondAnimal in
    firstAnimal < secondAnimal
}

// Маппинг
let numbersForMap = [1, 3, 5, 4, 6, 7]
let result = numbersForMap.map { number in
    pow(Decimal(number), 3) // number * number * number
}
print(result)

let names = ["Вася", "Илья", "Маша", "Гена"]
let greetings = names.map { name in
    "Привет, \(name)!"
}
print(greetings)
//---------------------------------------------------------------------------------


//        <--- Множества --->
// Уникальные значения одного типа
var exampleSet = Set<Int>()
var exampleSet1: Set<String> = ["basketball", "foorball"]
var circleStations: Set = ["Комсомольская", "Белорусская", "Киевская", "Курская"]
circleStations.insert("Парк Победы")
circleStations.contains("Войковская")
circleStations.contains("Комсомольская")
print(circleStations.contains("Войковская") ? "Войковская есть на кольцевой линии" : "Войковской нет на кольцевой линии")

for station in circleStations.sorted() {
    print(station)
}
// Приготовление борща :D
var productsForBorsch: Set = ["Свекла", "Лук", "Картофель", "Капуста", "Говядина", "Соль", "Перец"]

let haveProducts: Set = ["Свекла", "Капуста", "Говядина", "Соевый соус", "Яйца", "Молоко"]

// Вычитание - subtract
productsForBorsch.subtract(haveProducts)
print(productsForBorsch)


var firstProviders: Set = ["РТК", "Билайн", "МТС"]
var secondProviders: Set = ["РТК", "МТС", "Дом.ру", "Стрим"]

// Пересечение - intersection
var providers = firstProviders.intersection(secondProviders)
print(providers)

let firstCourse: Set = ["iOS", "Swift", "Дизайн", "UX-прототипирование"]
let secondCourse: Set = ["Веб-верстка", "Основы JS", "Дизайн", "UX-прототипирование"]

// Объединение - union
let skills = firstCourse.union(secondCourse)
print(skills)

// Симметрическая разность - symmetric difference
let uniqueSkills = firstCourse.symmetricDifference(secondCourse)
print(uniqueSkills)
//---------------------------------------------------------------------------------


//        <--- Опциональные типы данных--->
var apples3: Int? = 2

var tuple1: (code: Int, message: String)? = nil
var tupleWithOptElements: (Int?, Int) = (nil, 100)

// 1. Жесткое (прямое) извлечение из-под опционала (unwraping).
// ИСПОЛЬЗОВАТЬ ТОЛЬКО В ТОМ СЛУЧАЕ, КОГДА НА 1000% УВЕРЕН, ЧТО ЗНАЧЕНИЕ ЕСТЬ, А НЕ СТОИТ nil!!!
print("You have \(apples!) fucking apples in your ass! Your ass sooo BIG.")

// 2. Косвенное извлечение опционала (implicitly unwrapping)
// Используется в том случае, когда изначально может быть задано значение nil (во время объявления переменной), а потом присвоено обычное значение. В случае nil - ПРИЛОЖЕНИЕ КРАШНЕТСЯ!!!
var wrapInt: Double! = nil
wrapInt = 3.14
print(wrapInt + 0.12)

// 3. Мягкое извлечение из-под опционала с помощью ветвлений

// 1)
var fiveMarkCount: Int? = 8
var allCakesCount = 0
if fiveMarkCount != nil {
    let cakeForEachFiveMark = 2
    allCakesCount = cakeForEachFiveMark * fiveMarkCount!
}
print("You got \(allCakesCount) cakes, little pizd'uk!")

// 2)
let userName: String? = "Vadeek"
let age: Int? = 19
age != nil ? print("Name: \(userName). Age: \(age!).") : print("Name: \(userName).")


// 4. Оператор опционального объединения (связывания) по nil (optional binding)

// 1)
var userLogin: String? = "vasyaPupkin228"
if let personName = userLogin {
    print("Name:  \(personName)")
} else {
    print("Name not entered!")
}

var pointX: Int? = 10
var pointY: Int? = 3
if let _ = pointX, let y = pointY, y < 10 {
    print("Point exists!")
}

var yearOfBirth = "1980"
if let safeYearOfBirth = Int(yearOfBirth) {
    print(safeYearOfBirth)
}

// 2)
let defaultName = "Guest"
let nameForGreeting = userName ?? defaultName
print("Hello, fucking \(nameForGreeting)!")
print("Hello, fucking \(userName ?? defaultName)!")

var x: Int? = 10
var y: Int = x ?? 0
//---------------------------------------------------------------------------------


//        <--- If-Guard-Switch --->
var lastMatchWin = false
var badMood = true
if !lastMatchWin && badMood {
    print("Your mother very ugly🤮")
} else if !lastMatchWin && badMood {
    print("I love your mother very much👉👈")
} else {
    print("Fuck YOU, piece of shit!!!")
}


// --- Guard ---
func calc(x: Float?, y: Float) {
    guard let x = x else { return} // Применение optional binding с guard
    guard y != 0 else { return }
    guard x > 5 else { return }

    let z = x / y
    print(z)
}
calc(x: 10, y: 2)

// Тернарный оператор
let contentHeight = 40
let hasHeader = true

let loveToYourEnemy = (!lastMatchWin || badMood) ? "Your mother very ugly🤮" : "I love your mother very much👉👈"
let rowHeight = contentHeight + (hasHeader ? 50 : 20)


// --- Switch ---
let grade = 5
switch grade {
case 5,4:
    print("Отлично!")
case 2...3:
    print("Плохо!")
case 2:
    print("Очень Плохо!")
    fallthrough // Провал ниже, в данном случае в default
default:
    print("Мне нечего сказать...")
}

// Switch and Tuple
let somePoint = (1, 1)
switch somePoint{
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case let(x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case (let x, 0), (0, let x):
    print("On an axis, \(x) from the origin")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

// Маркированная инструкция Switch
var varForTest = 1

switchMarker: switch varForTest {
case 1:
    print("Variable = \(varForTest)")
    break switchMarker
default:
    break
}
//---------------------------------------------------------------------------------


//        <--- For-in --->
for number in 1...10 {
    print(number)
}

for _ in 1...2 {
    print("You fuck me, Daddy??🥵")
}

// Проход по массиву с индексами и значениями
var shoppingList = ["eggs", "bread", "milk"]
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
//---------------------------------------------------------------------------------


//        <--- While and repeat-While --->
var deepOfYourAssHole = 10

while deepOfYourAssHole <= 20 {
    print("Your ass hole will be deeper, be patient!")
    deepOfYourAssHole += 1
}

repeat {
    print(deepOfYourAssHole)
    deepOfYourAssHole += 1
} while deepOfYourAssHole <= 20

// Маркированная инструкция While
varForTest = 1
whileMarker: while(varForTest == 0) {
    print("You're dumb!!!")
    if varForTest == 0 {
        break whileMarker
    }
}
//---------------------------------------------------------------------------------


//        <--- Функции --->
func someFunction(id: Int) -> (firstname: String, lastname: String) {
    // ...
    var firstname = "vadeek"
    var lastname = "velichko"
    return (firstname, lastname)
}
// могут быть удобно разобраны на отдельные параметры на приемной стороне
let (firstname, lastname) = someFunction(id: 12)

func shoppingList(item: String, quantity: Int) -> String {
  "You need to buy \(quantity) \(item)."
}
// shoppingList: (String, Int) -> String

func repeater(_ phrase: String, times: Int) -> String {
  var result = ""
  for _ in 1...times {
    result += phrase
  }
  return result
}
// repeater: (String, Int) -> String

// Типы функций можно использовать как типы параметров, передавать в другие функции и вызывать из этих функций.
func apply3(to str: String, function f: (String, Int) -> String) -> String {
  f(str,3)
}
// apply3: ([String], (String, Int) -> String) -> [String]

apply3(to: "eggs", function: shoppingList)
// => "You need to buy 3 eggs."

apply3(to: "eggs", function: repeater)
// => "eggseggseggs"

// Функциональные типы могут использоваться в качестве возвращаемых типов для функций
func makeAdder(base: Int) -> (Int) -> Int {
  func adder(_ i: Int) -> Int {
    base + i
  }
  return adder
}
// makeAdder: (Int) -> (Int) -> Int

let add10 = makeAdder(base: 10)
// add10: (Int) -> Int

let subtract20 = makeAdder(base: -20)
// subtract10: (Int) -> Int

add10(5)
// => 15

subtract20(5)
// => -15

func getHuman() -> (String, Int, Double) {
    return (name: "Nikolay", age: 30, height: 1.80)
}
let (nameHuman, ageHuman, heightHuman) = getHuman()


// Сумма всех чисел массива
let cash: [Double] = [123, 435, 657, 7657, 332, 43, 211]
let sum = cash.reduce(0) { (result, item) -> Double in
    result + item
}

func getIncomeTotal(with cash: [Double], percent: Double = 0.5) -> Double {
    var sum = cash.reduce(0, +) // Упрощённый вариант суммы всех чисел массива
    sum -= sum * percent
    return sum
}
let incomeShop1 = getIncomeTotal(with: cash)
let cash1: [Double] = [13, 35, 657, 757, 33, 4, 21]
let incomeShop2 = getIncomeTotal(with: cash1, percent: 0.3)


func getUser() -> [String] {
    return ["Ivan", "Ivanov"]
}
let returning = getUser()
print(returning[0])
//---------------------------------------------------------------------------------

