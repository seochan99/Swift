import UIKit


// 거리 구하는 함수
func distance(current:Location,target:Location)->Double{
    //피타고라스
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    
    let distance = sqrt(distanceX*distanceX + distanceY+distanceY)
    return distance
}

struct Location{
    let x : Int
    let y : Int
}

struct Store{
    let loc : Location
    let name : String
    let deliveryRange = 2.0
    
    func isDeliverable(userLoc: Location) -> Bool{
        let distanceToStore = distance(current: userLoc, target: loc)
        return distanceToStore < deliveryRange
    }
    
    
}

let store1 = Store(loc : Location(x: 3, y: 5), name:"gs")
let store2 = Store(loc: Location(x: 4, y: 6), name:"seven")
let store3 = Store(loc : Location(x: 1, y: 7), name:"cs")




// 가장 가까운 스토어 구해서 프린트하는 함수
func printClosesStore(currentLocation:Location,stores:[Store]){
    var closesStoreName = ""
    var closesStroeDistance = Double.infinity
    
    var isDeliverable = false
    
    for store in stores{
        let distanceToStore = distance(current:currentLocation, target:store.loc)
        closesStroeDistance = min(distanceToStore, closesStroeDistance)
        if closesStroeDistance == distanceToStore{
            closesStoreName = store.name
            // 가능한지 묻기
            isDeliverable = store.isDeliverable(userLoc: currentLocation)
        }
    }
    print("Closest Store \(closesStoreName) del : \(isDeliverable)")
}

// Stores Array,current location Setting
let myLocation = Location(x:2, y:2)
let stores = [store1,store2,store3]

// printCloseseStore 함수 이용해서 현재 가장 가까운 스토어 출력하기
printClosesStore(currentLocation: myLocation, stores: stores)

// Improve Code
// location struct

// 도전과제
// 1. 강의 이름, 강사 이름, 학생수를 가지는 struct
// 2. 강의 어레이와 강사이름을 받아서, 해당 강사의 강의 이름 출력 함수 찾기
// 3. 강의 3개 만들고 강사이름을 강의 찾기

// CustomStringConvertible 프로토콜
struct Lecture: CustomStringConvertible{
    var description : String{
        return "Title\(name), Instrcutor: \(instructor)"
    }
    let name: String
    let instructor : String
    let numOfStudent : Int
}

func printLectureName(from instructor: String, lectures: [Lecture]){
//    var lectureName = ""
//
//    for lecture in lectures{
//        if instructor == lecture.instructor{
//            lectureName = lecture.name
//        }
//    }
    
    // 클로져로 원하는 값 찾는 방법
    let lectureName = lectures
                        .first{lec in
                                return lec.instructor == instructor
                        }?.name ?? ""
    
    print(lectureName)
}

let lec1 = Lecture(name: "iOS Basic", instructor: "Jason", numOfStudent: 30)
let lec2 = Lecture(name: "iOS Advanced", instructor: "Hui", numOfStudent: 20)
let lec3 = Lecture(name: "iOS Pro", instructor: "Chan", numOfStudent: 10)

let lectures = [lec1,lec2,lec3]

printLectureName(from: "Hui", lectures: lectures)

print(lec1)
