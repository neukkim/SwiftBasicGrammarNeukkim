// 22_타입캐스팅

/*
 스위프트의 타입캐스팅은
 인스턴스의 타입을 확인하는 용도
 또는 클래스의 인스턴스를
 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지
 확인하는 용도로 사용
 
 is, as
 */

// 다른 언어에서는 보통 아래와 같은 용도

// 아래 스위프트에서는 실직적으로 변환이 아니라 Int 타입을 Double 타입의 인스턴스를 하나더 만들어줌
/*
 let someInt: Int = 100
 let someDOuble: Double = Double(someInt)
 */

class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("대학MT 갑니다")
    }
}

var min: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()



var result: Bool


result = min is Person // min은 Person의 타입인가?
result = min is Student
result = min is UniversityStudent

result = hana is Person
result = hana is Student
result = hana is UniversityStudent

result = jason is Person
result = jason is Student
result = jason is UniversityStudent


switch min {
case is Person:
    print("min 은 사람")
case is Student:
    print("min 은 학생")
case is UniversityStudent:
    print("min은 대학생")
default:
    print("min은 사람, 학생, 대학생 도 아니다")
}

switch min {
case is UniversityStudent:
    print("min은 대학생")
case is Student:
    print("min 은 학생")
case is Person:
    print("min 은 사람")
default:
    print("min은 사람, 학생, 대학생 도 아니다")
}

// 업 캐스팅
/*
 as를 사용 부모클래스의 인스턴스로 사용
 컴파일러에게 타입정보를 전환
 Any, AnyObject로 타입정보 변환할 수 있음
 암시적으로 처리되므로 생략해도 무방
 */

var mike: Person = UniversityStudent() as Person

var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent

//var jina: Any = Person() // as Any 생략 가능
var jina: Any = Person() as Any


//다운 캐스팅

/*
 as? 또는 as!를 사용
 자식 클래스의 인스턴스로 사용
 컴파일러에게 인스턴스의 타입정보를 전환해 줌
 */

//조건부ㅜ 다운 캐스팅

var optionalCasted: Student?
optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent
optionalCasted = jina as? UniversityStudent
optionalCasted = jina as? Student


// 강제 다운 캐스팅

var forcedCasted: Student

optionalCasted = mike as! UniversityStudent
//optionalCasted = jenny as! UniversityStudent
//optionalCasted = jina as! UniversityStudent
//optionalCasted = jina as! Student


//활용
func doSwitch(someone: Person) {
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
        
    }
}

func doSomething(someone: Person) {
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let Student = someone as? Student {
        Student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

print("----------------")
doSomething(someone: mike as Person)

doSomething(someone: mike)

doSomething(someone: jenny)

doSomething(someone: min)

