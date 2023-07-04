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
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            // 4. Start. the task
            task.resume()
            
        }
        // 아무것도 return 하지 않는다!
        func handle(data:Data?, response:URLResponse?, error:Error?)->Void{
            if error != nil{
                print(error!)
                return
            }
            if let safeData = data {
                // 데이터 문자열을 받음
                let dataString = String(data: safeData, encoding: .utf8)
                print(dataString)
            }
            
            
        }

        
        
        
        
    }
    
}
