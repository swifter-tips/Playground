
import Foundation

let levels = "ABCDE"
for i in levels.characters {
    print(i)
}

// 输出：
// ABCDE

if (levels as NSString).containsString("BC") {
    print("包含字符串")
}

// 输出：
// 包含字符串


let nsRange = NSMakeRange(1, 4)
// 编译错误
// Cannot invoke `stringByReplacingCharactersInRange` with an argument list of type '(NSRange, withString: String)'
//levels.stringByReplacingCharactersInRange(nsRange, withString: "AAAA")

let indexPositionOne = levels.startIndex.successor()
let swiftRange = indexPositionOne ..< indexPositionOne.advancedBy(4)
levels.stringByReplacingCharactersInRange(swiftRange, withString: "AAAA")
// 输出：
// AAAAA

(levels as NSString).stringByReplacingCharactersInRange(
    nsRange, withString: "AAAA")
