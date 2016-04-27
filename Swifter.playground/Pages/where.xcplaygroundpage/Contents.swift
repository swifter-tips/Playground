
import Foundation

let name = ["王小二","张三","李四","王二小"]

name.forEach {
    switch $0 {
    case let x where x.hasPrefix("王"):
        print("\(x)是笔者本家")
    default:
        print("你好，\($0)")
    }
}

// 输出：
// 王小二是笔者本家
// 你好，张三
// 你好，李四
// 王二小是笔者本家

let num: [Int?] = [48, 99, nil]
num.forEach {
    if let score = $0 where score > 60 {
        print("及格啦 - \(score)")
    } else {
        print(":(")
    }
}
// 输出：
// :(
// 及格啦 - 99
// :(

for score in num where score > 60 {
    print("及格啦 - \(score)")
}
// 输出：
// 及格啦 - Optional(99)

let sortableArray: [Int] = [3,1,2,4,5]
let unsortableArray: [AnyObject?] = ["Hello", 4, nil]

sortableArray.sort()

//unsortableArray.sort()


