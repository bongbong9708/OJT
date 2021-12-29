import UIKit

// MARK: - 데이터 타입 안심, 추론
var greeting = "Hello, playground"

let a = 12

let plus = greeting + String(a)   // 정수형을 문자형으로 형변환하지 않을 시 에러

print(plus)

var name = "SangBong"   // 타입을 지정하지 않았으나 타입 추론을 통해 String 타입으로 선언

//name = 100    // name은 타입 추론에 의해 String 타입으로 지정되어 정수를 할당하려고 하면 오류 발생




// MARK: - 타입별칭
typealias MyName = String
//var name: MyName = "상봉"
//print(name)   // 상봉

enum FruitType {
  case apple
  case banana
  case orange
}

typealias juiceRecipe = [FruitType : Int]



// MARK: - 튜플

//var person: (String, Int, Double) = ("SangBong", 25, 180.0)
//print(person.0)
//
//print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")    // 이름: SangBong, 나이: 25, 신장: 180.0
//
//// 인덱스를 통해 값을 할당할 수 있습니다.
//person.1 = 26
//person.2 = 179.2
//
//print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")    // 이름: SangBong, 나이: 26, 신장: 179.2

var person: (name: String, age: Int, height: Double) = ("SangBong", 25, 180.0)

print("이름: \(person.name), 나이: \(person.age), 신장: \(person.height)")    // 이름: SangBong, 나이: 25, 신장: 180.0

// 요소 이름 및 인덱스를 통해 값을 할당할 수 있습니다.
person.age = 26
person.2 = 179.2

print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")    // 이름: SangBong, 나이: 26, 신장: 179.2

typealias PersonTuple = (name: String, age: Int, height: Double)

let me: PersonTuple = (name: "SangBong", age: 25, height: 180.0)
let you: PersonTuple = (name: "Chae", age: 23, height: 165.7)

print("이름: \(me.name), 나이: \(me.age), 신장: \(me.height)")    // 이름: SangBong, 나이: 25, 신장: 180.0
print("이름: \(you.name), 나이: \(you.age), 신장: \(you.height)")   // 이름: Chae, 나이: 23, 신장: 165.7



// MARK: - 배열

// 배열의 선언과 생성
//var names: Array<String> = ["sangbong", "chulsoo", "yunghee"]
//var names: [String] = ["sangbong", "chulsoo", "yunghee"]    // 위와 같은 표현 1
var names = ["sangbong", "chulsoo", "yunghee"]              // 위와 같은 표현 2

//var emptyArray: [Any] = [Any]()         // Any 데이터를 요소로 갖는 빈 배열을 생성
//var emptyArray: [Any] = Array<Any>()    // 위와 같은 표현

var emptyArray: [Any] = []
print(emptyArray.isEmpty)   // true
//print(names.count)          // 4


// 배열의 사용
//print(names[0])       // sangbong
//names[2] = "jenny"
//print(names[2])       // jenny
//print(names[3])       // 인덱스 범위를 벗어나서 오류 발생
//
//names.append("elsa")    // Array의 마지막에 데이터 추가 ["sangbong", "chulsoo", "yunghee", "elsa"]
//names.insert("happy", at: 2)    // 원하는 위치에 데이터 추가 ["sangbong", "chulsoo", "happy", "yunghee", "elsa"]
//names.removeFirst()   // 첫번째 데이터 삭제
//names.removeLast()    // 마지막 데이터 삭제
//names.removeAll()   // 모든 데이터 삭제

//var names = ["sangbong", "chulsoo", "happy", "yunghee", "elsa"]

let threeNames = names.filter{ $0.count == 7}

print(threeNames)

print(names[0])

for name in names {
  print(name)
 }
 // sangbong
 // chulsoo
 // happy
 // yunghee
 // elsa

 // 배열의 값과 인덱스가 필요할 때는 enumerated() 메소드 사용
for (index, value) in names.enumerated() {
  print("\(index + 1). \(value)")
}
// 1. sangbong
// 2. chulsoo
// 3. happy
// 4. yunghee
// 5. elsa

