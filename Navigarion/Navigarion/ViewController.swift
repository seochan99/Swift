import UIKit

//프로토콜에서 정의한 함수를 만들지 않으면 에러발생
class ViewController: UIViewController, EditDelegate{

    

    @IBOutlet var txMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 화면 전환을 위한 prepare함수
    // prepare함수는 해당 세그웨이가 해당 뷰 컨트롤러 전환되기 직전에 호출되는 함수
    // 데이터 전달을 위해 사용됨
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        //세그웨이 도착 컨트롤러를 에딧컨트롤러 형태로 가지게함
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton" {
            // 버튼 클릭시
            editViewController.textWayValue = "segue : use Button"
            
        }else if segue.identifier == "editBarButton"{
            // 바 버튼 클릭시
            editViewController.textWayValue = "segue : use Bar Button"
            
        }
        // 메인화면의 수정이 수정화면으로 전달
        editViewController.textMessage = txMessage.text!
        
        editViewController.delegate = self
        
    }
    // 에디트뷰컨트롤러에서 함수를 호출하여 메시지를 전달해준다
    // 메인화면의 텍스트 필드에 텍스트로 보여주자
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    

}

