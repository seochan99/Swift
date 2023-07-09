import UIKit

class DetailViewController: UIViewController {

    // MVVM
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들자
    
    // View
    // - imageView, nameLabel, bountyLabel
    // > view들은 viewModel을 통해서 구성되기
    
    
    // ViewModel
    // - DetailViewModel
    // > 뷰레이어에서 필요한 메서드 만들기 
    // > Model가지고 있기, BountyInfo 들..
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    // 이름, 현상금 정보
//    var name:String?
//    var bountry: Int?
    
//    var bountyInfo:BountyInfo?
    let viewModel = DetailViewModel()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ui 업데이트 해주기
        updateUI()
    }
    
    
    // 유아이 업데이트
    func updateUI(){
  
        if let bountyInfo = viewModel.bountyInfo{
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
    

    @IBAction func close(_ sender: UIButton) {
        // 버튼 눌린 후 사라진다
        dismiss(animated: true, completion: nil)
    }
}

class DetailViewModel{
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?){
        bountyInfo = model
    }
}
