import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d932ef89f1585a36bfea388c8e5e608f&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    // weather 패치하기
    func fetchWeather(cityName : String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    // 현재 위치 날씨 업데이트하기
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    
    
    // 작업 수행
    func performRequest(with urlString : String){
        // 1. create a URL
        
        if let url = URL(string: urlString){
            // 2. Create a URLSession
            // 세션 오브젝트 생성
            let session = URLSession(configuration: .default)
            
            // 로딩화면 뜨게 한다
            // 3. Give the Session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                    // 데이터 문자열을 받음
//                    let dataString = String(data: safeData, encoding: .utf8)
//                    print(dataString)
                }
                
            }
            // 4. Start. the task
            task.resume()
            
        }

    }
    // JSON 파싱하기
    func parseJSON(_ weatherData : Data)->WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            let name = decodeData.name
            
            let weatehr = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weatehr
            
        } catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    

        
    }

