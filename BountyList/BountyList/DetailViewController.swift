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
    
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    // 이름, 현상금 정보
//    var name:String?
//    var bountry: Int?
    
//    var bountyInfo:BountyInfo?
    let viewModel = DetailViewModel()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ui 업데이트 해주기
        updateUI()
        prepareAnimation()
        
    }
    // 보여졌다~
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 보여졌을때 애니메이션을 해라~
        showAnimation()
    }
    
    private func prepareAnimation(){
        // 밖에 내보내기
        nameLabelCenterX.constant = view.bounds.width
        bountyLabelCenterX.constant = view.bounds.width
        
    }
    // 들어오기
    private func showAnimation(){
        nameLabelCenterX.constant = 0
        bountyLabelCenterX.constant = 0
        
//        UIView.animate(withDuration: 0.3){
//            self.view.layoutIfNeeded()
//        }
        
//        UIView.animate(withDuration: 0.3,
//                       delay: 0.1,
//                       options: .curveEaseIn,
//                       animations: {
//            self.view.layoutIfNeeded()
//        }, completion: nil)
        
        // 스프링 효과
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2,options: .allowUserInteraction, animations: {
            self.view.layoutIfNeeded()
        },completion: nil)
        
        // 카드 뒤집기
        UIView.transition(with: imgView, duration: 0.3, options:.transitionFlipFromLeft, animations: nil,completion: nil)
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
