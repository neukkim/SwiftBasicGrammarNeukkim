// 27_고차함수
// hgher-order function

/*
 전달인자로 함수를 전달 받거나
 함수실행 결과를 함수로 반환하는 함수
 
 map filter reduce
 
 */

// map
// 컨테이너 내부의 기존 데이터를 변형(transsform)하여 새로운 컨테이너 생성

let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int]
var strings: [String]

// for 사용
doubledNumbers = [Int]()
strings = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers)
print(strings)


// map 사용

doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubledNumbers)
print(strings)


//매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
doubledNumbers = numbers.map { $0 * 2 }

print(doubledNumbers)


// filter
// 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출

//for 사용
var filtered: [Int] = [Int]()

print(numbers)

for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}

print(filtered)


//filter 메서드 사용

// return 이 true 일떄만 반환
let evenNumbers: [Int] = numbers.filter {
    (number: Int) -> Bool in
    return number % 2 == 0
}

print(evenNumbers)

// 후행 클로저로 표현

let oddNumbers: [Int] = numbers.filter {
    $0 % 2 != 0
//    $0 % 2 == 0
}

print(oddNumbers)


//reduce
// 커테이너 내부의 콘텐츠를 하나로 통합

let someNumbers: [Int] = [2, 8, 15] // 2 + 8 + 15 = 25

//for 사용

var result: Int = 0

for number in someNumbers {
    result += number
}

print(result)


// 메서드 사용
let sum: Int = someNumbers.reduce(0, {
    (first: Int, second: Int) -> Int in
    return first + second
})

print(sum)

//내부 모든값 뺍니다.

//first는 누적값, second는 배열에서 처리중인 값
let subtract: Int = someNumbers.reduce(0, {
    (first: Int, second: Int) -> Int in
    return first - second
})

print(subtract)

print(someNumbers)

let sumFromThree = someNumbers.reduce(3) { $0 + $1 }

print(sumFromThree)
