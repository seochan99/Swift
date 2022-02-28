import UIKit

//프로토콜 형태의 델리게이트추가
//프로토콜이란 ?
//특정 객체가 갖추어야 할 기능이나 속성에 대한 설계도
protocol EditDelegate{
    func didMessageEditDone(_ controller: EditViewController, message: String)
}

class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    var textMessage: String = "" // 메세지입력받기
    var delegate : EditDelegate?
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var lblWay: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage // 메세지입력받기
    }

    // 뷰를 불러올때는 Show
    // 되돌아갈때는 Pop
    @IBAction func btnDone(_ sender: UIButton) {
        // 수정화면의 텍스트 필드의 내용, 즉 데이터를 메인화면으로 전달
        if delegate != nil{ //수정안했으면 nil값을 가짐
            delegate?.didMessageEditDone(self, message: txMessage.text!)
        }
        _ = navigationController?.popViewController(animated: true)
        
    }
}
