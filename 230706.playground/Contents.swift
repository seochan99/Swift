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

let coordinate = (x:10, y:10)

switch coordinate{
case(0,0):
    print("-> 원점")
case(let x,0):
    print("\(x) : x축입니다!")
case(0,let y):
    print("\(y) : y축입니다!")
case (let x,let y) where x==y:
    print("\(x), \(y) 같음 ㅋ")
case (let x,let y):
    print("\(x), \(y)")

}