var numberForName: [String: Int] = ["sangbong": 25, "chulsoo": 15, "jenny": 35]

print(numberForName.isEmpty)    // false
print(numberForName.count)    // 3
print(numberForName["sangbong"]!)    // 25
//print(numberForName["minji"]!)   // nil

numberForName["max"] = 999    // max라는 키로 999 추가
print(numberForName["max"]!)    // 999

numberForName.removeValue(forKey: "sangbong")

print(numberForName["sangbong"])





// MARK: - 세트
// 세트의 생성
//var names: Set<String> = Set<String>()
//var names: Set<String> = []

//var names: Set<String> = ["sangbong", "chulsoo", "happy", "yunghee", "sangbong"]
print(names.count)    // 4

//var numbers: [100, 200, 300]    // 타입 추론을 사용하게 되면 컴파일러는 Set가 아닌 Array로 타입 지정
let firstSet:Set<String> = ["sangbong", "chulsoo", "yunghee", "happy"]
let secondSet:Set<String> = ["sangbong", "chulsoo", "jenny", "elsa"]
// 1. 교집합 : ["sangbong", "chulsoo"]
let intersectSet:Set<String> = firstSet.intersection(secondSet)
// 2. 여집합 : ["yunghee", "happy", "jenny", "elsa"]
let symmetricDiffSet:Set<String> = firstSet.symmetricDifference(secondSet)
// 3. 합집합 : ["sangbong", "chulsoo", "yunghee", "happy", "jenny", "elsa"]
let unionSet:Set<String> = firstSet.union(secondSet)
// 4. 차집합 : ["yunghee", "happy"]
let subtractSet:Set<String> = firstSet.subtracting(secondSet)
// #. 정렬 : ["chulsoo", "elsa", "happy", "jenny", "sangbong", "yunghee"]
print(unionSet.sorted())





// MARK: - Map
let numbers: [Int] = [0, 1, 2, 3, 4, 5]

var doubleNumbers: [Int] = [Int]()
var strings: [String] = [String]()

// for-in 구문 사용
for number in numbers {
  doubleNumbers.append(number*2)
  strings.append("\(number)")
}

print(doubleNumbers)
print(strings)


// map 메서드 사용
doubleNumbers = numbers.map({ (number: Int) -> Int in
  return number * 2
})
strings = numbers.map({ (number: Int) -> String in
  return "\(number)"
})

print(doubleNumbers)    // [0, 2, 4, 6, 8]
print(strings)    // ["0", "1", "2", "3", "4"]

//let numbers: [Int] = [0, 1, 2, 3, 4]





// MARK: - filter
let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
  return number % 2 == 0
}

print(evenNumbers)

let oddNumbers: [Int] = numbers.filter{ $0 % 2 == 1 }
print(oddNumbers)

//let numbers: [Int] = [0, 1, 2, 3, 4, 5]

let mappedNumbers: [Int] = numbers.map{ $0 + 3 }

let evenNumbers1: [Int] = mappedNumbers.filter { (number: Int) -> Bool in
  return number % 2 == 0
}

print(evenNumbers1)    // [4, 6, 8]

// 메서드를 체인처럼 연결하여 사용할 수 있습니다.
let oddNumbers1: [Int] = numbers.map{ $0 + 3}.filter{ $0 % 2 == 1 }
print(oddNumbers1)   // [3, 5, 7]




// MARK: - Reduce
// reduce 메서드 사용
let numberArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//let sum = numberArray.reduce(0){ $0 + $1 }
//print(sum)    // 55

let sum = numberArray.reduce(0, {(first: Int, second: Int) -> Int in
  return first + second
})
print(sum)    // 55

enum Gender {
  case male, female, unknown
}

struct Friend {
  let name: String
  let gender: Gender
  let location: String
  var age: UInt
}

var friends: [Friend] = [Friend]()

friends.append(Friend(name: "sangbong", gender: .male, location: "천안", age: 25))
friends.append(Friend(name: "chulsoo", gender: .male, location: "서울", age: 30))
friends.append(Friend(name: "yunghee", gender: .female, location: "부산", age: 30))
friends.append(Friend(name: "elsa", gender: .female, location: "인천", age: 25))

