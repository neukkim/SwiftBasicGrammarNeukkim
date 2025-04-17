// 17_property

/*
 저장 프로퍼티 stored property
 연산 프로퍼티 computed property
 인스턴스 프로퍼티 instance property
 타입 프로퍼티 type property
 */

/*
 프로퍼티는 구조체 struct, 클래스 class, 열거형 enum 내부에 구현 가능
 열거형은 내부에서 연산 프로퍼티만 구현
 연산 프로퍼티는 var로만 선언
 */

struct Student {
    // 인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    // 인스턴스 연산 프로퍼티
    var westernAge: Int {
        get {
            return koreanAge - 1
        }
        set (inputValue) {
            koreanAge = inputValue + 1
        }
    }
    
    // 타입 저장 프로퍼티
    nonisolated(unsafe) static var typeDescription: String = "학생"
    
    // 읽기 전용 인스턴스 연산 프로퍼티
    // 쓰기 전용은 안됨
    var selfIntroduction: String {
        get {
            return "저는 \(self.class)반 \(name)입니다."
        }
    }
    
    static var selfIntroduction: String {
            return "학생타입입니다."
    }
}

// 사용

//타입 연산 프로퍼티 사용
print(Student.selfIntroduction)

// 인스턴스 생성
var hong: Student = Student()
hong.koreanAge = 10


//저장 프로퍼티 사용
hong.name = "min"
print(hong.name)

//인스턴스 연산프로퍼티 사용
print(hong.selfIntroduction)

print("한국나이 \(hong.koreanAge), 미국나이 \(hong.westernAge)")


//응용
struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            print("get 작동")
            return dollar * currencyRate
        }
        set {
            print("set 작동")
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket = Money()

moneyInMyPocket.won = 11000

print(moneyInMyPocket.won)
print(moneyInMyPocket.dollar)


// 지역변수, 전역변수
var a: Int = 100
var b: Int = 200
var sum: Int {
    return a + b
}

print(sum)


print("------------------------------------------")

// 18_property_observer

/*
 프로퍼티 값이 변경될 때 동작 수행
 */

struct Money1 {
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경 될 예정")
        }
        
        didSet(oldRate) {
            print("환율이 \(oldRate) \(currencyRate)으로 변경 됨")
        }
    }
    
    var dollar: Double = 0 {
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정")
        }
        didSet {
            print("\(oldValue)달러에서 \(dollar)달러로 변경")
        }
    }
    
    var won:Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
        
        
// 프로퍼티 감시자와 연산 프로퍼티 기능을 동시 사용 불가!!
        // willSet, didSet은 저장 값이 변경 될때 사용 함으로
        // 연산에서 사용 불가
        
//        willSet {
//
//        }
    }
}

// 사용

var moneyInMyPocket1: Money1 = Money1()

moneyInMyPocket1.currencyRate = 1150

moneyInMyPocket1.dollar = 10

print(moneyInMyPocket1.won)

print(moneyInMyPocket1.dollar)


// 지역, 전역 변수에도 모두 사용 가늩

var aa: Int = 100 {
    willSet {
        print("\(aa)에서 \(newValue)로 변경될 예정")
    }
    didSet {
        print("\(oldValue)에서 \(aa)로 변경됨")
    }
}

aa = 101
aa
