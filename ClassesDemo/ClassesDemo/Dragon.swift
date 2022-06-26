class Dragon: Enemy {
    var wingSpan = 2
    
    func talk(speech : String){
        print("Says : \(speech)")
    }
    //dragon은 난ㄴ다
    // 그니깐 오버라이드 ㄱ ㄱ
    // 부모 메서드 재정의
    override func move(){
        print("FLY~ FORWARD")
    }
    
    override func attack() {
        super.attack() //부모의 메서드를 가져와줌 
        print("Spits fire, does 10 damage")
    }
}
