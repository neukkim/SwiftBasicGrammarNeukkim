// 15_클로저

// 익명함수: 함수 이름이 없는 함수
// 함수: 이름이 있는 클로저
/*
 코드의 블럭
 일급 시민(first-citizen)
 변수, 상수 등으로 저장, 전달인자로 전달 가능
 */

//함수 사용
func sumFunction(a: Int, b: Int) -> Int {
    return a + b
}

var sumResult: Int = sumFunction(a: 1, b: 2)


var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

sumResult = sum(2, 3)

/*
 함수는 클로저의 일종
 sum 변수에 당연히 함수도 할당 가능
 */
sum = sumFunction(a:b:)

sumResult = sum(4, 5)


// 함수의 전달 인자로서의 클로저

let add: (Int, Int) -> Int

add = { (a: Int, b: Int) -> Int in
    return a + b
}

let substract: (Int, Int) -> Int
substract = { (a: Int, b: Int) -> Int in
    return a - b
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b:Int) -> Int in
    return a / b
}


func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var calculated: Int

calculated = calculate(a: 50, b: 10, method: add)

calculated = calculate(a: 50, b: 10, method: substract)

calculated = calculate(a: 50, b: 10, method: divide)


calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
return left * right
})








/* ---------------------------------------------------------------*/
func add0(x: Int, y: Int) -> Int {
    return(x+y)
}

print(add0(x: 10, y: 20))


let add1 = { (x: Int, y: Int) -> Int in
    return(x+y)
}


print(add1(30, 50))

// 후행 클로저??

func sayHello() {
    print("1Hello")
}
sayHello()

let hello = {
    print("Hello")
}
hello() // 실행 → Hello


// 클로저 사요 예시
func performTask(task: () -> Void) {
    print("작업 시작")
    task()
    print("작업 끝")
}

performTask {
    print("파일 다운로드 중...")
}

// 클로저 개념이 완전 빠진 예시
func startTask() {
    print("작업 시작")
    downloadFile()
    print("작업 끝")
}

func downloadFile() {
    print("파일 다운로드 중...")
}

startTask()


// 16_클로저_고급

/*
 후행 클로저
 반환타입 생략
 단축 인자이름
 암시적 반환 표현
 */

func calculate1(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var result1: Int

/*
 후행 클로저
 클로저가 함수의 마지막 전달 인자라면
 마지막 매개변수 이름을 생략한 후
 함수 소괄호 외부에 클로저를 구현할 수 있음.
 */

result1 = calculate1(a: 10, b: 10) { (left: Int, right: Int) -> Int in
    return left + right
}
                     
print(result1)


// 반환타입 생략
/*
 calculate1 함수의 method 매개변수는
 Int 타입을 반환할 것이라는 사실을 컴파일러도 알기에
 굳이 클로저에서 반환타입을 명시해 주지 않아도 됨
 대신 in 키워드 생략 불가
 */

result1 = calculate1(a: 10, b: 10, method: {(left: Int, right: Int) in
    return left + right
})
print(result1)


// 후행클로저와 함께 사용
result1 = calculate1(a: 10, b: 10) { (left: Int, right: Int) in
    return left + right
}
print(result1)


// 단축 인자이름
result1 = calculate1(a: 10, b: 10, method: {
    return $0 + $1
})
print(result1)

// 단축 인자 이름 + 후행 클로저
result1 = calculate1(a: 10, b: 10) {
    return $0 + $1
}
print(result1)


// 암시적 반환 표현
result1 = calculate1(a: 10, b: 10) {
    $0 + $1
}
print(result1)

// 한줄로 간결 하게 사용
result1 = calculate1(a: 10, b: 10) { $0 + $1 }
print(result1)


// 축약 이전 후 문법 비교

result1 = calculate1(a: 10, b: 10, method: { (left: Int, right: Int) -> Int in
    return left + right
})

result1 = calculate1(a: 10, b: 10) {
    $0 + $1
}
print(result1)
