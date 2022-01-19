//: [Previous](@previous)

import Foundation

/*
 import and parse baby names from 2020 file into array of baby names
 create array to store longest names
 create variable to store longest name length
 loop through array and add name and length to dictionary
 loop from 0 to some number to find the first number key that has a value and add those words to array
 if only one name, print the shortest name is: x
 if more than one, print the shortest names are: x, y
 */

let bundle = Bundle.main
guard let path = bundle.path(forResource: "baby_names_2020_short", ofType: "txt") else { fatalError("path is nil") }
guard let content = try? String(contentsOfFile: path) else { fatalError("content is nil") }

let babyNames = content.components(separatedBy: .newlines)

var longestNames: [String] = []
var longestLength: Int = 0

for babyName in babyNames {
    if babyName.count > longestLength {
        longestNames = [babyName]
        longestLength = babyName.count
    } else if babyName.count == longestLength {
        longestNames.append(babyName)
    }
}

if longestNames.count == 1 {
    print("The longest baby name in 2020 was: \(longestNames) at \(longestLength) letters long.")
} else {
    print("The longest baby names in 2020 names were: \(longestNames) at \(longestLength) letters long.")
}

//: [Next](@next)
