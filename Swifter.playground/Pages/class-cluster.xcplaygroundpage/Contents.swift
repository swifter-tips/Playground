
import UIKit

class Drinking {
    typealias LiquidColor = UIColor
    var color: LiquidColor {
        return LiquidColor.clearColor()
    }
    
    class func drinking(name: String) -> Drinking {
        var drinking: Drinking
        switch name {
        case "Coke":
            drinking = Coke()
        case "Beer":
            drinking = Beer()
        default:
            drinking = Drinking()
        }
        
        return drinking
    }
}

class Coke: Drinking {
    override var color: LiquidColor {
        return LiquidColor.blackColor()
    }
}

class Beer: Drinking {
    override var color: LiquidColor {
        return LiquidColor.yellowColor()
    }
}

let coke = Drinking.drinking("Coke")
coke.color // Black

let beer = Drinking.drinking("Beer")
beer.color // Yellow


let cokeClass = NSStringFromClass(coke.dynamicType) //Coke

let beerClass = NSStringFromClass(beer.dynamicType) //Beer
