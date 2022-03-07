//
//  DetailViewController.swift
//  Table
//
//  Created by 서희찬 on 2022/03/08.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem = "ㅋㅋ" // mainView에서 받을 텍스트를 위해 변수 receive Item선언 한다.

    @IBOutlet weak var lblItem: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // view가 노출될 때마다 이 내용을 레이블의 텍스트로 표시
        lblItem.text = receiveItem
        }
    
    // main View에서 변수를 받기 위한 함수 추가
    func receiveItems(_ item: String)
    {
        receiveItem = item
    }
    

    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    // 세그웨이를 이용하여 뷰를 이동하는 함수
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//        if segue.identifier == "sgDetail"{
//            let cell = sender as! UITableViewCell
//            let indexPath = self.tvListView.indexPath(for: cell)
//            let detailView = segue.destination as! DetailViewController
//            detailView.receiveItem(items[((i))])
//        }
//    }


}
