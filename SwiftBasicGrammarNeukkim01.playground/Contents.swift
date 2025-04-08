//04_컬렉션타입_Array_Dictionary_Set

/*
 Array - 순서가 있는 리스트 컬렉션
 Dictionary - 키와 값의 쌍으로 이루어짐
 Set - 순서 없음, 멤버가 유일 컬렉션
 */

// Array

var integers: Array<Int> = Array<Int>()
integers.append(1)
integers.append(100)
integers.append(90)
integers.append(90)

// 아래 float 타입을 int에 대입 할려니 불가
//integers.append(100.1)

integers.contains(100)
integers.contains(99)
integers

integers.remove(at: 0)
integers.removeLast()
integers

integers.count

//비어 있는 배열의 값은 에러를 출력한다.
//integers[1]

//var doubles: Array<Double> = Array<Double>()
//위, 아래 동일 표현
var doubles: Array<Double> = [Double]()

doubles

///빈 String Array 생성, 배열의 다른 푠현법
var Strings: [String] = [String]()

//빈 Character Array 생성, 배열 다른 축약 표현법
var characters: [Character] = []

// elt Array
let immutableArray = [1, 2, 3]

//아래 let Array이로 불가
//immutableArray.append(5)
//immutableArray.removeAll()



// Dictionary
// Key가 String,       Value가 Any인 빈 Dictionary
var anyDictionary: Dictionary<String, Any> = [String: Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100
anyDictionary["theotherKey"] = 999
anyDictionary["theotherKey2"] = 1234

anyDictionary.description
anyDictionary.count

anyDictionary["someKey"] = "dictionary"

anyDictionary.removeValue(forKey: "anotherKey")
anyDictionary.count

anyDictionary.description


anyDictionary["someKey"] = nil
anyDictionary.count

anyDictionary.description
anyDictionary.count

let EmptyDictionary: [String: String] = [:]
let initalizedDictionary: [String: String] = ["name": "min", "gender": "male"]

initalizedDictionary["name"]

//아래 오류. name Key에 value 있을지 없지 모르는 불확실성 때문
//GPT한테 물어보면 해결 방법, 공부가 될수 있다.
//let someValue: String = initalizedDictionary["name"]

// Set
// 중복값 없음
var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)

integerSet.description
integerSet.contains(1)
integerSet.contains(80)

integerSet.remove(100)
integerSet.description
integerSet.removeFirst()
integerSet.description

let SetA: Set<Int> = [1, 2, 3, 4, 5]
let SetB: Set<Int> = [3, 4, 5, 6, 7]

let union: Set<Int> = SetA.union(SetB)
union.description

let sortedUnion: [Int] = union.sorted()

let intersection: Set<Int> = SetA.intersection(SetB)
intersection.description

let subtracting: Set<Int> = SetA.subtracting(SetB)
subtracting.description

let subtracting2: Set<Int> = SetB.subtracting(SetA)
subtracting2.description