var result: [Friend] = friends.map{ Friend(name: $0.name, gender: $0.gender, location: $0.location, age: $0.age) }

result = result.filter{ $0.location != "서울" && $0.age >= 26 }

let string: String = result.reduce("서울 외의 지역에 거주하며 26세 이상인 친구") {
    $0 + "\n" + "\($1.name) \($1.gender) \($1.location) \($1.age)세"
}

print(string)





// MARK: - 열거형(코드를 재사용한 경우 주석처리)

// 열거형

//enum CompassPoint: String {
//  case east = "동"
//  case west = "서"
//  case south = "남"
//  case north = "북"
//}
//
//let myHomeCompassPoint: CompassPoint = CompassPoint.south
//print("우리 집은 \(myHomeCompassPoint.rawValue)쪽에 있습니다.")
// 우리 집은 남쪽에 있습니다.

// 원시값
enum WeekDays: Character {
  case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금", sat = "토", sun = "일"
}
let today: WeekDays = WeekDays.fri
print("\(today.rawValue)요일 좋아~")

enum CompassPoint: String {
  case east = "동"
  case west
  case south = "남"
  case north = "북"
}

let myHomeCompassPoint: CompassPoint = CompassPoint.west
print("우리 집은 \(myHomeCompassPoint.rawValue)쪽에 있습니다.")   // 우리 집은 west쪽에 있습니다.

enum Numbers: Int {
  case zero
  case one
  case two
  case ten = 10
}
print("\(Numbers.zero.rawValue),\(Numbers.one.rawValue),\(Numbers.two.rawValue),\(Numbers.ten.rawValue)")

// 연관 값

//enum PastaTaste {
//    case cream, tomato
//}
//
//enum PizzaDough {
//    case cheeseCrust, thin, original
//}
//
//enum PizzaTopping {
//    case pepperoni, cheese, bacon
//}
//
//enum MainDish {
//  case pasta(taste: PastaTaste)
//  case pizza(dough: PizzaDough, topping: PizzaTopping)
//  case chicken(withSource: Bool)
//  case rice
//}

//extension MainDish {
//    func printMainDish() {
//        switch mainDish {
//        case .pasta(taste: let taste):
//            print("\(taste) pasta")
//        case .pizza(dough: let dough, topping: let topping):
//            print("\(dough) dough + \(topping) topping pizza")
//        case .chicken(withSource: let withSource):
//            print("\(withSource) chicken")
//        case .rice :
//            print("밥추가")
//            break
//        }
//    }
//}
//
//var mainDish: MainDish = MainDish.pizza(dough: .cheeseCrust, topping: .pepperoni)
//mainDish.printMainDish()
//mainDish = MainDish.pizza(dough: .cheeseCrust, topping: .pepperoni)
//mainDish = .chicken(withSource: true)


//var dinner: MainDish = MainDish.pasta(taste: .tomato)
//dinner = MainDish.pizza(dough: .cheeseCrust, topping: .pepperoni)
//dinner = .chicken(withSource: true)
//dinner = .rice

// 항목 순회

// 플랫폼별로 사용조건을 추가하는 경우
enum School: String, CaseIterable {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    @available(iOS, obsoleted: 12.0)
    case graduate = "대학원"
    
    static var allCases: [School] {
        let all: [School] = [ .primary,
                              .elementary,
                              .middle,
                              .high,
                              .college,
                              .university]
        #if os(iOS)
        return all
        #else
        return all + [.graduate]
        #endif
    }
}

let allCases: [School] = School.allCases
print(allCases)

// 특정 케이스를 플랫폼에 따라 사용할 수 있거나 없는 경우가 생기면 CaseIterable 프로토콜을 채택하는 것만으로는 allCases 프로퍼티를 사용할 수 없습니다.
// 이럴 때는 allCases 프로터리를 구현해 주어야 합니다.
// 연관 값을 갖는 열거형의 항목 순회
enum PastaTaste: CaseIterable {
    case cream, tomato
}

