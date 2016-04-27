
import UIKit

extension UIButton {
    class func xxx_swizzleSendAction() {
        struct xxx_swizzleToken {
            static var onceToken : dispatch_once_t = 0
        }
        dispatch_once(&xxx_swizzleToken.onceToken) {
            let cls: AnyClass! = UIButton.self
            
            let originalSelector = #selector(sendAction(_:to:forEvent:))
            let swizzledSelector = #selector(xxx_sendAction(_:to:forEvent:))
            
            let originalMethod =
            class_getInstanceMethod(cls, originalSelector)
            let swizzledMethod =
            class_getInstanceMethod(cls, swizzledSelector)
            
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
    
    public func xxx_sendAction(action: Selector,
        to: AnyObject!,
        forEvent: UIEvent!)
    {
        struct xxx_buttonTapCounter {
            static var count: Int = 0
        }
        
        xxx_buttonTapCounter.count += 1
        print(xxx_buttonTapCounter.count)
        xxx_sendAction(action, to: to, forEvent: forEvent)
    }
}

extension UIButton {
    override public class func initialize() {
        if self != UIButton.self {
            return
        }
        UIButton.xxx_swizzleSendAction()
    }
}




 
