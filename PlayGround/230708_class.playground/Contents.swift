import UIKit

// 사람 구조체
struct PersonStruct{
    var firstName : String
    var lastName : String
    
    
    // 이니셜라이저 : 생성자
    init(firstName:String, lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName:String{
        return "\(firstName) \(lastName)"
    }
    
    mutating func uppercaseNAme(){
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

class PersonClass{
    
    var firstName : String
    var lastName : String
    
    // 이니셜라이저 : 생성자
    init(firstName:String, lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName:String{
        return "\(firstName) \(lastName)"
    }
    
    func uppercaseNAme(){
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

var personStruct1 = PersonStruct(firstName: "jason", lastName: "lee")
var personStruct2 = personStruct1

var personClass1 = PersonClass(firstName: "chan", lastName: "ch")
var personClass2 = personClass1

personStruct2.firstName = "jay"
personStruct1.firstName
personStruct2.firstName

personClass2.firstName = "jay"
personClass1.firstName // jay
personClass2.firstName // jay

personClass2 = PersonClass(firstName: "bob", lastName: "lee")
personClass1.firstName // jay
personClass2.firstName // bob

personClass1 = personClass2 // class1도 class2를 바라보게 만들기
personClass1.firstName // bob
personClass2.firstName // bob
