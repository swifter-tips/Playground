
import UIKit

UIView.animateWithDuration(0.3,
    delay: 0.0,
    options: [.CurveEaseIn, .AllowUserInteraction],
    animations: {},
    completion: nil)

struct YourOption: OptionSetType {
    let rawValue: UInt
    static let None = YourOption(rawValue: 0)
    static let Option1 = YourOption(rawValue: 1)
    static let Option2 = YourOption(rawValue: 1 << 1)
    //...
}

YourOption.Option1

[YourOption.Option1, YourOption.Option2]
