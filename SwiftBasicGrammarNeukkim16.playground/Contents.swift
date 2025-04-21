// 24_protocol

/*
 프로토콜은 특정 역할을 수행하기 위한
 메서드, 프로퍼티, 이니셜라이저 등의 요구사항을 정의
 
 구조체, 클래스, 열거형은 프로토콜을 채택(Adopted)해서
 프로토콜의 요구사항을 실제로 구현할 수 있다.
 어떤 프로토콜의 요구사항을 모두 따르는 타입은
 !프로토콜을 준수한다(Conform)고 표현
 */

protocol Talkable {
    /*
     프로퍼티 요구
     프로퍼티 요구는 항상 var 키워드 사용
     get은 읽기만 가능해도 상관 없다는 뜻
     
     get, set 모두 명시하면
     읽기 쓰기 모두 가능한 프로퍼티여야 합니다.
     
     */
    var topic: String { get set }
    var language: String { get }
    
    // 메서드 요구
    func talk()
    
    // 이니셜라이저 요구
    init(topic: String, language: String )
}

// Talkable 프로토콜 채택

struct Person: Talkable {
    var topic: String
    let language: String
    
//    //읽기전용 프로퍼티 요구는 연산 프로퍼티로 대체가 가능
//    var language: String { return "한국어" }
//    
//    // 읽기, 쓰기 프로퍼티도 연산 프로퍼티로 대체할 수 있음
//    var subject: String = ""
//    var topic: String {
//        set {
//            self.subject = newValue
//        }
//        get {
//            return self.subject
//        }
//    }
    
    func talk() {
        print("\(topic)에 대해 \(language)로 말함")
    }
    
    init(topic: String, language: String) {
        self.topic = topic
        self.language = language
    }
}

// 프로토콜 상속

// 프로토콜은 클래스와 다르게 다중상속 가능

//protocol 프로토콜 이름: 부모 프로토콜 이름 목록 {
//    /* 정의부 */
//}

protocol Readable {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readable {
    // Readable에서 "func read()"를 상속 받았기에 다시 정의할 필요 없음
//    func read()
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable {
    // Readable, Writeable에 있는 정의 재 정의 불필요
//    func read()
//    func write()
    func speak()
}

struct SomeType: ReadWriteSpeakable {
    func read() {
        print("Read")
    }
    func write() {
        print("Write")
    }
    func speak() {
        print("Speak")
    }
}


//클래스 상속과 프로토콜
// 클래스 상속 + 프로토콜 동시에 채택 하려면

class SuperClass: Readable {
    func read() { print("read") }
}

// 상속 받을 클래스 먼저,
// 그다음 프로토콜
class SubClass: SuperClass, Writeable, ReadSpeakable {
    func speak() {
    
    }
    
    func write() { print("write")}
    func spead() { print("speak")}
}


// 프로토콜 준수 확인
/*
 인스턴스가 특정 프로토콜을 준수하는지 확인 하는법
 is, as
 */

let sup: SuperClass = SuperClass()
let sub: SubClass = SubClass()

var someAny: Any = sup
someAny is Readable
someAny is Writeable
someAny is ReadSpeakable
someAny is ReadWriteSpeakable

someAny = sub
someAny is Readable
someAny is Writeable
someAny is ReadSpeakable
someAny is ReadWriteSpeakable

someAny = sup

if let someReadable: Readable = someAny as? Readable {
    print("someReadable OK")
    someReadable.read()
} else  { print("someReadable NO") }

if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable {
    print("someReadSpeakable OK")
    someReadSpeakable.speak()
} else { print("someReadSpeakable NO")}


print("------------------------")
someAny = sub

if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
}
if let someReadWriteSpeakable: Readable = someAny as? ReadWriteSpeakable {
    someReadWriteSpeakable.read()
}
