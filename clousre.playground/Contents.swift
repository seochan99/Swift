import UIKit

func calculator(n1: Int, n2: Int, operation: (Int,Int)->Int ) -> Int{
    return operation(n1,n2)
}


//(Int,Int) -> Int

calculator(n1: 2, n2: 3, operation: {$0 * $1})

let arr = [6,4,2,1,3]

let newArr = arr.map{"\($0)"}
