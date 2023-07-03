//
//  ViewController.swift
//  myAlbum
//
//  Created by 서희찬 on 2023/07/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func showAlert(_ sender: Any) {
        // alert, 알림창 만들기
        let alert = UIAlertController(title: "Hello", message: "My First App", preferredStyle: .alert)
        
        
        // action, 버튼 클릭시 핸들 가능, 지금은 nil
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        // alert에 action
        alert.addAction(action)
        
        // 이를 통해 alert를 띄우는 작업을 함
        present(alert,animated: true,completion: nil)
    }
    
    @IBAction func haha(_ sender: Any) {
        let alert = UIAlertController(title: "웃지마 ㅋ", message: "웃지믈르고", preferredStyle: .alert)
        let action = UIAlertAction(title:"K",style:.default, handler:nil)
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    

}

