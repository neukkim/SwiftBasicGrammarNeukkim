// 07_조건문

// if, else if, else

let someInteger = 100

if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100초과")
} else {
    print("100")
}

// 조건문은 항상 Bool 타입



// 범위 연산자를 활용으로 유용
switch someInteger {
case 0:
    print("zero")
case 1..<100:
    print("1~99")
case 100:
    print("100")
case 101...Int.max:
    print("over 100")
default:
    print("unknown")
}

//정수 외 대부분 기본 타입 사용 가능
switch "lee" {
case "kim", "mina":
    print("kim")
case "lee":
    print("lee")
//brake 사용 안해도 알아서 걸림, 암시적으로
//brake
    
    //별히 다음 case도 실행하고 싶을 때
    fallthrough
case "min":
    print("min")
default:
    print("unknown")
}

// 08_반복문
// for-in, while, repeat-while

var integers = [1, 2, 3]
let people = ["min": 10, "kim": 15, "Lee": 12]

for integer in integers {
    print(integer)
}

for (name, age) in people {
    print("\(name): \(age)")
}


// while

integers.count
while integers.count > 2 {
    integers.removeLast()
}
integers.count


// repeat-while 다른 구문의 do-while과 같다
integers.append(88)
integers.append(99)
integers.count

repeat {
    integers.removeLast()
} while integers.count > 0;

integers.count
