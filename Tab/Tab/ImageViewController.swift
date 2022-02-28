//
//  ViewController.swift
//  ImageView
//
//  Created by 서희찬 on 2022/02/19.
//

import UIKit

class ImageViewController: UIViewController {
    var isZoom = false
//    ? : 옵셔널 변수, 값이 있을 수 도 있다~ 하면서 전달해주고 나중에 쓸거를 이렇게 표시한다
    var imgOn : UIImage?
    var imgOff : UIImage?

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn //초기이미지는 켜져있는거
        
    }

    //버튼 클릭시 액션함수
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0 //CGFloat = Float이랑 같음 ㅇㅇ
        // 확대한 크기를 저장해둘공간
        var newWidth:CGFloat, newHeight:CGFloat // 변수선언
        if(isZoom){ //현재 확대일때
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            btnResize.setTitle("확대", for: .normal)  //버튼 텍스트 확대로 변경
        }
        else{ //현재 축소일때
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            btnResize.setTitle("축소", for: .normal)  //버튼 텍스트 축소로 변경
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    // 스위치 온오프때마다 이미지 변경
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn{ // 센더가 켜져있으면 온
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
        }
    }
}
