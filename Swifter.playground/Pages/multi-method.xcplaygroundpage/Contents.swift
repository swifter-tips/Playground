
import Foundation

class Pet {}
class Cat: Pet {}
class Dog: Pet {}

func printPet(pet: Pet) {
    print("Pet")
}

func printPet(cat: Cat) {
    print("Meow")
}

func printPet(dog: Dog) {
    print("Bark")
}

printPet(Cat()) // Meow
printPet(Dog()) // Bark
printPet(Pet()) // Pet

func printThem(pet: Pet, _ cat: Cat) {
    printPet(pet)
    printPet(cat)
}

printThem(Dog(), Cat())

// 输出：
// Pet
// Meow

func printThemAgain(pet: Pet, _ cat: Cat) {
    if let aCat = pet as? Cat {
        printPet(aCat)
    } else if let aDog = pet as? Dog {
        printPet(aDog)
    }
    printPet(cat)
}

printThemAgain(Dog(), Cat())
// 输出：
// Bark
// Meow