
import UIKit

func swapMe1<T>(inout a: T, inout b: T) {
    let temp = a
    a = b
    b = temp
}

func swapMe2<T>(inout a: T, inout b: T) {
    (a,b) = (b,a)
}

var a = 1
var b = 2

(a, b)
swapMe1(&a, b: &b)
(a, b)


swapMe2(&a, b: &b)
(a, b)

let rect = CGRectMake(0, 0, 100, 100)
let (small, large) = rect.divide(20, fromEdge: .MinXEdge)

small
large

