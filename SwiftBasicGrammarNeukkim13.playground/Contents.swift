// 21_옵셔널체이닝과_nil병합연산자
// optional chaining, nil-coalescing operator

class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let min: Person? = Person(name: "min")
let apart: Apartment? = Apartment(dong: "101", ho: "1005")
let superman: Person? = Person(name: "superman")

/*
옵셔널 체이닝 실행 후 결과값이 nil 일 수 있으므로
 결과 타입도 옵셔널.
 */

// 만약 우리집 경비원 직업 궁금?

// 옵셔널 체이닝 미사용

func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)임")
                } else {
                    print("우리집 경비원 직업 없음")
                }
            }
        }
    }
}


guardJob(owner: min)


func guardJobChining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)임")
    } else {
        print("우리집 경비원 직업 없음")
    }
}

guardJobChining(owner: min)

print("-----------------------")

min?.home?.guard?.job

min?.home = apart

min?.home

min?.home?.guard

//min?.home?.guard = Person(name: "susupe")
min?.home?.guard = superman

min?.home?.guard

min?.home?.guard?.name

min?.home?.guard?.job

min?.home?.guard?.job = "경비원"

guardJobChining(owner: min)
guardJob(owner: min)


// nil 병합 연산자
var guardJob: String

guardJob = min?.home?.guard?.job ?? "수퍼맨"
                            print(guardJob)

min?.home?.guard?.job = nil

guardJob = min?.home?.guard?.job ?? "수퍼맨"
                            print(guardJob)


