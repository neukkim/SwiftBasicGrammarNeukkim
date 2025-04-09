
// 05_함수function


// 선언
// func 함수이름(매개변수1이름: 매개변수 1타입, 매개변수2이름: 매개변수2타입 ... ) -> 반환타입 {
//    함수 구현부
//    return 반환값
//}

func sum(a: Int, b: Int) -> Int {
    return a + b
}


// 반환 값이 없는 함수
/*
 func 함수이름(매개변수1이름: 매개변수 1타입, 매개변수2이름: 매개변수2타입 ... ) -> Void {
    함수 구현부
    return
 }
 */

func printMyName(name: String) -> Void {
    print(name)
}

//매개변수가 O, 반환값 생략 가능
func printYourName(name: String) {
    print(name)
}

printYourName(name: "min")
sum(a: 1, b: 2)


//매개변수가 없는 함수
/*
 func 함수이름() - > 반환타입 {
    함수 구현부
    return 반환값
 }
 */

func maximumIntegerValue() -> Int {
    return Int.max
}


//매개변수, 반환값 없는 함수
/*
 func 함수이름() -> Void {
    함수 구현부
    return
 }
 */

func hello() -> Void { print("hello")}

hello()

func bye() { print("bye")}


// 함수 호출
sum(a: 3, b: 5)
//...




//06_함수_고급


// 매개변수 기본값
// me: String = "min" 이라는 기본값 적용
func greeting(friend: String, me: String = "min") {
    print("Hell \(friend) \(me)")
}

greeting(friend: "hana")
greeting(friend: "hana", me: "Lee")


// 전달인자 레이블
// 함수 이름은 같지만 파라메터 형식이 다르다
func greeting(to friend: String, from me: String) {
    print("hello \(friend) \(me)")
}

greeting(to: "min", from: "kim")


// 가변 매개변수
/*
 전달 받을 값의 개수를 알기 어려움
 가변 매개변수는 함ㅅ후당 하나만 가짐
 */

func sayHelloToFriends(me: String, friends:String...) -> String {
    return "Hello \(friends) I'm \(me)"
}

print(sayHelloToFriends(me: "min", friends: "hana", "Lee", "han"))

//가변 매개변수에 nill 불가
//print(sayHelloToFriends(me: "min", friends: nil)

//가변 매개변수에 nill 불가 이며 생략 가능
print(sayHelloToFriends(me: "min"))


// 데이터 타입으로서의 함수
// 함수형 프로그래밍 패러다임,
// 스위프트는 함수 일급객체임 변수 상수 등 저장 가능
// 배개변수를 통해 전달 가능

var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("min2", "kim2")
print(someFunction("min", "kim"))


//아래 ???????
//someFunction = greeting(friend:me:)
//someFunction("min3", "kim3")
