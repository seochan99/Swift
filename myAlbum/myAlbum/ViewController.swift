//
//  ViewController.swift
//  myAlbum
//
//  Created by 서희찬 on 2023/07/03.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func showAlert(_ sender: Any) {
        let message = "가격은 \(currentValue)입니다."
        // alert, 알림창 만들기
        let alert = UIAlertController(title: "Hello", message: message, preferredStyle: .alert)
        
        
        // action, 버튼 클릭시 핸들 가능, 지금은 nil
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        // alert에 action
        alert.addAction(action)
        
        // 이를 통해 alert를 띄우는 작업을 함
        present(alert,animated: true,completion: nil)
        
        // random숫자 가져오는 법, UInt32 Type
        let randomPrice = arc4random_uniform(10000)+1
        
        //UInt32이라서 Int로 변환
        currentValue = Int(randomPrice)
    }
    


}

