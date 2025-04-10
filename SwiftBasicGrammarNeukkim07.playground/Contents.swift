// 13_열거

/*
 enum은 타입 -> 대문자 카멜케이스
 각 case는 소문자 카멜케이스
 각 case는 그 자체가 고유 값
 */

enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon
day = .thu
day = Weekday.fri

switch day {
case .mon, .tue, .wed, .thu:
    print("평일임")
case .fri:
    print("불금임")
case .sat, .sun:
    print("신나는 주말!!")
}


// 원시값

/*
 C 언어의 enum처럼 정수값을 가질 수도 있음.
 rawValue를 사용 하면 된다.
 case별로 각각 다른 값 가져야 함
 */

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")


/*
 정수 타입 뿐만 아니라 Hashable 프로토콜을 따르는 모든 타입이 원시값의 타입으로 지정될 수 있다는데??
 */
enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")

print("School.university.rawValue == \(School.university.rawValue)")

// 원시값을 통한 초기화
/*
 rawValue를 통해 초기화 가능
 
 rawValue가 case에 해당하지 않을 수 있으므로
 rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입 임.??
 */

//let apple: Fruit = Fruit(rawValue: 0)
let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다")
}


// 메서드
enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("따뜻한 봄")
        case .jun, .jul, .aug:
            print("여름")
        case .sep, .oct, .nov:
            print("가을")
        case .dec, .jan, Month.feb:
            print("겨울")
            
        }
    }
}

Month.mar.printMessage()
