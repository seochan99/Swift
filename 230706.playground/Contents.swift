import UIKit
import Foundation
//닫힌
let closedRange = 0...10
//열린
let halfClosedRange = 0..<10

var sum = 0
for i in halfClosedRange{
    print("----> \(i)")
    sum += i
}

print("---> total sum: \(sum)")

var sinValue: CGFloat = 0
for i in closedRange{
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}

let name = "chan"
for _ in closedRange{
    print("----> \(name)")
}

/// 짝수만 프린트해보자
for i in closedRange{
    if i % 2 == 0 {
        print("---> 짝수 : \(i)");
    }
}

// 반복문에 조건 줄 수 있음
for i in closedRange where i%2 == 0 {
    print("---> 짝수 : \(i)");
}

// 3만 빼고 출력하고 싶으면 ?
for i in closedRange{
    if i == 3{
        continue
    }
    print("---> \(i)");
}

// 이중 for문 : 별로 안좋음
for i in closedRange{
    for j in closedRange{
        print("gugu -> \(i) * \(j) = \(i*j)")
    }
}

