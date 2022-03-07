//
//  AddViewController.swift
//  Table
//
//  Created by 서희찬 on 2022/03/08.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfAddItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!) // items 텍스트 필드의 텍스트 값 추가
        itemsImageFile.append("clock.png")
        tfAddItem.text="" // 텍필 내용 삭제
        _ = navigationController?.popViewController(animated: true) //테이블 뷰로 돌아가게 한다! (팝)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
