//
//  ViewController.swift
//  PageControl
//
//  Created by 서희찬 on 2022/02/23.
//

import UIKit

//이미지 변수
var images = ["01.png","02.png","03.png","04.png","05.png","06.png"]

class ViewController: UIViewController {

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count //전체페이지 수 = 이미지 수
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green //페이지 표시 하는 부분 색상
        pageControl.currentPageIndicatorTintColor = UIColor.red 
        
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage]) //페이지 컨트롤의 현재페이지의 인덱스값으로 이미지 할당
        
    }
    
}

