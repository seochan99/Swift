//
//  ViewController.swift
//  HelloWorld
//
//  Created by 서희찬 on 2022/02/10.
//

import UIKit

class ViewController: UIViewController {

//    아웃렛변수는 클래스 젤 위에
    
//    헬로 아웃렛변수서
    @IBOutlet var lblHello: UILabel!
    
//    텍스트필드 아웃렛변수
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    액션함수는 클래스 맨밑에
    @IBAction func SubmitBtn(_ sender: UIButton) {
        
        // Hello라는 문자열에 텍스트네임변수의 문자열을 결합에서 lblHell텍스트에 넣는다는 의미
        
        lblHello.text = "Hello, " + txtName.text!
        // ! : 옵셔널 변수
    }
}

