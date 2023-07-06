import UIKit

// var greeting = "Hello, playground"

let value = arc4random_uniform(100)
print("-->\(value)")
/*
 
 */

let coordinates = (4,6)

// 0,1인게 헷갈린다..
let x = coordinates.0
let y = coordinates.1

// 이를 명시적으로 표현해보자
let coordinatesNamed = (x:3, y:2)

let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y

// 한번에 할당하기
let (x3,y3) = coordinatesNamed

// ------- Boolean

let yes = true
let no = false

let isFourGreaterThanFie = 4 > 5

if isFourGreaterThanFie{
    print("chamm")
}else{
    print("gogogo")
}

let name1 = "jin"
let name2 = "chan"

let isTwoNameSame = name1 == name2


let isJson = name2 == "chan"

let greetingMessage:String = isJson ? "Hi" : "Bye"
print("msg \(greetingMessage)")



// 전역 범위 
var hours = 50
let payPerHour = 10000
var salary = 0

if hours > 40 {
    let extraHours = hours - 40         // 조건문 내의 범위
    salary += extraHours*payPerHour*2
    hours -= extraHours
}

salary += hours + payPerHour
