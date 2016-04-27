import Foundation

class MyObject: NSObject {
    func callMe() {
        //...
    }
    
    func callMeWithParam(obj: AnyObject!) {
        //...
    }
    
    func turnByAngle(theAngle: Int, speed: Float) {
        //...
    }
    
    func selectors() -> [Selector] {
        let someMethod = #selector(callMe)
        let anotherMethod = #selector(callMeWithParam(_:))
        let method = #selector(turnByAngle(_:speed:))

        return [someMethod, anotherMethod, method]
    }
    
    func otherSelectors() -> [Selector] {
        let someMethod = #selector(callMe)
        let anotherMethod = #selector(callMeWithParam)
        let method = #selector(turnByAngle)
        
        return [someMethod, anotherMethod, method]
    }
    
    
    func commonFunc() {
        
    }
    
    func commonFunc(input: Int) -> Int {
        return input
    }
    
    func sameNameSelectors() -> [Selector] {
        let method1 = #selector(commonFunc as ()->())
        let method2 = #selector(commonFunc as Int->Int)
        return [method1, method2]
    }
}

let selectors = MyObject().selectors()
print(selectors)


let otherSelectors = MyObject().otherSelectors()
print(otherSelectors)

let sameNameSelectors = MyObject().sameNameSelectors()
print(sameNameSelectors)