
import Foundation

let arr: NSArray = [1,2,3,4,5]
var result = 0
arr.enumerateObjectsUsingBlock { (num, idx, stop) -> Void in
    result += num as! Int
    if idx == 2 {
        stop.memory = true
    }
}
print(result)
// 输出：6

result = 0
for (idx, num) in [1,2,3,4,5].enumerate() {
    result += num
    if idx == 2 {
        break
    }
}
print(result)