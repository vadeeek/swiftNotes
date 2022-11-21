import Foundation
import UIKit
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
print("\(firstWord) \(secondWord) your mother")

/*
 -- вывод через индексы tuple --
print("\(wordsAfterLose.0)\(wordsAfterLose.1)\(wordsAfterLose.2)")

-- вывод через имена tuple --
print("\(statusTuple1.statusCode)\(statusTuple1.statusText)\(statusTuple1.statusConnect)")
*/
//---------------------------------------------------------------------------------


//        <--- Dictionary --->
// Коллекция неуникальных однотипных значений, упорядоченных по уникальному однотипному значению
var phoneBookMothersOfTheDistrict: [String: String] = [:]
var phoneBookMothersOfTheDistrict1 = [String: String]()
var phoneBookMothersOfTheDistrict2 = ["Galochka":"+79999990011",
                                      "Julia":"+78990991423"]

phoneBookMothersOfTheDistrict2["Galochka"] = "+79999990012"
phoneBookMothersOfTheDistrict2["Tamara"] = "+79997790012"
print(phoneBookMothersOfTheDistrict2)
print(phoneBookMothersOfTheDistrict2.keys)

if phoneBookMothersOfTheDistrict2.updateValue("+79999990000", forKey: "Galochka") != nil {
    print("Updated successfully!")
} else {
    print("It's new record!")
}
print(phoneBookMothersOfTheDistrict2["Galochka"]!)

if let phone = phoneBookMothersOfTheDistrict2["Galochka"] {
    print(phone)
}
//---------------------------------------------------------------------------------


//        <--- Массивы --->
var animals: [String] = ["Wolf", "Bear", "Rabbit"]
var animals1 = [String]()
var animals2 = Array<String>()
var nums = [1, 2, 3, 4, 5, 6] as [Double]
var array5x5 = Array(repeating: Array(repeating: 25, count: 5), count: 5)
print(array5x5)


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
// Замыкание подсчёта суммы чисел массива
var arrSum = numbers.reduce(0) { (sum, value) in
    return sum + value
}
// Ваще хз как работает🤯
var value = numbers.map{$0 * 2}.filter{$0 < 5}.reduce(0, +)
print(value)

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

var animalss = [("Giraffe", 2), ("Wolf", 5)]
var animalZooMap = animalss.map { (name, count) in
    "This zoo has \(name), in quantity \(count)."
}
print(animalZooMap)
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
age != nil ? print("Name: \(userName!). Age: \(age!).") : print("Name: \(userName!).")


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

// 3)
var nickname: String? = "chumba"
if let nickname {
    print("Hey, \(nickname)")
}
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
    guard let x = x else { return } // Применение optional binding с guard
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
    fallthrough // Принудительный провал ниже (независимо от истинности след кейса), в данном случае в default
default:
    print("Мне нечего сказать...")
}

let arri: [any Equatable] = [5, 5.4, Float(5.4)]

switch arri[0] {
case _ as Int: print("Int")
case _ as Float: print("Float")
case _ as Double: print("Double")
default:
    break
}


