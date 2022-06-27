import UIKit

struct CalculatorBrain{
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace

    }
    func getAdvice() -> String{
        return bmi?.advice ?? "No Adivce"
        
        
    }
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.white
    }
    
    
    mutating func calculateBMI(height : Float, weight : Float){
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "EAT MORE", color: #colorLiteral(red: 0.292, green: 0.081, blue: 0.6, alpha: 255))
        } else if bmiValue<24.9{
            bmi = BMI(value: bmiValue, advice: "NORMAL~", color: UIColor.green)
        }else{
            bmi = BMI(value: bmiValue, advice: "STOP EAT", color: UIColor.red)
        }
        
        
        
    }
    
    
}



