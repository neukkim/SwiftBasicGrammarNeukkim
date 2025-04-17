// 19_상속_inheritance

/*
 스위프트의 상속은 클래스, 프로토콜 등에서 가능
 열거형, 구조체 상속 불가능
 swift는 다중상속 불가
 */

// 클래스의 상속, 재정의

/*
 class 이름: 상속받을 클래스 이름 {
    구현부
 }
 */

class Person {
    var name: String = ""
    
    func selfIntroduce() {
        print("저는 \(name) 입니다")
    }
    
    //final 키워드로 재정의 방지
    final func sayHello() {
        print("hello")
    }
    
    /*
     타입 메서드
     재정의 불가 타입 메서드 - static
     */
    static func typeMethod() {
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
    
    /*
     재정의 가능한 class 메서드라도
     final 키워드를 사용하면 재정의 할 수 없음.
     static 과 final class
     똑같은 역활
     */
    final class func finalClassMethod() {
        print("type method - final class")
    }
}

class Student: Person {
    // 저장 프로퍼티 Person에서 정의 되어 있고, 재정의 불가
//    var name: String = ""
    var major: String = ""
    
    override func selfIntroduce() {
        print("저는 \(name)이고, 전공은 \(major)입니다.")
        super.selfIntroduce()
    }
    
    override class func classMethod() {
        print("overriden type method - class")
    }
    
}

var useStudent = Student()
useStudent.selfIntroduce()

let hong: Person = Person()
let kim: Student = Student()

hong.name = "hong"
kim.name = "kim"
kim.major = "Swift"

print("-------------------")
hong.selfIntroduce()

kim.selfIntroduce()

Person.classMethod()

Person.finalClassMethod()

Student.classMethod()

