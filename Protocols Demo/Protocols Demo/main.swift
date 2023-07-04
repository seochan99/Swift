protocol CanFly{
    // {}와 같이 body가 있으면 안된다
    func fly()
}

// Bird 클래스
class Bird{
    
    var isFemale = true
    func layEgg(){
        if isFemale{
            print("The Bird makes a new bird in a shell.")
        }
    }
    

}


// Bird 상속받은 eagle클래스
class Eagle: Bird, CanFly {
    
    func fly(){
        print("the bird flaps its wings and lifts off into the sky.")
    }
    
    func soar(){
        print("the eagle glides in the air using air currents.")
    }
}

class Penguin : Bird{
    func swim(){
        print("The Penguin paddles throuh the water")
    }
}

// 새 박물관
struct FlyingMuseum{
    // 나는것들의 데모로 새를 받음
    func flyingDemo(flyingObject : CanFly){
        flyingObject.fly()
        
    }
}

struct Airplane: CanFly{
    
    func fly(){
        print("the airplane flaps its wings and lifts off into the sky.")
    }
    
}


let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()

// 이글만의 메서드
myEagle.soar()

let myPenguin = Penguin()
myPenguin.layEgg()

// 엥 팽귄한테 상속받아서는 안될 플라이가 있다!
//myPenguin.fly()

let myPlane = Airplane()

//박물관
let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myEagle)
//museum.flyingDemo(flyingObject: myPenguin)

