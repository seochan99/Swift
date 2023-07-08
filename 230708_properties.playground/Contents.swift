import UIKit

// person struct
struct Person{
    var firstName : String{
        //didSet보다 먼저
        willSet{
            print("willSet : \(firstName) --> \(newValue)")
        }
        
        // 바뀐 타임을 알 수 있음
        didSet{
            print("didSet; \(oldValue) --> \(firstName)")
        }
    }
    
    
    var lastName : String

    lazy var isPopular: Bool = {
        if fullName == "Jay Park"{
            return true
        }else{
            return false
        }
    }()
    
    // computed Properties
//    var fullName:String{
//        // get을 이용해서 보내줌
//        get{
//            return "\(firstName) \(lastName)"
//        }
//        // set을 이용해서 설정해줌
//        set{
//            // first네임 설정
//            if let firstName = newValue.components(separatedBy: " ").first{
//                self.fullName = firstName
//            }
//            // first네임 설정
//            if let lastName = newValue.components(separatedBy: " ").last{
//                self.fullName = lastName
//            }
//        }
//
//    }
//    var fullName:String{
//        return "\(firstName) \(lastName)"
//    }
    
    func fullName() -> String{
        return "\(firstName) \(lastName)"
    }
    
    // type Properties
    static let isAlien: Bool = false
}
// stored Properties
var person = Person(firstName: "chan", lastName: "hui")

//person.firstName
//person.lastName
//
//person.firstName = "Jim"
//person.lastName = "Kim"
//
//person.fullName
//person.fullName = "jak Park"
//
//person.firstName
//person.lastName
//
//// 타입 자체에 있음
//Person.isAlien

person.fullName()
