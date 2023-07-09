//
//  BountyViewController.swift
//  BountyList
//
//  Created by 서희찬 on 2023/07/09.
//

import UIKit

// 프로토콜 2개 추가
class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // MVVM
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들자
    
    // View
    // - ListCell
    // > ListCell 필요한 정보를 ViewModel한테서 받아야겠다
    // > ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트 하기
    
    
    
    // ViewModel
    // - BountyViewModel
    // > BountyViewModel을 만들고, 뷰레이어에서 필요한 메서드 만들기
    // > Model가지고 있기, BountyInfo 들..
    
    
    // 데이터, 8개 아이템
    
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    // 세그웨이 수행 준비하는 메서드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 준비할때 데이터를 넘겨주자
        // Detail에게 데이터를 주자
        if segue.identifier == "showDetail"{
            // 도착지가 디테일인 경우
            let vc = segue.destination as? DetailViewController
            // index를 알려줌
            if let index = sender as? Int{
                // 전달해줌
                let bountyInfo = bountyInfoList[index]
//                vc?.name = bountyInfo.name
//                vc?.bountry = bountyInfo.bounty
                vc?.bountyInfo = bountyInfo
            }
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //UITableViewDataSource 대답(갯수, 표현방식)
    // 몇개니?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return bountyList.count
        return bountyInfoList.count
    }
    
    // 어떻게 표현?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 재활용해서 보여준더ㅓ
        
        // 캐스팅 진행, 가드문
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath) as? ListCell else{
            // 옵셔널이 안된 경우
            return UITableViewCell()
        }
        
//        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//        cell.imgView.image = img
//        cell.nameLabel.text = nameList[indexPath.row]
//        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        
        let bountyInfo = bountyInfoList[indexPath.row]
        
        let img = UIImage(named: "\(bountyInfo.name).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = bountyInfo.name
        cell.bountyLabel.text = "\(bountyInfo.bounty)"
        return cell
    }
    
    // 클릭됐을때 어떻게?
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 세그웨이 수행
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

// 커스텀셀
class ListCell: UITableViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}



//  1. bountyInfo 만들기
struct BountyInfo{
    let name:String
    let bounty:Int
    
    var image: UIImage?{
        return UIImage(named: "\(name).jpg")
    }
    
    init(name:String, bounty:Int){
        self.name = name
        self.bounty = bounty
    }
}
