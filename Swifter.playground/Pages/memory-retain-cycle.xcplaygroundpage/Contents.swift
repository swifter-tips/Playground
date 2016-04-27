

import Foundation

/// 1
class A {
    let b: B
    init() {
        b = B()
        b.a = self
    }
    
    deinit {
        print("A deinit")
    }
}

class B {
    weak var a: A? = nil
    deinit {
        print("B deinit")
    }
}

var obj: A? = A()
obj = nil


/// 2
// RequestManager.swift
class RequestManager: RequestHandler {
    
    @objc func requestFinished() {
        print("请求完成")
    }
    
    func sendRequest() {
        let req = Request()
        req.delegate = self
        
        req.send()
    }
}

// Request.swift
@objc protocol RequestHandler {
    optional func requestFinished()
}

class Request {
    weak var delegate: RequestHandler!;
    
    func send() {
        // 发送请求
        // 一般来说会将 req 的引用传递给网络框架
    }
    
    func gotResponse() {
        // 请求返回
        delegate?.requestFinished?()
    }
}

/// 3
class Person {
    let name: String
    
//    lazy var printName: ()->() = {
//        print("The name is \(self.name)")
//    }
    
    lazy var printName: ()->() = {
        [weak self] in
        if let strongSelf = self {
            print("The name is \(strongSelf.name)")
        }
    }
    
    init(personName: String) {
        name = personName
    }
    
    deinit {
        print("Person deinit \(self.name)")
    }
}

var xiaoMing: Person? = Person(personName: "XiaoMing")
xiaoMing!.printName()
xiaoMing = nil

// 输出:
// The name is XiaoMing
// Person deinit XiaoMing
