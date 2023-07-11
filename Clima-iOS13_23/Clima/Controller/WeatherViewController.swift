//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

//현재 위치 구현
import CoreLocation

//MARK: - UIViewController
//UITextFieldDelegate : 텍스트폼 연결
class WeatherViewController: UIViewController{
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weatherManager = WeatherManager()
    
    // 로케이션 매니저 불러오기
    let locationManager = CLLocationManager()
    
    // 텍스트 필드
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        locationManager.delegate = self
        // 권한 묻기
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        
        
        weatherManager.delegate = self
        
        // textField가 ViewController에 보고하는 것
        searchTextField.delegate = self
        
    }
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}


//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate{
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
//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate{
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        // 비동기처리
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
        
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 실제로케이션 뽑아내기
        if let location = locations.last{
            locationManager.stopUpdatingLocation() // 업데이트 멈추고다시 불러오기
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude:lat,longitude:lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        
    }
}

