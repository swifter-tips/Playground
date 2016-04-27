
import Foundation

var bytes: [CChar] = [1,2,3]
sizeofValue(bytes)
// 8

let data = NSData(bytes: &bytes, length:sizeof(CChar) * bytes.count)
