
import Foundation

let d = NSData()

do {
    try d.writeToFile("Hello", options: [])
} catch let error as NSError {
    print ("Error: \(error.domain)")
}

enum LoginError: ErrorType {
    case UserNotFound, UserPasswordNotMatch
}

func login(user: String, password: String) throws {
    let users = [String: String]()

    if !users.keys.contains(user) {
        throw LoginError.UserNotFound
    }
    
    if users[user] != password {
        throw LoginError.UserPasswordNotMatch
    }
    
    print("Login successfully.")
}

do {
    try login("onevcat", password: "123")
} catch LoginError.UserNotFound {
    print("UserNotFound")
} catch LoginError.UserPasswordNotMatch {
    print("UserPasswordNotMatch")
}

// Do something with login user

enum Error: ErrorType {
    case Negative
}

func methodThrowsWhenPassingNegative(number: Int) throws -> Int {
    if number < 0 {
        throw Error.Negative
    }
    return number
}

if let num = try? methodThrowsWhenPassingNegative(100) {
    print(num.dynamicType)
} else {
    print("failed")
}

// Never do this!
func methodThrowsWhenPassingNegative1(number: Int) throws -> Int? {
    if number < 0 {
        throw Error.Negative
    }
    if number == 0 {
        return nil
    }
    return number
}

if let num = try? methodThrowsWhenPassingNegative1(0) {
    print(num.dynamicType)
} else {
    print("failed")
}

func methodThrows(num: Int) throws {
    if num < 0 {
        print("Throwing!")
        throw Error.Negative
    }
    print("Executed!")
}

func methodRethrows(num: Int, f: Int throws -> ()) rethrows {
    try f(num)
}

do {
    try methodRethrows(1, f: methodThrows)
} catch _ {
    
}


