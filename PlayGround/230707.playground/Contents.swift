import UIKit

// 배열선언 1 : 선호
var evenNumbers: [Int] = [2,4,6,8]

// 배열선언 2
let evenNumbers2: Array<Int> = [2,4,6,7]

// 배열 추가
evenNumbers.append(10)

// 여러개 요소 추가할시 1
evenNumbers += [12,14,16]

// 여러개 요소 추가할시 2
evenNumbers.append(contentsOf: [18,20])

// 비었는지 체크
let isEmpty = evenNumbers.isEmpty

// 요소 개수 확인
evenNumbers.count

// first optional임 : 값이 있을수도 있고.. 없을 수도 있고..
let firstItem = evenNumbers.last

// optional 처리하기
if let firstElement = evenNumbers.first{
    print("firs titem 있음\(firstElement)")
}

// 최소 최대 확인
evenNumbers.min()
evenNumbers.max()

// 인덱스로 가져오기
var firstItem2 = evenNumbers[0]
var secondItem = evenNumbers[1]
// 인덱스 마지막체크 잘하기 ! index out of range
var tenItem = evenNumbers[9]

// range로 가져오기
let firstThree = evenNumbers[0...2]

// cotains : 뭐 들어있니?
evenNumbers.contains(3)
evenNumbers.contains(4)

// insert : 삽입
evenNumbers.insert(0, at: 0)
evenNumbers

// 0번째 삭제
evenNumbers.remove(at: 0)

// update
evenNumbers[0] = -2
evenNumbers

// 여러개 인덱스 업데이트도 가능
evenNumbers[0...2] = [-2,0,2]
evenNumbers

// 0이랑 1위치를 바꾸겠다
evenNumbers.swapAt(0, 1)
evenNumbers


// 반복문으로 가져오기
for num in evenNumbers{
    print(num)
}

// 인덱스도 바로알 수 있는 fora문

for (num,idx) in evenNumbers.enumerated(){
    print("\(idx) : \(num)")
}

// 앞에 3개 없애기, 실제로 영향을 주지 않음
let firstTreeRemoved = evenNumbers.dropFirst(3)
evenNumbers
firstTreeRemoved

// 뒤에 3개 없애기
let lastTreeRemoved = evenNumbers.dropLast(3)
evenNumbers
lastTreeRemoved

// 앞에 3개 가져오기
let FirstThree = evenNumbers.prefix(3)

// 뒤에 3개 가져오기
let lastThree = evenNumbers.suffix(3)
