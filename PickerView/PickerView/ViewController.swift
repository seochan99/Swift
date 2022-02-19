//
//  ViewController.swift
//  PickerView
//
//  Created by 서희찬 on 2022/02/19.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{ //델리게이트 클래스 상속
    let MAX_ARR_NUM = 10
    
    //col에 따라 피커 더 생김
    let PICKER_VIEW_COLUMN = 2
    
    var imageArray = [UIImage?]() //UIIMAGE타입의 배열
    
    
    var imageFileName = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var pickerImage: UIPickerView!
    
    @IBOutlet var lblImageFileName: UILabel!
    //델리게이트 : 대리자
    //대신해줌 일
    //피커뷰의 델리게이트 메서드 사용가능 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0..<MAX_ARR_NUM{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image) //이미지배열에 이미지 추가
        }
        
        //초기화면
        lblImageFileName.text = imageFileName[0] //이름에 첫번째 파일 명 출력
        imageView.image = imageArray[0] //이미지 뷰에 첫번째 이미지 표시
        
    }
    // returns the number of 'columns' to display
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    // returns the # of rows in. ach component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count //10반환
    }
    
    //타이틀
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row] //각 열 넘겨줌
//    }
    // view
    
    // 피커뷰에게 컴포넌트의 각 열의 뷰를 UIView 타입의 값으로 넘겨즘, 이미지 뷰에 저장되어 있는 이미지를 넘겨줌
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row]) // 이미지 가져오기
        imageView.frame = CGRect(x:0, y:0, width:100, height:100) //이미지 크기 설정
        return imageView
    }
    
    
    //사용자가 피커 뷰의 룰렛을 돌려 원하는 열 선택시 해야할 일을 델리게이트에게 지시하는 메서드
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //0번째 col = 글자
        if(component==0){
            lblImageFileName.text = imageFileName[row] //사용자가 선택한 값이 row임 !

        }else{
            //1번째 col = 사진 
            imageView.image = imageArray[row]
        }
    }
    
    //


}

