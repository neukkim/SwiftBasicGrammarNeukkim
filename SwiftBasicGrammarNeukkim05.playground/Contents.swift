// 11_구조체struct
/*
struct <#name#> {
    <#fields#>
}
*/

// 프로퍼티 및 메서드
struct Sample {
    var mutableProperty: Int = 100 // 프로퍼티
    let immutableProperty: Int = 100
    
    nonisolated(unsafe) static var typeProperty: Int = 100 // 타입 프로퍼티
    
    func instanceMethod() {
        print("instance method")
    }
    
    static func typeMethod() {
        print("type method")
    }
}

// 구조체 사용

// 가변 인스턴스
var mutable: Sample = Sample()

mutable.mutableProperty = 200
//아래 let이라 불가
//mutable.immutableProperty = 200

// 불변 인스턴스
let immutable: Sample = Sample()

//아래 둘다 불가
//immutable.mutableProperty = 200
//immutable.immutableProperty = 200

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
print(Sample.typeProperty)

Sample.typeMethod()

// 아래 둘다 static 정의되어 불가 한거 같다.
//mutable.typeProperty = 400
//mutable.typeMethod()

struct Student {
    var name: String = "unknown"
//    var `class`: String = "Swift"
    var `class`: String = "Swift"
    
    static func selfIntroduce() {
        print("학생타입입니다")
    }
    
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student.selfIntroduce()

