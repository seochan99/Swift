import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d932ef89f1585a36bfea388c8e5e608f&units=metric"
    
    // weather 패치하기
    func fetchWeather(cityName : String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    
    // 작업 수행
    func performRequest(urlString : String){
        // 1. create a URL
        
        if let url = URL(string: urlString){
            // 2. Create a URLSession
            // 세션 오브젝트 생성
            let session = URLSession(configuration: .default)
            
            // 로딩화면 뜨게 한다
            // 3. Give the Session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
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
    func parseJSON(weatherData : Data){
        let decoder = JSONDecoder()
        do{
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodeData.weather[0].description)
        } catch{
            print(error)
        }
        
    }

    
}
