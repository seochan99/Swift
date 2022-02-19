//
//  ViewController.swift
//  ImageViewMission
//
//  Created by 서희찬 on 2022/02/19.
//

import UIKit

class ViewController: UIViewController {
    
    //이미지 이름 변수
    var maxImage = 6
    var numImage = 1
    
    //이미지 뷰 아웃렛
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //버튼 이전액션
    @IBAction func preBtnImage(_ sender: UIButton) {
        numImage-=1
        if(numImage<1){
            numImage = maxImage
        }
        let imageName = String(numImage) + ".png"
        imageView.image = UIImage(named: imageName)
    }
    //다음버튼 액션 
    @IBAction func nextBtnImage(_ sender: UIButton) {
        numImage+=1
        if(numImage>maxImage){
            numImage = 1
        }
        let imageName = String(numImage) + ".png"
        imageView.image = UIImage(named: imageName)
    }
}

