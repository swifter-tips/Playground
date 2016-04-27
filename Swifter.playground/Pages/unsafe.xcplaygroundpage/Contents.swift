
import Foundation

func method(num: UnsafePointer<CInt>) {
    print(num.memory)
}

// Swift
var a: CInt = 123
method(&a)    // 输出 123

let arr = NSArray(object: "meow")
let str = unsafeBitCast(CFArrayGetValueAtIndex(arr, 0), CFString.self)
// str = "meow"
