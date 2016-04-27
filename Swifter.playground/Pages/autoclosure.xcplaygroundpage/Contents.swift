
import Foundation

func logIfTrue(predicate: () -> Bool) {
    if predicate() {
        print("True")
    }
}

logIfTrue({return 2 > 1})
logIfTrue({2 > 1})
logIfTrue{2 > 1}


func logIfTrue(@autoclosure predicate: () -> Bool) {
    if predicate() {
        print("True")
    }
}

logIfTrue(2 > 1)