import UIKit

// 처음 코드
//struct Grade {
//    var letter: Character
//    var points: Double
//    var credits: Double
//}
//
//class Person {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyName() {
//        print("My name is \(firstName) \(lastName)")
//    }
//}
//
//class Student: Person {
//    var grades: [Grade] = []
//}
//
//// 학생인데 운동선수
//class StudentAthlete: Student {
//    var minimumTrainingTime: Int = 2
//    var trainedTime: Int = 0
//
//    func train() {
//        trainedTime += 1
//    }
//}
//
//// 운동선인데 축구선수
//class FootballPlayer: StudentAthlete {
//    var footballTeam = "FC Swift"
//
//    override func train() {
//        trainedTime += 2
//    }
//}
//


struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

class Student: Person {
    var grades: [Grade] = []
    
    override init(firstName:String, lastName:String){
        super.init(firstName: firstName, lastName: lastName)
    }
    
    convenience init(student:Student){
        self.init(firstName: student.firstName, lastName: student.lastName)
    }
}

// 학생인데 운동선수
class StudentAthlete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    var sports: [String]
    
    // 클래스만의 생성자 생성
    init(firstName: String, lastName: String, sports:[String]) {
        
        // Phase 1 : 셋팅
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
        
        // Phase 2 : 프로퍼티 접근 가능
        self.train()
        self.firstName
    }
    
    // 보조 이니셜라이저
    convenience init(name:String){
        self.init(firstName: name, lastName: "",sports: [])
    }

    func train() {
        trainedTime += 1
    }
}

// 운동선인데 축구선수
class FootballPlayer: StudentAthlete {
    var footballTeam = "FC Swift"

    override func train() {
        trainedTime += 2
    }
}

let student1 = Student(firstName: "chan", lastName: "name")
let student1_1 = Student(student: student1)
let student2 = StudentAthlete(firstName: "chan", lastName: "ss", sports: ["footBall", "Casdsa"])
let student3 = StudentAthlete(name: "caa")
