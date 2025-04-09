// 09_옵셔널_optional

//값이 있을 수도, 없을 수도 있음
// 명시적으로 nil(없음)의 가능성을 표현

let optionalConstant: Int? = nil

//아래 불가
//let someConstant: Int = nil

//아래 같은 표현으로 ? 들어 간것은 간략 표현
//Optional 타입
let optionalValue: Optional<Int> = nil
let optionalValue2: Int? = nil

// 10_옵셔널_optional_값_추출
//Optional Unwrapping

/*
 방법
 1. Optional Binding 옵셔널 바인딩
 : 옵셔널의 값을 꺼내오는 방법 중 하나
 nil 체크 + 안전한 값 추출
 
 2. Force Unwrapping 강제 추출
 */

func printName(_ name: String) {
    print(name)
}

var myName: String? = nil

//아래 오류
//  printName은 String 타입을 받지만,
//  myName의 타입은 Optional이다.
//. String? = Optional<Int>

//printName(myName)


func printName2(_ name: String) {
    print(name)
}

var myName2: String! = nil

if let name: String = myName2 {
    printName2(name)
} else {
    print("myName == nil")
}

////

var myName3: String? = "min"
var yourName3: String? = nil

if let name = myName3, let friend = yourName3 {
    print("\(name) and \(friend)")
}

print("////////////////")

yourName3 = "kim"

if let name = myName3, let friend = yourName3 {
    print("\(name) and \(friend)")
}

// 옵셔널 강제 추출
func printName4(_ name: String) {
    print(name)
}

var myName4: String? = "min"

//아래 강제 추출 되어야 하는데 에러 발생
//printName4(myName!)

myName4 = nil

//아래 강제 추출은 nil로 값이 없다. 그래서 에러 발생
//print(myName4!)

var yourName4: String! = nil

//아래 nil 이기에 런타임 에러 발생
//printName4(yourName4)

