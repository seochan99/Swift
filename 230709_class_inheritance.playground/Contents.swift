import UIKit

// 처음 주어진 코드
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
//class Student {
//    var grades: [Grade] = []
//
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

// 성적 구조체
struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

// 사람 클래스
class Person {
    var firstName: String
    var lastName: String

    // 생성자 초기화
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

// 학생 클래스, 사람 상속
class Student : Person{
    var grades: [Grade] = []
}

// person과 student가 매우 비슷함...
// 이를 상속개념으로 해결해보자!

let jay = Person(firstName: "jay", lastName: "Lee")
let jason = Student(firstName: "chan", lastName: "last")

jay.firstName
jason.firstName // 상속받은 항목 접근 가능

jay.printMyName()
jason.printMyName()

let math = Grade(letter:"B",points: 7.4,credits: 3)
let history = Grade(letter:"A",points: 10.0,credits: 3)
jason.grades.append(math)
jason.grades.append(history)

jason.grades.count

// 운동선수
class StudentAthelete: Student{
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    
    func train(){
        trainedTime += 1
    }
}

// 운동선수인데 축구선수
class FootballPlayer: StudentAthelete{
    var footballTeam = "FC Swift"
    
    // 오버라이드 진행
    override func train() {
        trainedTime += 2
    }
}

var athelete1 = StudentAthelete(firstName: "Yuna", lastName: "kim")
var athelete2 = FootballPlayer(firstName: "Heung", lastName: "Son")

athelete1.firstName
athelete2.firstName

athelete1.grades.append(math)



athelete1.minimumTrainingTime

athelete2.footballTeam

athelete1.train()
athelete1.trainedTime

athelete2.train()
athelete2.trainedTime

// upper casting
athelete1 = athelete2 as StudentAthelete
athelete1.train()
athelete1.trainedTime

// 업케이스팅돼서 풋볼팀을 못봄
// 그래서 다운 캐스팅 가능
if let son = athelete1 as? FootballPlayer{
    print("\(son.footballTeam) as Team")
}










