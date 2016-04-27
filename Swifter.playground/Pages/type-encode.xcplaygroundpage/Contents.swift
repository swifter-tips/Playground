
import UIKit

let int: Int = 0
let float: Float = 0.0
let double: Double = 0.0

let intNumber: NSNumber = int
let floatNumber: NSNumber = float
let doubleNumber: NSNumber = double

String.fromCString(intNumber.objCType)
String.fromCString(floatNumber.objCType)
String.fromCString(doubleNumber.objCType)

// 结果分别为：
// {Some "q"}
// {Some "f"}
// {Some "d"}
// 注意，fromCString 返回的是 `String?`


let p = NSValue(CGPoint: CGPointMake(3, 3))
String.fromCString(p.objCType)
// {Some "{CGPoint=dd}"}

let t = NSValue(CGAffineTransform: CGAffineTransformIdentity)
String.fromCString(t.objCType)
// {Some "{CGAffineTransform=dddddd}"}