// Switch and Tuple
let somePoint = (1, 1)
switch somePoint {
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

while deepOfYourAssHole <= 12 {
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

func sumMany(numbers: Int...) {
    var sum = 0
    
    for number in numbers {
        sum += number
    }
    (sum)
}
sumMany(numbers: 1,2,3,4,5,6,7,8,9)

// Сквозной параметр
// inout - делает возможность константных параметров. при вызове функции в аргементы передается ссылка на значение
func changeValue(value: inout Double) {
    value = 5
}
var a = 1.0
changeValue(value: &a)
print(a)

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

// Использование guard в Функции
func greeting(name: String?) -> String {
    guard let name = name else {
        return "Привет, гость!"
    }
    return "Привет, \(name)!"
}
print(greeting(name: "vadeek"))

// Вариативные функции
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square(numbers: 1, 2, 3, 4)
//---------------------------------------------------------------------------------


//        <--- Замыкания (Closures) --->
// 1. Глобальные функции
// 2. Вложенные функции
// 3. Замыкающие выражения

// { (параметры) -> ReturnType in
     // тело замыкания
// }

// Простое замыкание, не принимающее и не возвращающее никаких значений
let newGreeting = {
    print("Hello, Pidor!")
}
newGreeting()


let message = { (user: String?, text: String) in
    if let user = user {
        print("\(user), \(text)")
    } else {
        print(text)
    }
}
message("Вася", "Привет, как дела?")
message(nil, "Привет всем!")


let summ = { (x: Int, y: Int) -> Int in
    return x + y
}
summ(5, 67)

let diff = { (x: Int, y: Int) -> Int in
    return x - y
}

func operation(a: Int, _ b: Int, _ action: (Int, Int) -> Int) {
    print(action(a, b))
}

// Синтаксис последующего замыкания
operation(a: 15, 43) { x, y in
    x * y
}

operation(a: 60, 20, diff)
operation(a: 60, 20, summ)


func pryam(width: Double, height: Double, action: (Double, Double) -> Double) -> Double {
    return action(width, height)
}

let plosch = { (width: Double, height: Double) -> Double in
    return width * height
}

let perim = { (width: Double, height: Double) -> Double in
    return 2 * (width + height)
}

pryam(width: 2, height: 1, action: plosch)
pryam(width: 2, height: 1, action: perim)
//---------------------------------------------------------------------------------


//        <--- Перечисления (Enumerations) --->
enum TypeDevice {
    case laptop(mark:markLaptop)
    case desktopComputer
    case tablet
    case smartPhone(mark:markSmartPhone)
    case smartWatch
    
    // Nested Enum
    enum markLaptop {
        case apple
        case acer
        case hp
    }
    // Nested Enum с Raw Value с наследованием от String
    enum markSmartPhone:String {
        case iphone = "Apple iPhone"
        case samsung = "Samsung"
    }
}

// let device:TypeDevice = .laptop(mark: .acer)
let device:TypeDevice = .smartPhone(mark: .iphone)
switch device {
case .laptop(let markLaptop) where markLaptop == .apple:
    print("Ноутбук Apple")
case .laptop:
    print("Ноутбук")
case .desktopComputer:
    print("ПК")
case .smartWatch:
    print("Умные часы")
case .tablet:
    print("Планшет")
case .smartPhone(let markSmartPhone) where markSmartPhone == .iphone:
    print("Смартфон \(markSmartPhone.rawValue)")
case .smartPhone:
    print("Смартфон")
}


enum markAuto:String {
    case bmw = "BMW M5 F90"
    case mercedes = "Mercedes AMG"
}
let markauto = markAuto(rawValue: "BMW M5 F90")
print(markauto?.rawValue)


enum DayTime {
    case morning
    case afternoon
    case evening
    case night
}

var currentTime = DayTime.afternoon
currentTime = .evening

let night: DayTime = .night

switch currentTime {
    
case .morning:
    print("Пью кофе")
case .afternoon:
    print("Пью чай")
case .evening:
    print("Пью")
case .night:
    print("Сплю")
}

// Ассоциируемые значения

enum Profession {
    case programmer(String, String, Int)
    case sysAdmin(String, String)
    case webDesigner(String, Int)
    case cleaningManager(String)
}

let myProfession = Profession.programmer("Vadeek", "iOS", 0)
let designer = Profession.webDesigner("Ирина", 30)

func check(prof: Profession) {
    switch prof {
        
    case .programmer(let name, let speciality, let experience):
        print("Меня зовут \(name). Я работаю \(speciality)-Разработчиком вот уже \(experience) лет")
    case .sysAdmin(let name, let speciality):
        print("Меня зовут \(name). Я работаю системным администратором и специализируюсь на \(speciality)")
    case .webDesigner(_, _):
        break
    case .cleaningManager(_):
        break
    }
}
check(prof: myProfession)

// Чистые значения (Raw Value)
enum MyPetName: String, CaseIterable {
    case cat = "Vasya"
    case dog = "Tuzik"
    case boa = "Shnurok"
    case parrot = "Popka Durak"
}

var myCat = MyPetName.cat
var myCatName = myCat.rawValue

var myPets = MyPetName.allCases
print(myPets)

for pet in myPets {
    print(pet.rawValue)
}

enum Season: Int {
    case winter = 1, spring, summer, autumn
    
    var label: String {
        switch self {
        case .winter:
            return "Зима"
        case .spring:
            return "Весна"
        case .summer:
            return "Лето"
        case .autumn:
            return "Осень"
        }
    }
    
    init? (_ value: String) {
        switch value {
        case "Зима": self = .winter
        case "Весна": self = .spring
        case "Лето": self = .summer
        case "Осень": self = .autumn
        default: return nil
        }
    }
    
    func printLabel() {
        print(self.label)
    }
}

let season = Season("Зима")
if season != nil {
    season!.printLabel()
}
//---------------------------------------------------------------------------------


//        <--- Классы --->
// Ссылочный тип данных
class Player {
    
    // Свойства
    let name: String
    var level: Int = 0
    
    // Стандартный инициализатор
    init(name: String) {
        self.name = name
    }
    
    // Дефолтный инициализатор
    init(name: String = "Гость", level: Int = 0) {
        self.level = level
        self.name = name
    }
    
    func printInfo() {
        print("Имя игрока: \(name). Уровень: \(self.level)")
    }
    
    func levelUp(count: Int) {
        self.level += count
    }
    
    func levelDown(count: Int) {
        guard count < self.level else {
            self.level = 0
            return
        }
        self.level -= count
    }
}

var player1 = Player(name: "Фёдор")
player1.printInfo()
var player2 = Player(name: "Егор")
player2.printInfo()
var player3 = Player()
player3.printInfo()
var player4 = Player(name: "Алиса", level: 4)
player4.printInfo()
player4.levelUp(count: 2)
player4.printInfo()
player4.levelDown(count: 7)
player4.printInfo()

var players: [Player] = [player1, player2, player3, player4]

for player in players {
    print("\(player.name) | Уровень: \(player.level)")
}




class SalesManager {
    
    // СВОЙСТВА ТИПА:
    // Хранимые(статические) - не могут наследоваться
    static var phoneModel = "iPhone SE"
    
    // Вычисляемые(классовые) - могут наследоваться
    class var companyTitle: String { return "DICK.COMPANY"}
    
    // СВОЙСТВА ЭКЗЕМПЛЯРА:
    // Хранимые свойства (Stored Properties)
    var salaryBase = 15000
    var calls = 0 {
        willSet {
            print("Вы совершили \(newValue) звонков. Предыдущее значение \(calls)")
        }
        
        didSet {
            if calls >= 130 {
                print("KPI по звонкам выполнен! Количество звонков: \(calls)")
            }
        }
    }
    
    
    var salesAmount = 0 {
        // Наблюдатель отрабатывает перед установкой нового значения
        willSet {
            print("Вы продали товара на \(newValue) рублей. Предыдущее значение \(salesAmount)")
        }
        // Наблюдатель отрабатывает после установки нового значения
        didSet {
            if salesAmount >= 300000 {
                print("KPI по продажам выполнен! Сумма продаж: \(salesAmount)")
            }
        }
    }
    
    
    var sanctionsAmount = 0
    
    // Ленивые свойства:
    lazy var userPicture = UIImage()
    
    // Вычисляемые свойства (Computed Properties)
    var motivation: Int {
        
        if calls >= 130 && salesAmount >= 300000 {
            let motiv = self.calls * 50 + (salesAmount / 100 * 12)
            return motiv
        } else {
            return 0
        }
    }
    
    var salary: Int {
        var result = salaryBase + motivation - sanctionsAmount
        guard result >= salaryBase / 2 else {
            result = salaryBase / 2
            return result
        }
        return result
    }
}

let fedya = SalesManager()
fedya.motivation
SalesManager.phoneModel = "iPhone XR"
fedya.salesAmount = 30000
fedya.salesAmount = 400000
fedya.calls = 5
fedya.calls = 150
//---------------------------------------------------------------------------------


//        <--- Инициализаторы --->
class Car {
    
    let brandAndModel: String
    let wheelsCount: Int
    var color = "White"
    
    // Инициализатор по умолчанию
    init(brandAndModel: String, wheelsCount: Int = 4) {
        self.brandAndModel = brandAndModel
        self.wheelsCount = wheelsCount
    }
    
    // Memberwise-инициализатор
    init(brandAndModel: String, wheelsCount: Int, color: String) {
        self.brandAndModel = brandAndModel
        self.wheelsCount = wheelsCount
        self.color = color
    }
    
    // Failable-инициализатор
    init?(brand: String, model: String, wheelsCount: Int) {
        
        if wheelsCount < 4 {
            return nil
        } else {
            self.wheelsCount = wheelsCount
            self.brandAndModel  = "\(brand) \(model)"
        }
    }
    
    // "Удобный" инициализатор
    convenience init(brandAndModel: String, color: String) {
        self.init(brandAndModel: brandAndModel)
        self.color = color
    }
}

let mercedes = Car(brandAndModel: "Mercedes-Benz AMG") // Используем инициализатор по умолчанию
let bmw = Car(brandAndModel: "BMW M5 F90", wheelsCount: 6) // Используем инициализатор без учета значений по умолчанию
let honda = Car(brandAndModel: "Honda Accord", color: "Red")
//---------------------------------------------------------------------------------


//        <--- Наследование --->
class Vehicle {
    
    let brand: String
    let massa: Int
    
    init(massa: Int, brand: String) {
        self.brand = brand
        self.massa = massa
    }
    
    func go() {
        print("It's going!")
    }
}

let vehicle = Vehicle(massa: 12, brand: "Forward")

class NewCar: Vehicle {
    
    let carType: String
    let enginePower: Int
    
    init(carType: String, enginePower: Int, brand: String, massa: Int) {
        self.carType = carType
        self.enginePower = enginePower
        super.init(massa: massa, brand: brand)
    }
    
    func klakson() {
        print("Beep-beeep!!!")
    }
}

let audi = NewCar(carType: "City", enginePower: 300, brand: "Audi", massa: 1600)
let kia = NewCar(carType: "City", enginePower: 150, brand: "Kia", massa: 1400)

var cars: [NewCar] = [audi, kia]

final class SportCar: NewCar {
    
    let maxSpeed: Int
    
    init(enginePower: Int, brand: String, massa: Int, maxSpeed: Int) {
        self.maxSpeed = maxSpeed
        super.init(carType: "Sport Car", enginePower: enginePower, brand: brand, massa: massa)
    }
}

let ferrari = SportCar(enginePower: 430, brand: "Ferrari", massa: 1500, maxSpeed: 340)
let porsche = SportCar(enginePower: 410, brand: "Porsche", massa: 1700, maxSpeed: 320)

audi.go()
porsche.massa

cars.append(ferrari)
cars.append(porsche)

var sportCars = [SportCar]()

for car in cars {
    if car is SportCar {
        sportCars.append((car as! SportCar))
    }
}

for sportCar in sportCars {
    print(sportCar.brand)
}
//---------------------------------------------------------------------------------


//        <--- Полиморфизм --->
// Полиморфизм - это способность классов-наследников переопределять свойства(только вычислимые), методы и инициализаторы классов-родителей, а также перегружать функции

class Teacher {
    
    let name: String
    var description: String {
        return "Привет! Меня зовут \(name). Я учитель."
    }
    
    init(name: String) {
        self.name = name
    }
    
    func teach() {
        print("Я учу людей прямо сейчас!")
    }
}

class IOSTeacher: Teacher {
    
    let speciality: String
    
    // Переопределение свойства
    override var description: String {
        return "Привет! Меня зовут \(name). Я учитель по iOS-Разработке. Моя специальность - \(speciality)"
    }
    
    init(name: String, speciality: String) {
        self.speciality = speciality
        super.init(name: name)
    }
    // Переопределение инициализатора
    override init(name: String) {
        self.speciality = "Frontend"
        super.init(name: name)
    }
    
    func swiftCoding() {
        print("Я прогаю на Swift")
    }
    
    override func teach() {
        print("Я учу людей iOS-Разработке прямо сейчас!")
    }
    // Перегрузка метода
    func teach(hours: Int) {
        print("Я учу людей ближайшие \(hours) часов")
    }
}

let teacher = Teacher(name: "Федя")
teacher.description
teacher.teach()

let iOSTeacher = IOSTeacher(name: "Влад", speciality: "Front")
iOSTeacher.speciality
iOSTeacher.swiftCoding()

let iOSTeacher2 = IOSTeacher(name: "Андрей")
iOSTeacher2.speciality
iOSTeacher2.description
iOSTeacher2.teach()
iOSTeacher2.teach(hours: 5)
//---------------------------------------------------------------------------------


//        <---  Инкапсуляция --->
class Wallet {
    
    // Singleton
    static let shared = Wallet()
    private var balance = 0
    
    private init() { }
    
    func add(cash: Int) {
        self.balance += cash
        print(self.balance)
    }
    
    func withdraw(cash: Int) -> Int {
        
        guard cash <= balance else {
            return 0
        }
        
        balance -= cash
        return cash
    }
    
    func getBalance() -> Int {
        return self.balance
    }
}

class Shop {
    
    var wallet = Wallet.shared
}

class Job {
    
    var wallet = Wallet.shared
}

var ashan = Shop()
var fabrica = Job()

fabrica.wallet.add(cash: 15000)
let checkSum = ashan.wallet.withdraw(cash: 3000)

print(checkSum)
fabrica.wallet.getBalance()
ashan.wallet.getBalance()

class Person {
    
    let wallet = Wallet.shared
    var goods = [String]()
    
    private func get(goods: String) {
        self.goods.append(goods)
        print("Товар \(goods) куплен!")
    }
    
    private func give(money: Int) {
        self.wallet.withdraw(cash: money)
        print("Сумма чека: \(money) рублей")
    }
    
    func buy(goods: String, price: Int) {
        guard price <= wallet.getBalance() else {
            return
        }
        
        get(goods: goods)
        give(money: price)
    }
}

let vasya = Person()
print(vasya.goods)
vasya.wallet.getBalance()
fabrica.wallet.add(cash: 80000)
vasya.wallet.getBalance()
vasya.buy(goods: "iPhone 13", price: 69990)
//---------------------------------------------------------------------------------


//        <--- Структуры --->

// Класс - ссылочный тип данных (Reference Type)
// Экземпляры класса хранят ссылку на область памяти, в которой содержится объект
class NewPerson {
    
    let name: String
    var phone: Int
    
    init(name: String, phone: Int) {
        self.name = name
        self.phone = phone
    }
    
    func changePhone(phone: Int) {
        self.phone = phone
    }
}

// Структура - значимый тип данных (Value Type)
// В структурах отсутствует применение принципов ООП
// Экземпляры структур хранят значения
struct User {
    
    let name: String
    var phone: Int
    
    // Mutating(мутирующий) метод - это метод, который приводит к изменению самой структуры, то есть самого значения экземпляра, в котором этот метод объявлен
    mutating func changePhone(phone: Int) {
        self.phone = phone
    }
}


let person = NewPerson(name: "Вася", phone: 89996665544)
var person1 = NewPerson(name: "Олеся", phone: 84334334343)
let user = User(name: "Федя", phone: 88887776655)
var user1 = User(name: "Маша", phone: 12345678901)

person.phone = 89008008070
// user.phone = 86665554433 - ERROR! потому что это let значение, а не let ссылка на значение
// person = person1 - ERROR!
person1 = person // Теперь оба объекта ссылаются на person
person.name
person1.name
person1.phone = 12345678999
person.phone

user1 = user
user1.phone = 23456789012
user.phone




struct Person1 {
    var name: String
    var age: Int
}

var pers = Person1(name: "Anthony", age: 32)
var pers1 = Person1(name: "Petr", age: 21)

var couch = Person1(name: "Ivanovich", age: 56)

struct HockeyTeam {
    var name: String
    var members: [Person1]
    var couch: Person1
    var score: Int
}

var team1 = HockeyTeam(name: "Minsk Warriours", members: [pers, pers1], couch: couch, score: 0)
//---------------------------------------------------------------------------------


//        <--- Протоколы --->
// Протоколы - абстрактный тип данных
// Абстрактный - не существует явных экземпляров данного типа, существуют только экземпляры, которые могут соответствовать этому типу (быть подписаны под этот тип)
protocol FullyNamed {
    var fullName: String { get }
}

struct Human: FullyNamed {
    var fullName: String
    var age: Int
    var phoneNumber: Int
}

class Company: FullyNamed {
    var fullName: String
    var director = "Tim Cook"
    
    init(prefix: String, title: String) {
        self.fullName = "\(prefix) \(title)"
    }
}

let misha = Human(fullName: "Mikhail", age: 34, phoneNumber: 89009009090)
let alisa = Human(fullName: "Alisa", age: 23, phoneNumber: 89008008080)
let apple = Company(prefix: "LLC", title: "Apple")
let google = Company(prefix: "LLC", title: "Google")

class Bank: Company {
    var clients = [FullyNamed]()
    
}

let bank = Bank(prefix: "OOO", title: "Alfa-Bank")

bank.clients.append(misha)
bank.clients.append(alisa)
bank.clients.append(apple)
bank.clients.append(google)
google.director = "Vasya Pupkin"

for client in bank.clients {
    print(client.fullName)
    
    if client is Human {
        print((client as! Human).phoneNumber)
    } else if client is Company {
        print((client as! Company).director)
    }
}

enum Speciality {
    case iOS, android, python, java
}

protocol NewHuman {
    var name: String { get }
}

protocol Developer {
    var speciality: Speciality { get }
    var experienceInYears: Int { get }
}

protocol NewTeacher {
    var speciality: Speciality { get }
    
    func teach(theme: String)
}

struct DevTeacher: NewHuman, Developer, NewTeacher {
    
    var name: String
    var speciality: Speciality
    var experienceInYears: Int
    
    func teach(theme: String) {
        print("I teach people. Theme: \(theme).")
    }
}

let vlad = DevTeacher(name: "Vlad", speciality: .iOS, experienceInYears: 6)
vlad.name
vlad.teach(theme: "Protocols")






protocol Named {
    var title: String { get }
}

protocol Location {
    var lat: Double { get }
    var lon: Double { get }
}

struct City: Location, Named {
    
    var lat: Double
    var lon: Double
    var title: String
}

struct Club: Location, Named {
    
    var lat: Double
    var lon: Double
    var title: String
}

struct Brand: Named {
    
    var title: String
    
}

func concert(place: Location & Named, band: String) {
    print("Group \(band) protrude in \(place.title). Coordinates for GRS: \(place.lat), \(place.lon)")
}

let moscow = City(lat: 45.56464, lon: 45.557565, title: "Moscow")
let glavClub = Club(lat: 64.54654, lon: 43.545353, title: "GlavClub")
let brand = Brand(title: "Apple")

concert(place: moscow, band: "Naiw")
concert(place: glavClub, band: "Dergat'")
//---------------------------------------------------------------------------------


//        <--- Паттерны --->

//            Паттерн Делегат
// Делегатор - тот, кто ставит задачу
// Тип делегата - протокол, который описывает, какими свойствами и методами должен обладать Делегат
// Делегат - тот, кто исполняет задачу

protocol CoffeeMakerDelegate {
    func makeCoffee(amount: Int) -> Int
}

class Client {
    
    var name = "Vadeek"
    
    var coffeeMaker: CoffeeMakerDelegate?
    
    func visitCoffeeHouse(coffeeMaker: CoffeeMakerDelegate) {
        self.coffeeMaker = coffeeMaker
    }
    
    func goOutCoffeeHouse() {
        self.coffeeMaker = nil
    }
    
    func buyCoffee(amount: Int) {
        guard let delegate = coffeeMaker else {
            print("You're not in Coffee House")
            return
        }
        
        let count = delegate.makeCoffee(amount: amount)
        print("You bought \(count) cups of coffee")
    }
}

struct Officiant: CoffeeMakerDelegate {
    
    func makeCoffee(amount: Int) -> Int {
        let price = 350
        let count = amount / price
        return count
    }
}

struct Barista: CoffeeMakerDelegate {
    func makeCoffee(amount: Int) -> Int {
        let price = 100
        let count = amount / price
        return count
    }
}

let officiant = Officiant()

let client = Client()

client.visitCoffeeHouse(coffeeMaker: officiant)
client.buyCoffee(amount: 2000)
client.goOutCoffeeHouse()

let barista = Barista()

client.visitCoffeeHouse(coffeeMaker: barista)
client.buyCoffee(amount: 400)
client.goOutCoffeeHouse()

client.buyCoffee(amount: 600)
//---------------------------------------------------------------------------------


//        <--- Дженерики (Обобщения, Generics) --->
// Generics - обобщенные типы данных

// Equatable - равно/не равно == !=
// Comparable - сравнимые(сопоставимые) < > <= >= == !=
// CustomStringConvertible - могут быть представлены в виде строки
// Numeric - все числа

func addInts(a: Int, b: Int) -> Int {
    return  a + b
}

func add<T: Numeric>(a: T, b: T) -> T {
    return a + b
}

add(a: 56, b: 23)
add(a: 56.4, b: 23.9)


//---------------------------------------------------------------------------------


//        <--- Обработка ошибок/исключений --->

enum AuthError: Error {
    case wrongPassword
    case dataNotExists
    case serverLost
}

// Способы обработки ошибок:

// 1. Проброс ошибку ( throws - значит функция способна внутри себя сгенерировать ошибку )
func auth(login: String, password: String) throws {
    
    let trueLogin = "Vasya"
    let truePass = "123"
    
    guard login == trueLogin else {
        throw AuthError.dataNotExists
    }
    
    guard password == truePass else {
        throw AuthError.wrongPassword
    }
    
    print("Hello, Admin!")
}


// 2. Обработка ошибок с помощью блока do-catch
do {
    try auth(login: "Fedya", password: "4567")
    // var string = try ... можно сохранить в переменную для дальнейших операций
} catch AuthError.dataNotExists {
    print("Data not Exists")
} catch AuthError.wrongPassword {
    print("Wrong Password")
} catch {
    print("Some else Exception")
}


// 3. Конвертация в опциональное значение (этот метод помогает в том случае, если нам не требуется обрабатывать ошибки, а мы всего лишь хотим знать, успешно функция была выполнена или нет)
try? auth(login: "Vasya", password: "123546")


// 4. Утверждение безошибочности (в том случае, если мы точно знаем, что генерирующий ошибку код не способен сгенерировать ошибку)
try! auth(login: "Vasya", password: "123")
// try! auth(login: "Vasya", password: "12357") - ВЫЗОВЕТ ОШИБКУ!!!
//---------------------------------------------------------------------------------






var array: [Int?] = [5, 4, 6, 99, nil, nil]
var sumi = 0

// first way (force unwrapping)
for item in array {
    if item != nil {
        sumi += item!
    }
    // посчитать сумму с помощью optional binding, force unwrapping, ??
}

// second way (optional binding)
for item in array {
    if let item = item {
        sumi += item
    }
}

// third way (??)
for item in array {
    sumi += item ?? 0
}





var studentsJournal: [String:Int] = ["Vasya _":4, "Gena _":3, "Jora _":5, "Olesya _":5, "Alexander _":2]
var summi = 0.0

studentsJournal.updateValue(5, forKey: "Vasya _")
studentsJournal.updateValue(4, forKey: "Alexander _")
studentsJournal.updateValue(4, forKey: "Michael _")
studentsJournal.updateValue(3, forKey: "Maxim _")
studentsJournal.removeValue(forKey: "Vasya _")
studentsJournal.removeValue(forKey: "Olesya _")

for value in studentsJournal.values {
    summi += Double(value)
}
summi
summi /= Double(studentsJournal.count)





var monthDays = ["Jan":31, "Feb":28, "Mar":31, "Apr":29, "May":31, "Jun":30, "Jul":29, "Aug":31, "Sep":30, "Oct":31, "Nov":30, "Dec":31]

for (month, days) in monthDays {
    print(month, days)
}

for month in monthDays.keys {
    print("\(month) - \(monthDays[month]!)")
}





var chess = [String:Bool]()

var letters = ["A", "B", "C", "D", "E", "F", "G", "H"]
var numberss = Array(1...8)

for (index, value) in letters.enumerated() {
    for num in numberss {
        var str = "\(value)\(num)"
        guard (index + num) % 2 == 0 else {
            chess.updateValue(false, forKey: str)
            continue
        }
        chess.updateValue(true, forKey: str)
    }
}
chess.count


// A - 0 - Black (false)
// B - 1 - White (true)

// key - A1, value - true/false
// true - white
// false - black

    




let strin = "dwjdkandkjnk, andk, dwkdwaklda. dwkaldmawlkd2322. 21 askald, sldka;, ald;sa 'dawdsa', wad. 12lk;lk, 2112121."

var sumLetters = 0
var sumNums = 0
var sumSigns = 0

for i in strin {
    switch i {
    case "0","1","2","3","4","5","6","7","8","9":
        sumNums += 1
    case ".",",",";","'":
        sumSigns += 1
    default:
        if i != " " {
            sumLetters += 1
            break
        }
        break
    }
}
sumSigns
sumLetters
sumNums





let personFirstName = "Mihail"
let personSecondName = "Zubenko"
let personOtchestvo = "Petrovich"

switch (personFirstName, personSecondName, personOtchestvo) {
case (let first, _, _) where first.lowercased().first == "o" || first.lowercased().first == "a":
    print("\(first)")
case (let first, _, let otchestvo) where otchestvo.lowercased().first == "v" || otchestvo.lowercased().first == "d":
    print("\(first) \(otchestvo)")
case (_, let second, _) where second.lowercased().first == "z" || second.lowercased().first == "e":
    print("\(second)")
default:
    print("\(personSecondName) \(personFirstName) \(personOtchestvo)")
    break
}
// имя на о или а, то по имени
// отчество на в или д, то имя и отчество
// фамилия на з или е, то фамилия
// дефолт имя отчество фамилия





// 4.
// Поле 10х10 Морской Бой
// Осталось несколько кораблей, несколько подбито. Длинные/однопоинтные корабли
// Свитч получает tuple point(x,y) -> мимо/ранил/убил



