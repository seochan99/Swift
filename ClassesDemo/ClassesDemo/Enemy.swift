struct Enemy {
//    var health = 100
//    var attackStrength = 10
    var health : Int
    var attackStrength : Int
    
    init(health : Int, attackStrength : Int){
        self.health = health
        self.attackStrength = attackStrength
    }
    
    mutating func takeDamge(amount : Int){
        health = health - amount 
    }
    
    func move(){
        print("Walk")
    }
    
    func attack(){
        print("Land a hit, does \(attackStrength) damage. ")
    }
}
