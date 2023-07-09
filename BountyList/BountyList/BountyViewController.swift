//
//  BountyViewController.swift
//  BountyList
//
//  Created by 서희찬 on 2023/07/09.
//

import UIKit

// 프로토콜 2개 추가
class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // 데이터, 8개 아이템
    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    
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
                vc?.name = nameList[index]
                vc?.bountry = bountyList[index]
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
        return bountyList.count
    }
    
    // 어떻게 표현?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 재활용해서 보여준더ㅓ
        
        // 캐스팅 진행, 가드문
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath) as? ListCell else{
            // 옵셔널이 안된 경우
            return UITableViewCell()
        }
        
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
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

