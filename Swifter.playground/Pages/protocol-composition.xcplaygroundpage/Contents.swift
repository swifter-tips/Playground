
import Foundation

protocol KittenLike {
    func meow() -> String
}

protocol DogLike {
    func bark() -> String
}

protocol TigerLike {
    func aou() -> String
}

class MysteryAnimal: KittenLike, DogLike, TigerLike {
    func meow() -> String {
        return "meow"
    }
    
    func bark() -> String {
        return "bark"
    }
    
    func aou() -> String {
        return "aou"
    }
}


//protocol PetLike: KittenLike, DogLike {
//    
//}
//
//protocol CatLike: KittenLike, TigerLike {
//    
//}

typealias PetLike = protocol<KittenLike, DogLike>
typealias CatLike = protocol<KittenLike, TigerLike>

struct SoundChecker {
    static func checkPetTalking(pet: PetLike) {
        //...
    }
    
    static func checkCatTalking(cat: CatLike) {
        //...
    }
}

protocol A {
    func bar() -> Int
}

protocol B {
    func bar() -> String
}

class Class: A, B {
    func bar() -> Int {
        return 1
    }
    
    func bar() -> String {
        return "Hi"
    }
}

let instance = Class()
let num = (instance as A).bar()  // 1
let str = (instance as B).bar()  // "Hi"
