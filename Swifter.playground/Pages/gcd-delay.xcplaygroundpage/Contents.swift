
import Foundation
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// 创建目标队列
let workingQueue = dispatch_queue_create("my_queue", nil)

// 派发到刚创建的队列中，GCD 会负责进行线程调度
dispatch_async(workingQueue) {
    // 在 workingQueue 中异步进行
    print("努力工作")
    NSThread.sleepForTimeInterval(2)  // 模拟两秒的执行时间
    
    dispatch_async(dispatch_get_main_queue()) {
        // 返回到主线程更新 UI
        print("结束工作，更新 UI")
    }
}

let time: NSTimeInterval = 2.0
let delay = dispatch_time(DISPATCH_TIME_NOW,
    Int64(time * Double(NSEC_PER_SEC)))
dispatch_after(delay, dispatch_get_main_queue()) {
    print("2 秒后输出")
}


import Foundation

typealias Task = (cancel : Bool) -> Void

func delay(time:NSTimeInterval, task:()->()) ->  Task? {
    
    func dispatch_later(block:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(time * Double(NSEC_PER_SEC))),
            dispatch_get_main_queue(),
            block)
    }
    
    var closure: dispatch_block_t? = task
    var result: Task?
    
    let delayedClosure: Task = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                dispatch_async(dispatch_get_main_queue(), internalClosure);
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(cancel: false)
        }
    }
    
    return result;
    
}

func cancel(task:Task?) {
    task?(cancel: true)
}

delay(2) { print("2 秒后输出") }

let task = delay(5) { print("拨打 110") }

// 仔细想一想..
// 还是取消为妙..
cancel(task)


