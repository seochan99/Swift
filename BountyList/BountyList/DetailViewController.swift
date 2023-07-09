import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    // 이름, 현상금 정보
    var name:String?
    var bountry: Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ui 업데이트 해주기
        updateUI()
    }
    
    
    // 유아이 업데이트
    func updateUI(){
        if let name = self.name, let bountry = self.bountry{
            // 이미지 가져오기
            let img = UIImage(named: "\(name).jpg")
            imgView.image = img
            nameLabel.text = name
            bountyLabel.text = "\(bountry)"
        }
    }
    

    @IBAction func close(_ sender: UIButton) {
        // 버튼 눌린 후 사라진다
        dismiss(animated: true, completion: nil)
    }
    

}
