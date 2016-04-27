
import Foundation
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

class MyClass {
    @objc func callMe() {
        print("Hi")
    }
}

let object = MyClass()

NSTimer.scheduledTimerWithTimeInterval(1, target: object,
                selector: #selector(MyClass.callMe), userInfo: nil, repeats: true)

let url = NSURL(string: "http://httpbin.org/get")!

let getTask = NSURLSession.sharedSession().dataTaskWithURL(url) {
    (data, response, error) -> Void in
    let dictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: [])
    
    print(dictionary)
}

getTask.resume()
