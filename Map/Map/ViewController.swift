//
//  ViewController.swift
//  Map
//
//  Created by 서희찬 on 2022/02/23.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    @IBOutlet var myMap: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 우선 위치정보는 공백으로 둔다.
        lblLocationInfo1.text=""
        lblLocationInfo2.text=""
        
        // 델리게이트 셀프로
        locationManager.delegate = self
        
        // 정확도 최고치
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // 위치 데이터 추적을 위해 사용자에게 승인 요구
        locationManager.requestWhenInUseAuthorization()
        
        // 위치 업데이트 시작
        locationManager.startUpdatingLocation()
        
        // 위치 보기 값 true로 설정
        myMap.showsUserLocation = true
    }
    
    func goLocation(latitudeValue : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double)->CLLocationCoordinate2D{
        //CLLocationCoordinate2DMake : 위도와 경도를 매개변수로 하여 함수 호출 후 pLocation값을 return 받는다.
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        // 범위값을 매개 변수로 하여 return spanValue
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        // pLcoation, spanValue -> return pRegion
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        //pRegion -> call myMap.setRegion function
        myMap.setRegion(pRegion, animated: true)
        
        //반환
        return pLocation
    }
    
    // 핀 설치를 위한 함수
    func setAnnotation(latitudeValue : CLLocationDegrees,longitudeValue : CLLocationDegrees, delta span :Double, title strTitle:String, subtitle strSubtitle:String){
        
        //핀 설치 위해 함수 호출 후 return 값을 annotation에 저장
        let annotation = MKPointAnnotation()
        
        //annotation의 조정값을 goLocation함수로부터 2D형태로 받아야하는데 이를 위해 goLocation함수를 수정해야한다.
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        
        // annotation 셋팅 후 지도에 전달
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    // 위치가 업데이트되었을 때 지도에 위치 나타내는 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last //마지막 위치 찾기
        
        //마지막 위치의 위도와 경도값을 통해 goLocation호출 delta값은 작을 수록 지도 확대 1->0.01은 100배 확대
        // return 값 받는 함수로 변경됐으니 _=추가
        _=goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue:  (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        //위도와 경도 값을 가지고 위치정보 찾기
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks,error)->Void in
            let pm = placemarks!.first
            let country = pm!.country
            var adress:String = country!
            
            // pm상수에서 지역 값이 존재한다면 adress 문자열에 추가
            if pm!.locality != nil {
                adress += " "
                adress += pm!.locality!
            }
            
            // pm상수에서 도로 값이 존재한다면 adress문자열에 추가
            if pm!.thoroughfare != nil{
                adress += " "
                adress += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = adress
        })
        //마지막 위치 업데이트 중단
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            
            //기존에 작성되어있던 텍스트 삭제
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            
            // 다시 원래 위치로 
            locationManager.startUpdatingLocation()
            
        }else if sender.selectedSegmentIndex == 1{
            setAnnotation(latitudeValue: 37.5591, longitudeValue: 126.9997, delta: 0.1, title: "동국대학교", subtitle: "서울특별시 중구 필동로1길 30")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "동국대학교"
        }else if sender.selectedSegmentIndex == 2{
            setAnnotation(latitudeValue: 37.5676, longitudeValue: 127.0085, delta: 0.1, title: "DDP", subtitle: "서울특별시 중구 을지로7가 을지로 281")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "DDP 동대문디자인플라자"
        }
    }
}

