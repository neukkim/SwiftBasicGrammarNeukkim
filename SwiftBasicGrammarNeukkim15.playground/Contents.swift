// 23_assert_guard

/*
 애플리케이션이 동작 도중에 생성하는 다양한 결과값을
 동적으로 확인하고 안전하게 처리할 수 있도록
 확인하고 빠르게 처리할 수 있음
 
 !!안전한 환경을 위해 사용 하는듯
 */

// Assertion
/*
 assert: 주장, 확고히 하다??
 원래의 뜻과 사용 느낌이 조금 다르다
 assert 함수는 디버깅 모드에서 동작
 배포 애플리케이션에서 제외됨
 주로 디버깅 중 조건 검증을 위해 사용
 */

var someInt: Int = 0

// 아래 someInt가 0 이면 정상, 아니면 "someInt != 0" 출력 및 검증 실패로 중지
assert(someInt == 0, "someInt != 0")

someInt = 1

//아래 2개 구문 동작 중지, 검증 실패
//assert(someInt == 0)
//assert(someInt == 0, "someInt != 0")
/*
 __lldb_expr_256/SwiftBasicGrammarNeukkim15.playground:27: Assertion failed: someInt != 0
Playground execution failed:
 */

func functionWithAssert(age: Int?) {
    assert(age != nil, "age == nil")
    
    assert((age! >= 0) && (age! <= 130), "나이값 잘못 입력")
    print("당신 나이 \(age!)세 임다")
}

functionWithAssert(age: 50)

//에러 발생
//functionWithAssert(age: -1)
//functionWithAssert(age: nil)


// Early Exit
/*
 guard를 사용, 잘못된 값 전달 시
 특정 실행구문을 빠르게 종료
 디버깅뿐만 아니라 어떤 조건에서도 동작
 return, braKe 꼭 필요
 */

func functionWithGuard(age: Int?) {
    guard let unwrappedAge = age,
          unwrappedAge < 130,
          unwrappedAge >= 0 else {
        print("나이 잘못 입력")
        return
    }
    
    guard unwrappedAge < 100 else {
        return
    }
    // 아래 구문 축약시 위와 같이 사용
//    if unwrappedAge < 100 {
//        
//    } else {
//        return
//    }
    print("당신 나이 \(unwrappedAge)임")
}


// 반복문에서 사용

var count = 1

while true {
    guard count < 3 else {
        break
    }
    
    print(count)
    count += 1
}

func someFunction(info: [String: Any]) {
    guard let name = info["name"] as? String else {
        print("첫번째 guard")
        return
    }
    
    guard let age = info["age"] as? Int, age >= 0 else {
        print("두번째 guard")
        return
    }
    
    print("\(name): \(age)")
    
}

someFunction(info: ["name": "jenny", "age": "10"])
someFunction(info: ["name": "mike"])
someFunction(info: ["name": "min", "age": 10])

let abc: [String: Any] = ["name": "John", "age": 10]
someFunction(info: abc)
