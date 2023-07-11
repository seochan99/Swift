import UIKit

// 이름이 없는 method
var multiplyClosure: (Int,Int) -> Int = {
    (a:Int,b:Int)->Int in return a*b
}

// 클로져로 줄인 부분
var multiplyClosure2: (Int,Int) -> Int = {$0 * $1}


// 클로져로 줄인 부분 : 선호
var multiplyClosure3: (Int,Int) -> Int = {a,b in
    return a*b
}


func operatorTwoNum(a:Int,b:Int,operation:(Int,Int)->Int) -> Int{
    let result = operation(a,b)
    return result
}

operatorTwoNum(a: 4, b: 2, operation: multiplyClosure)

// 더하기 클로져
var addClosure:(Int,Int)->Int = { a, b in
    return a+b
}

operatorTwoNum(a: 4, b: 2, operation: addClosure)

// 즉흥형태, 동적으로 우리 원하는데로 끼어넣을 수 있음
operatorTwoNum(a: 5, b: 3, operation: {a,b in
    return a+b
})

// 이름 없는 메서드
let voidClosure: () -> Void={
    print("iOSSSSS")
}

voidClosure()

// capturing valuse

var count = 0

let incrementer = {
    count += 1
}


// count를 전달하지 않아도 count를 잡아서 값을 올리는 작업을 수행함
incrementer()
incrementer()
incrementer()
incrementer()

count

/*
 { (param) -> return Type in
    statement
    .....
 }
 */

// Example 1 : Cho Simple Clousre
// closure type : () -> ()
let choSimpleClosure = {
    
}
choSimpleClosure()

// Example 2 : 코드블록 구현 Closure
let choSimpleClosure2 = {
    print("Hello Closure, Covid!")
    
}
choSimpleClosure2()


// Example 3 : 인풀 파라미터를 받는 클로져
let choSimpleClosure3:(String)->Void = { name in
    print("Hello Closure, Covid! \(name)")
    
}
choSimpleClosure3("Chan")

// Example 4 : 값 리턴 클로져
let choSimpleClosure4:(String)->String = { name in
    return "Hello Closure, Covid! \(name)"
    
}
let result = choSimpleClosure4("Chansss")
print(result)

// Example 5 : 클로져를 파라미터로 받는 함수 구현
func someSimpleFunction(choSimpleClosure5:()->Void){
    print("함수에서 호출이됨")
    choSimpleClosure5()
}

someSimpleFunction(choSimpleClosure5: {
    print("hi");
})


// Example 6 : Trailing Closure
func someSimpleFunction2(message:String,choSimpleClosure5:()->Void){
    print("함수에서 호출이됨 \(message)")
    choSimpleClosure5()
}

someSimpleFunction2(message: "nianoanoa", choSimpleClosure5: {
    print("asdsadasd")
})

// 클로져를 뒤에 담을 수 있음
someSimpleFunction2(message: "nianoanoa"){
    print("asdsad")
}


