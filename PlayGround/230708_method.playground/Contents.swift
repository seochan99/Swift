import UIKit

struct Lecture{
    var title:String
    var maxStudents: Int = 10
    var numOfRegistered : Int = 0
    
    // 강의 남은 자리 수
    func remainSeates() -> Int {
        let remainSeates = maxStudents - numOfRegistered
        return remainSeates
    }
    
    //
    mutating func register(){
        // 등록된 학생 수 증가하기
        numOfRegistered += 1
    }
    
    // 타입 프로퍼티
    static var target:String = "Anybodu want to learn something"
    
    // 타입 메섣,
    static func getLectureName()->String{
        return "패캠"
    }
    
}

var lect = Lecture(title: "iOS Basic")


lect.remainSeates()
lect.register()
lect.register()

Lecture.target
Lecture.getLectureName()

// method를 추가하고싶을때 extension 사용
struct Math{
    // 절댓값 타입 메서드
    static func abs(value:Int)->Int{
        if value > 0{
            return value
        }else{
            return -value
        }
    }
}

Math.abs(value: -20)

// 제곱이랑..뭐 다른것도 필요할때 위 Math파일 찾기 힘들때
// extesion 사용
extension Math{
    static func square(value:Int)->Int{
        return value*value
    }
    
    static func half(value:Int)->Int{
        return value/2
    }
}


var value: Int = 3
// 제곱, 반값

// Int를 만지기는 그럼..
extension Int{
     func square()->Int{
        return self*self
    }
    
     func half()->Int{
        return self/2
        
    }
}

//apple이 만든거에도 이와 같이 method추가 가능
value.half()
value.square()


