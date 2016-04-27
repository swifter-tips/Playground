
import UIKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

class MyClass: NSObject {
    dynamic var date = NSDate()
}

class MyClass1: NSObject {
    var date = NSDate()
}

class MyChildClass: MyClass1 {
    dynamic override var date: NSDate {
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
            options: .New,
            context: &myContext)
        
        delay(3) {
            self.myObject.date = NSDate()
        }
    }
    
    override func observeValueForKeyPath(keyPath: String?,
            ofObject object: AnyObject?,
            change: [String : AnyObject]?,
            context: UnsafeMutablePointer<Void>)
    {
        if let change = change where context == &myContext {
            let a = change[NSKeyValueChangeNewKey]
            print("日期发生变化 \(a)")
        }
    }
}

let obj = Class()


