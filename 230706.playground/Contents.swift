//import UIKit
//import Foundation
////닫힌
//let closedRange = 0...10
////열린
//let halfClosedRange = 0..<10
//
//var sum = 0
//for i in halfClosedRange{
//    print("----> \(i)")
//    sum += i
//}
//
//print("---> total sum: \(sum)")
//
//var sinValue: CGFloat = 0
//for i in closedRange{
//    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
//}
//
//let name = "chan"
//for _ in closedRange{
//    print("----> \(name)")
//}
//
///// 짝수만 프린트해보자
//for i in closedRange{
//    if i % 2 == 0 {
//        print("---> 짝수 : \(i)");
//    }
//}
//
//// 반복문에 조건 줄 수 있음
//for i in closedRange where i%2 == 0 {
//    print("---> 짝수 : \(i)");
//}
//
//// 3만 빼고 출력하고 싶으면 ?
//for i in closedRange{
//    if i == 3{
//        continue
//    }
//    print("---> \(i)");
//}
//
//// 이중 for문 : 별로 안좋음
//for i in closedRange{
//    for j in closedRange{
//        print("gugu -> \(i) * \(j) = \(i*j)")
//    }
//}

//------ Switch

//let num = 10
//
//switch num{
//case 0...10 :
//    print("--> 0")
//case 11..<20:
//    print("11~20")
//default :
//    print("0,10이 아닙니다")
//}
//
//let pet = "bird"
//
//switch pet {
//case "dog","cat":
//    print("zzz")
//default:
//    print("idk")
//}
//
//
//let num2 = 20
//switch num2{
//case _ where num2 % 2 == 0:
//    print("--> 짝수")
//default:
//    print("--> 홀수")
//}

//------ Switch 심화

//let coordinate = (x:10, y:10)
//
//switch coordinate{
//case(0,0):
//    print("-> 원점")
//case(let x,0):
//    print("\(x) : x축입니다!")
//case(0,let y):
//    print("\(y) : y축입니다!")
//case (let x,let y) where x==y:
//    print("\(x), \(y) 같음 ㅋ")
//case (let x,let y):
//    print("\(x), \(y)")
//
//}


// ------ 함수
//func printName(){
//    print("000> chan")
//}

//func printName(name: String){
//    print("000> \(name) ")
//}
//
//printName(name : "chan")
//
//
//func printName2(이름 name: String)
//{
//    print("000\(name)")
//}
//
//printName2(이름 : "chan")

//func printTotalPrice(price:Int, count : Int){
//    print("Total Price : \(price * count)")
//}
//
//printTotalPrice(price: 1500, count: 5)
//
//
//// default Value 주기
//func printTotalPriceDefaultValue(price:Int=1500, count : Int){
//    print("Total Price : \(price * count)")
//}
//
//printTotalPriceDefaultValue(count: 5)
//
//
//// return 키워드
//func totalPrice(price:Int, count:Int) -> Int{
//    let totalPrice = price * count
//    return totalPrice
//}
//
//let calPrice = totalPrice(price: 1500, count: 5)
//
//print(calPrice)

// 1. 성, 이름을 받아서 fullname출력 함수


// 2. 1번 만든 함수로 파라미터 이름 제거하고 fullname 출력하기

// 3. full name return

//func getName(name:String, name2:String) -> String{
//    return name+name2
//}
//
//let myName = getName(name: "Seo", name2: "chan")
//print(myName)


// In-out parameter


//// 들어온 value는 상수이다.
//var value = 3
//func incrementAndPrint(_ value: inout Int){
//    value+=1
//    print(value)
//}
//
//incrementAndPrint(&value)

func add(_ a : Int, _ b: Int) -> Int {
    return a + b
}

func sub(_ a : Int, _ b: Int) -> Int {
    return a - b
}

var function = add
function(4,2)


func printResult(_ function:(Int,Int)->Int, _ a: Int, _ b: Int){
    let reuslt = function(a,b)
    print(reuslt)
}

printResult(add, 10, 5)