enum PizzaDough: CaseIterable {
    case cheeseCrust, thin, original
}

enum PizzaTopping: CaseIterable {
    case pepperoni, cheese, bacon
}

enum MainDish: CaseIterable {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSource: Bool)
    case rice

    static var allCases: [MainDish] {
        return PastaTaste.allCases.map(MainDish.pasta)
        + PizzaDough.allCases.reduce([]) { (result, dough) -> [MainDish] in
            result + PizzaTopping.allCases.map{ (topping) -> MainDish in
                MainDish.pizza(dough: dough, topping: topping)
            }
        }
        + [true, false].map(MainDish.chicken)
        + [MainDish.rice]
    }
}

print(MainDish.allCases.count)      // 14
print(MainDish.allCases)

// 순한 열거형의 사용
//let five = ArithmeticExpression.number(5)
//let four = ArithmeticExpression.number(4)
//let sum = ArithmeticExpression.addition(five, four)
//let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
//
//func evaluate(_ expression: ArithmeticExpression) -> Int {
//    switch expression {
//    case .number(let value):
//        return value
//    case .addition(let left, let right):
//        return evaluate(left) + evaluate(right)
//    case .multiplication(let left, let right):
//        return evaluate(left) * evaluate(right)
//    }
//}
//
//let result: Int = evaluate(final)
//print("(5 + 4) * 2 = \(result)")    // (5 + 4) * 2 = 18

// 비교 가능한 열거형
enum Condition: Comparable {
    case terrible
    case bad
    case good
    case great
}

let myCondition: Condition = Condition.great
let yourCondition: Condition = Condition.bad

if myCondition >= yourCondition {
    print("제 상태가 더 좋군요")
} else {
    print("당신의 상태가 더 좋아요")
}
// 제 상태가 더 좋군요

enum Device: Comparable {
    case iPhone(version: String)
    case iPad(version: String)
    case macBook
    case iMac
}

var devices: [Device] = []
devices.append(Device.iMac)
devices.append(Device.iPhone(version: "14.3"))
devices.append(Device.iPhone(version: "6.1"))
devices.append(Device.iPad(version: "10.3"))
devices.append(Device.macBook)

let sortedDevices: [Device] = devices.sorted()
print(sortedDevices)





// MARK: - Optionals(옵셔널, 옵셔널 강제추출, 옵셔널 바인딩, 암시적 추출 옵셔널)

// 옵셔널
//var myName: String? = "sangbong"
//print(myName)   // sangbong

myName = nil
print(myName)   // nil

let graduated = School(rawValue: "석박사")

var myName: String? = "sangbong"
print(myName)       // Optional("sangbong")
print(myName!)      // sangbong

// 옵셔널 강제추출
myName = nil

if myName != nil {
    print("My name is \(myName!)")
} else {
    print("myName == nil")
}
// myName == nil

// 옵셔널 바인딩
var myAge: Int? = 25
var yourAge: Int? = nil

if let age = myAge, let friend = yourAge {
    print("We are friend! \(age) & \(friend)")
} else {
    print("Age == nil")
}
// Age == nil

// 암시적 추출 옵셔널
var myHeight: Int! = 179
print(myHeight)     // Optional(179)
myHeight = nil

if let height = myHeight {
    print("My height is \(height)")
} else {
    print("myHeight == nil")
}
//  myHeight.isEmpty - 오류 발생





// MARK: - Guard(if-guard 비교, 옵셔널 바인딩 활용)

// if 구문을 사용한 코드
for i in 0...3 {
    if i == 2 {
        print(i)
    } else {
        continue
    }
}

// guard 구문을 사용한 코드
for i in 0...3 {
    guard i == 2 else {
        continue
    }
    print(i)
}

// guard 구문의 옵셔널 바인딩 활용
func greet(_ person: [String: String]) {
    guard let name: String = person["name"] else {
        return
    }
    print("Hello \(name)!")
    
    guard let location: String = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }

    print("I hope the weather is nice in \(location)")
}

