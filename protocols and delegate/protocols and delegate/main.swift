// CPR수행 증명서
protocol AdvancedLifeSupports{
    func performCPR()
    
}
//
class EmergencyCallHandler{
    var delegate:AdvancedLifeSupports?
    
    func assessSitulation(){
        print("Can you tell me what Happend?")
    }
    func medicalEmergency(){
        delegate?.performCPR()
    }
    
}


// 프로토콜을 받았고, 그를 수행해야한다
struct Pramedic : AdvancedLifeSupports{
    // 구급대원은 근무를 시작하면 가장먼저 호출기를 들어
    // 담당자의 대리인 속성을 자신으로 한다
    
    // handler는 호출기를 고르는 것과 같다
    init(handler:EmergencyCallHandler){
        // 위임자로 설정
        handler.delegate = self
    }
    func performCPR() {
        print("this paramedic does chest compression")
    }
    
}

class Doctor:AdvancedLifeSupports{
    
    init(handler : EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does..")
    }
    
    func useStethescope(){
        print("LINSTEN HEART SOUND")
    }
}

class Surgeon:Doctor{
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func useDrill(){
        print("Drllllll")
    }
}

let emilio = EmergencyCallHandler()
// emilio의 전화를 받음
//let pete = Pramedic(handler: emilio)


// 의사가 확인할때
let angela = Surgeon(handler: emilio)


// 호출자야 뭔 일 있어?
emilio.assessSitulation()
emilio.medicalEmergency()

