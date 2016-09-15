import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class MyClass: NSObject {
    dynamic var date = Date()
}

class MyClass1: NSObject {
    var date = Date()
}

class MyChildClass: MyClass1 {
    dynamic override var date: Date {
        get { return super.date }
        set { super.date = newValue }
    }
}

private var myContext = 0

class Class: NSObject {
    
    var myObject: MyClass!
    
    override init() {
        super.init()
        myObject = MyClass()
        print("初始化 MyClass，当前日期: \(myObject.date)")
        myObject.addObserver(self,
            forKeyPath: "date",
            options: .new,
            context: &myContext)

        delay(3) {
            self.myObject.date = Date()
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                            of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                              context: UnsafeMutableRawPointer?)
    {
        if let change = change, context == &myContext {
            let newDate = change[.newKey]
            print("日期发生变化 \(newDate)")
        }
    }
}

let obj = Class()