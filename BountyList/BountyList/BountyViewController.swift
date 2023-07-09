//
//  BountyViewController.swift
//  BountyList
//
//  Created by 서희찬 on 2023/07/09.
//

import UIKit

// 프로토콜 2개 추가
class BountyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
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
    
    let viewModel = BountyViewModel()
    
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
                let bountyInfo = viewModel.bountyInfo(at: index)
                vc?.viewModel.update(model: bountyInfo)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // UICollectionViewDataSource
    // 몇개를 보여줄까요?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    
    // 셀은 어떻게 표현할까요?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as?
                GridCell else {
                return UICollectionViewCell()
        }
        
        let bountyInfo = viewModel.bountyInfo(at: indexPath.item)
            cell.update(info: bountyInfo)
        cell.update(info: bountyInfo)
        return cell
    }
    
    // UICollectionViewDelegate
    // 셀이 클릭되었을때 우짤까요?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    
    // UICollectionViewDelegateFlowLayout
    // device마다 cell크기가 달라야함
    // 셀 사이즈를 계산할거다!
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 간격
        let itemSpacing: CGFloat = 10
        // 글박스
        let textAreaHeight: CGFloat = 65
        
        // 너비에서 10을 뺌, 남은 녀석 2등분 사용
        let width: CGFloat = (collectionView.bounds.width - itemSpacing)/2
        
        let height: CGFloat = width * 10/7 + textAreaHeight
        return CGSize(width: width, height: height)
    }
}

// 커스텀셀
class ListCell: UITableViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo){
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}




//  1. bountyInfo 만들기


// 2. viewModel 만들기
class BountyViewModel{
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
    
    // 정렬
    var sortedList:[BountyInfo]{
        let sortedList = bountyInfoList.sorted{prev,next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    
    // 총 갯수 반환
    var numOfBountyInfoList: Int{
        return bountyInfoList.count
    }
    
    func bountyInfo(at index : Int) -> BountyInfo{
        return sortedList[index]
    }
    
}

// gridCell
class GridCell: UICollectionViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo){
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}