var personInfo: [String: String] = [String: String]()
personInfo["name"] = "elsa"

greet(personInfo)
// Hello elsa!
// I hope the weather is nice near you

personInfo["location"] = "Korea"

greet(personInfo)
// Hello elsa!
// I hope the weather is nice in Korea





// MARK: - 구조체

// 구조체 정의
struct BasicInformation {
    var name: String
    var age: Int
}

// 프로퍼티 이름으로 자동 생성된 이니셜라이저를 사용하여 구조체 생성
var mobileInfo: BasicInformation = BasicInformation(name: "sangbong", age: 25)
print("\(mobileInfo.name)는 \(mobileInfo.age)살입니다. ")

mobileInfo.name = "galio"
mobileInfo.age = 100

print("\(mobileInfo.name)는 \(mobileInfo.age)살입니다. ")

// 상수 let으로 선언하면 인스턴스 내부의 값을 변경할 수 없다.




// MARK: - 클래스

// 클래스 정의
// 클래스는 상속을 받을 수 있어 상속을 받을 때는 클래스 이름 뒤어 콜론(:)을 써주고 부모클래스 이름을 명시
class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

class PersonAdult: Person {
    var name: String = ""
    var age: Int = 0
}
// 클래스를 정의한 후, 인스턴스를 생성하고 초기화하자고 할때는 기본적인 이니셜라이저를 사용
// Person 클래스에서는 프로퍼티 기본값이 지정되어 있으므로 전달인자를 통해 따로 초깃값을 전달해주지 않아도 됌


// 클래스의 인스턴스 생성 및 사용
var sangbong: PersonAdult = PersonAdult()
sangbong.height = 123.45
sangbong.weight = 123.45
sangbong.name = "sangbong"
sangbong.age = 25

print(sangbong.height)

var jenny: Person = Person()
jenny.weight = 234.56
//jenny.name = "jenny"      // 에러 발생


// 클래스 인스턴스의 생성 및 소멸
class PersonDeinit {
    var height: Float = 0.0
    var weight: Float = 0.0
    
    deinit {
        print("PersonDeinit 클래스의 인스턴스가 소멸")
    }
}

var yagom: PersonDeinit? = PersonDeinit()
yagom = nil     // nil

// 값 타입과 참조 타입의 차이
// 값 타입
struct BasicInfo {
    let name: String
    var age: Int
}

var bongInfo: BasicInfo = BasicInfo(name: "sangbong", age: 25)
bongInfo.age = 100

// bongInfo의 값을 복사하여 할당
var galioInfo: BasicInfo = bongInfo

print("bong's age: \(bongInfo.age)")        // bong's age: 100
print("galio's age: \(galioInfo.age)")      // galio's age: 100

galioInfo.age = 999

print("bong's age: \(bongInfo.age)")        // bong's age: 100
print("galio's age: \(galioInfo.age)")      // galio's age: 999
// galioInfo는 bongInfo의 값을 복사해왔기 때문에 별개의 값을 갖는다.


// 참조타입
class People {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var bongbong: People = People()
var gagalgang: People = bongbong
// bongbong의 참조를 할당합니다.

print("bongbong's weight: \(bongbong.weight)")      // bongbong's weight: 0.0
print("gagalgang's weight: \(gagalgang.weight)")        // gagalgang's weight: 0.0

gagalgang.weight = 123.4
print("bongbong's weight: \(bongbong.weight)")      // bongbong's weight: 123.4
// gagalgang은 bongbong을 참조하기 때문에 값이 변동됩니다.

print("gagalgang's weight: \(gagalgang.weight)")        // gagalgang's weight: 123.4
// 이를 통해 bongbong이 참조하는 곳과 gagalgang이 참조하는 곳이 같음을 알 수 있습니다.


//var bongbong: People = People()
let garen: People = bongbong        // bongbong의 참조를 할당
let darius: People = People()       // 새로운 인스턴스를 생성합니다.

print(bongbong === garen)       // true
print(bongbong === darius)      // false
print(garen !== darius)         // true
