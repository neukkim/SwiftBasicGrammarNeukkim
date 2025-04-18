// 20_인스턴스_생성_소멸_init_deinit

// 프로퍼티 기본값

//이니셜라이저
/*
 프로퍼티 기본값을 지정하기 여려운 경우
 이니셜라이저를 통해
 인스턴스가 가져야 할 초기값을 전달 할수 있음
 */

class PersonB {
    var name: String
    var age: Int
    var nickName:String
    
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let hana: PersonB = PersonB(name: "min", age: 20, nickName: "민")


// 프로퍼티 초기값이 꼭 필요 없을 때
// 옵셔널 사용
class PersonC {
    var name: String
    var age: Int
    var nickName: String?

//방법1
//    init(name: String, age: Int, nickName: String? = nil) {
//        self.name = name
//        self.age = age
    
//방법2
    convenience init(name: String, age: Int, nickName: String) {
        self.init(name: name, age: age)
        self.nickName = nickName
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let lee: PersonC = PersonC(name: "lee", age: 10)
let jun: PersonC = PersonC(name: "jun", age: 20, nickName: "JJ")

/*
 암시적 추출 옵셔널은
 인스턴스 사용에 꼭 필요하지만
 초기값을 할당하지 않고자 할 때 사용
 */

class Puppy {
    var name: String
    var owner: PersonC!
    
    init(name:String) {
        self.name = name
    }
    
    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다")
    }
}

let happy: Puppy = Puppy(name: "happy")
//happy.goOut()

happy.owner = lee
happy.goOut()


// 실패가능한 이니셜 라이저
/*
 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우
 인스턴스 생성에 실패할 수 있음
 인스턴스 생성에 실패하면 nill 반환
 그래서 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입
 */

class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int) {
        if (0...120).contains(age) == false {
            return nil
        }
        
        if name.count == 0 {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

//let ddo1: PersonD = PersonD(name: "ddo1", age: 23)
let ddo1: PersonD? = PersonD(name: "ddo1", age: 23)
let ddo2: PersonD? = PersonD(name: "ddo2", age: 123)
let ddo3: PersonD? = PersonD(name: "", age: 70)

print(ddo1)
print(ddo2)
print(ddo3)


// 디이니셜라이저
/*
 deinit은 클래스의 인스턴스가
 메모리에서 해제되는 시점에 호출
 인스턴스가 해제되는 시점에 해야할 일을 구현
 */

class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }
    
    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도 합니다.")
            self.pet?.owner = child
        }
        else {
            print("pet name 없었음")
        }
    }
}
var donald: PersonE? = PersonE(name: "donald", child: lee)

print(donald?.name)

donald?.pet = happy


print(donald?.pet?.name)

donald = nil

var sad = Puppy(name: "Sad") // Puppy 객체 생성
var donald2: PersonE? = PersonE(name: "Donald2", child: lee) // PersonE 객체 생성
donald2?.pet = nil // pet을 nil로 설정

// donald2 객체가 nil로 해제되면 deinit이 호출됩니다.
donald2 = nil
