
import Foundation

class MyClass {
    var a = 1
    deinit {
        print("deinit")
    }
}

var pointer: UnsafeMutablePointer<MyClass>!

pointer = UnsafeMutablePointer<MyClass>.alloc(1)
pointer.initialize(MyClass())

print(pointer.memory.a)
pointer.destroy()
pointer.dealloc(1)
pointer = nil

// 输出：
// 1
// deinit

var x:UnsafeMutablePointer<tm>!
var t = time_t()
time(&t)
x = localtime(&t)
x = nil
