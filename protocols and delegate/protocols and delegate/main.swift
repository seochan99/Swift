protocol AdvancedLifeSupport {
    func performCPR()
}


class EmergencyCalHandler{
    var delegate: AdvancedLifeSupport?
    
    func asseseSitulation(){
        print("Can you tell me what happend?")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport{
    
    init(handler: EmergencyCalHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
    
    
}


class Docotr:AdvancedLifeSupport {
    
    init(handler: EmergencyCalHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compressions, 30 per second.")
    }
    
    func useSetthescope(){
        print("Listening for heart sounds")
    }
}

class Surgeon: Docotr{
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the beegees")
    }
    
    func useElectricDrill(){
        print("Whirr...")
    }
}

let emilio = EmergencyCalHandler()
let angela = Surgeon(handler: emilio)

emilio.asseseSitulation()
emilio.medicalEmergency()
