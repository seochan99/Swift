//
//  ViewController.swift
//  DatePicker
//
//  Created by 서희찬 on 2022/02/19.
//

import UIKit

class DateViewController: UIViewController {
    let timeSelector : Selector = #selector(DateViewController.updateTime) //타이머가 구동되면 실행될 함수
    let interval = 1.0 //타이머 간격 1.0초 간격
    var count = 0 // 타이머거 설정한 가격대로 실행되는지 체크한는 변수
    
    var alarmTime : String? //알람시간
    

    @IBOutlet var IblCurrentTime: UILabel!
    @IBOutlet var IblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true) // 타이머간격, 동작될 view, 타이머 구동시 실행활 함수, 사용자 정보, 반복 여부
    }


    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePcikerView = sender // sender에 선택한 날짜가 들어옴,이 값읇 변수에 저장
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" //dateFromat 속성 설정
        IblPickerTime.text =
        "선택시간 : " + formatter.string(from: datePcikerView.date) //데이트피커에서 선택한 날자를 설정한 포맷대로 가져온다
        
        //시간 포맷형식 변경
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePcikerView.date)
    }
    @objc func updateTime(){ // objc와의 호환을 위해 @붙임
//        시간이 잘 오르는지 체크하는 코드
//        IblCurrentTime.text = String(count)
//        count += 1
        
        let date = NSDate() //현재 시간 가져오기
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE" //dateFromat 속성 설정
        IblCurrentTime.text =
        "선택시간 : " + formatter.string(from: date as Date) // 신기..
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        //알람시간과 현재시간이 동일할때 
        if(alarmTime == currentTime){
            view.backgroundColor = UIColor.red
        }
        else{
            view.backgroundColor = UIColor.white
        }
        
        
        
    }
}

