import UIKit

// 방법 1 : 선호
var scoreDic: [String:Int] = ["chans":50, "hui":40, "ko":60]

// 방법 2
//var scoreDic2 : Dictionary<String, Int> = ["chans":50, "hui":40, "ko":60]

// Optional
scoreDic["chans"]

// 안정적으로 가져오는 작업
// optional이기에
if let score = scoreDic["chans"] {
    score
}else{
    // score없음
}

// 빈깡통 만들기
//scoreDic = [:]

scoreDic.isEmpty
scoreDic.count
scoreDic["chans"] = 60

// 사용자 추가
scoreDic["zzz"] = 90

// 제거
scoreDic["zzz"]=nil



for (name,score) in scoreDic{
    print(name, score)
}

// key만 가져오기
for key in scoreDic.keys{
    print(key)
}

// value만 가져오기
for value in scoreDic.values{
    print(value)
}
// 도전과제
var myDic: [String : String] = ["name":"chan","city":"Seoul","job":"programmer"]

myDic["city"] = "busan"

func printMyDic(dic:[String:String]){
    if let name = dic["name"], let city = dic["city"]{
        print(name,city)
    }else{
        print("no city, name")
    }
}

printMyDic(dic: myDic)

var someArray : Array<Int> = [1,2,3,4]
// set 선언
// 순서가없음
var someSet : Set<Int> = [1,2,3,4,4]

someSet.isEmpty
someSet.count
someSet.contains(4)
someSet.insert(5)
someSet.remove(4)

someArray
