

import Foundation
import XCPlayground

var arr = [14, 11, 20, 1, 3, 9, 4, 15, 6, 19,
    2, 8, 7, 17, 12, 5, 10, 13, 18, 16]

func plot<T>(title: String, array: [T]) {
    for value in array {
        XCPlaygroundPage.currentPage.captureValue(value, withIdentifier: title)
    }
}

plot("起始", array: arr)

func swap(inout x: Int, inout y: Int) {
    (x, y) = (y, x)
}

func bubbleSort<T: Comparable>(inout input: [T]) {

    for i in 0 ..< input.count - 1 {
        let i = input.count - i
        var didSwap = false
        for j in 0 ..< i - 1 {
            if input[j] > input[j + 1] {
                didSwap = true
                swap(&input[j], &input[j + 1])
            }
        }
        if !didSwap {
            break
        }
        plot("第 \(input.count - (i - 1)) 次迭代", array: input)
    }
    plot("结果", array: input)
}

bubbleSort(&arr)
