//12_class

//구조체와 유사
// 구조체 값 타입 (쉽게 말해 복제)
// 클래스 참조 타입(쉽게 말해 비복제)
// 클래스 다중 상속 안된다.

class Sample {
    var mutableProperty: Int = 100
    let immutableProperty: Int = 100
    
    nonisolated(unsafe) static var typeProperty: Int = 100
    
    func instanceMethod() {
        print("instance method")
    }
    
    // static - 재정의불가 타입 메소드
    static func typeMethod() {
        print("type method - static")
    }
    
    // class - 재정의 가능
    class func classMethod() {
        print("type method - class")
    }
}

// 클래스 사용

var mutableReference: Sample = Sample()

mutableReference.mutableProperty = 200
//mutableReference.immutableProperty = 200

let immutableReference: Sample = Sample()

immutableReference.mutableProperty = 200
//immutableReference.immutableProperty = 200

//immutableReference = mutableReference
