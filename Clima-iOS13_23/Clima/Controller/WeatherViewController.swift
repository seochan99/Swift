//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

//UITextFieldDelegate : 텍스트폼 연결
class WeatherViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weatherManager = WeatherManager()
    
    
    // 텍스트 필드
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textField가 ViewController에 보고하는 것
        searchTextField.delegate = self
        
    }

    // 액션 검색버튼
    @IBAction func searchPressed(_ sender: UIButton) {
        
        // textField 수정끝을 알리고 닫음
        searchTextField.endEditing(true)
        
        print(searchTextField.text!)
    }
    
    // return 버튼 누름!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // textField 수정끝을 알리고 닫음
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        // true 반환
        return true
    }
    
    
    // text field를 끝낼려고 할때
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // 비어있지 않다면
        if textField.text != ""{
            // true로 끝내는것을 허용
            return true
        }else{
            // 비어있다면
            // 무엇이든 입력하세요! 라는 안내문구 출력
            textField.placeholder = "Type SomeThing here"
            return false
        }
    }
    
    // 수정이 끝났을때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // city는 입력받은 텍스트로 하고 이를 매니저에 전달한다
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextField.text = ""
    }
}

