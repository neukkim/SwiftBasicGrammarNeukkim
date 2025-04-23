// 26_오류처리
// error handling

// 오류표현
// Error 프로토콜과 (주로) 열거형을 통해서 오류를 표현 합니다.

// 자판기 동작 요류의 종류를 표현한 열거형
enum VMError: Error {
    case invalidInput
    // 아래 열거형 연관값
    case insufficientFunds(moneyNedded: Int)
    case outOfStock
}


//함수에서 발생한 오류 던지기

/*
 오류 발생의 여지가 있는 메서드는 throws를 사용하여
 오류를 내포하는 함수임을 표시합니다.
 */

class VM {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0
    
    // 돈 받기 메서드
    func receiveMoney(_ money: Int) throws {
        // 입력한 돈이 0이하면 오류를 던집니다.
        guard money > 0 else {
            throw VMError.invalidInput
        }
        
        //오류가 없으면 정상처리
        self.deposited += money
        print("\(money)원 받음")
    }
    
    // 물건 팔기 메서드
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        
        //원하는 아이템 수량이 잘못 입력되었으면 오류
        guard numberOfItemsToVend > 0 else {
            throw VMError.invalidInput
        }

        // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류 던짐.
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            
            throw VMError.insufficientFunds(moneyNedded: moneyNeeded)
        }
        
        // 구매하려는 수량보다 요구하는 수량이 많으면 오류 던짐
        guard itemCount >= numberOfItemsToVend else {
            throw VMError.outOfStock
        }
        
        // 오류가 없으면 정상처리 합
        let totalPrice = numberOfItemsToVend * itemPrice
        
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        
        return "\(numberOfItemsToVend)"
    }
}

let machine: VM = VM()

var result: String?


// 오류 처리
/*
 오류발생의 여지가 있는 throws 함수(메서드)는
 try를 사용하여 호출
 try, try?, try!
 
   do-catch
 오류발생의 여지가 있는 throws 함수(메서드)는
 do-catch 구문을 활용
 오류발생 대비
 */

do {
    try machine.receiveMoney(10)
    print(machine.deposited)
} catch VMError.invalidInput {
    print("입력이 잘못 되었습니다.")
} catch VMError.insufficientFunds(let moneyNeed) {
    print("\(moneyNeed)원이 부족합니다")
} catch VMError.outOfStock {
    print("수량이 부족")
}

// 위와 같이 catch catch catch 귀찮다면 아래 처럼

do {
    try machine.receiveMoney(300)
} catch /*(let error) 암시적으로 error를 전달*/{
    switch error {
    case VMError.invalidInput:
        print("입력이 잘못됨")
    case VMError.insufficientFunds(let moneyNeeded):
        print("\(moneyNeeded)원이 부족")
    case VMError.outOfStock:
        print("수량이 부족")
    default:
        print("알수없는 오류\(error)")
    }
}
print(machine.deposited)


//do {
//    result = try machine.vend(numberOfItems: 2)
//} catch {
//    print(error)
//}
//
//print(machine.deposited)
//
//do {
//    result = try machine.vend(numberOfItems: 2)
//}
//print(machine.deposited)

// try? try!

/*
 오류 처리 통보 받지 않음
 오류 발생시 nill 돌려 받음
 정상동작 후 옵셔널 타입으로 정상 반홥값 받음
 */

print("---------------------")
machine.deposited

result = try? machine.vend(numberOfItems: 2)
result

var abc = result

result = try? machine.vend(numberOfItems: 2)
result


//try!

result = try! machine.vend(numberOfItems: 1)
result
machine.deposited

//아래 에러
//result = try! machine.vend(numberOfItems: 1)
