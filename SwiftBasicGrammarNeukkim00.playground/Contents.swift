

print("test")




////야곰문법_01_상수와 변수

let constant: String = "상수"
var variable: String = "변수"

//나중에 할당하려고 하는 상수나 변수 타입을 꼭 명시
let sum: Int
let inputA: Int = 100
let inputB: Int = 200

//선언후 첫 할당
sum = inputA + inputB

//아래와 같이 첫 할당 이후 변경 불가
//sum = 123




////야곰문법_02_기본 데이터 타입

// Bool
var someBool: Bool = true
someBool = false

// swift에서 0,1 값 정수 불가
//someBool = 0
//someBool = 1

// Int
var someInt: Int = -100

//아래는 double 타입이라 할당 불가 하다 한다.
//someInt = 100.1

// UInt
var someUINT: UInt = 100

//아래 오류
//someUINT = -100
//someUINT = someInt

// Float 32bit
var someFloat: Float = 3.14
someFloat = 3

// Double 64bit
var someDouble: Double = 3.14
someDouble = 3

//Float 타입을 Double에 넣어 줄수 없음
//someDouble = someFloat

// Character
var someCharacter: Character = "ㅁ"
//아래 String 이라 안된다 함
//someCharacter = "ㅁㅁㅁ"

// String
var someString: String = "ㅁㄴㅁㄴ"
someString = someString + "임다"


//캐릭터 타입 스트링 타입에 대입 불가
//someString = someCharacter

////야곰문법_03_Any_Anyobject_nil

/*
Any - swift 모든 타입 지칭 키워드
AnyObject - 모든 클래스 타입 지칭 프로토콜
nil - 없음을 의미하는 키워드
 */

// Any
var someAny: Any = 100
someAny = "어떤 타입도 수용 가능"
print(someAny)
someAny = 123.22
print(someAny)

//불가
//let someDouble: Double = someAny

// AnyObject
class SomeClass {}
var someAnyObject: AnyObject = SomeClass()

//class 인스턴스가 아닌 Double 입력 불가
//someAnyObject = 123.21

//아래 대입 불가
//someAny = nil
//someAnyObject = nil


