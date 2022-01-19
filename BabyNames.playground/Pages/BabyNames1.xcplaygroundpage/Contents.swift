//: [Previous](@previous)

import Foundation

/*
 import and parse baby names from 2020 file into array of baby names
 create array to store shortest names
 create dictionary to store length of names
 loop through array and add name and length to dictionary
 loop from 0 to some number to find the first number key that has a value and add those words to array
 if only one name, print the shortest name is: x
 if more than one, print the shortest names are: x, y
 */

let bundle = Bundle.main
guard let path = bundle.path(forResource: "baby_names_2020_short", ofType: "txt") else { fatalError("path is nil") }
guard let content = try? String(contentsOfFile: path) else { fatalError("content is nil") }

let babyNames = content.components(separatedBy: .newlines)

var shortestNames: [String] = []
var namesAndLengthsDict: [Int: [String]] = [:]

for babyName in babyNames {
    if namesAndLengthsDict[babyName.count] == nil {
        namesAndLengthsDict[babyName.count] = [babyName]
    } else {
        namesAndLengthsDict[babyName.count]?.append(babyName)
    }
}

for index in 0...100 {
    if let shortest = namesAndLengthsDict[index],
        !shortest[0].isEmpty {
        shortestNames = namesAndLengthsDict[index]!
        break
    }
}

if shortestNames.count == 1 {
    print("The shortest baby name in 2020 was: \(shortestNames)")
} else {
    print("The shortest baby names in 2020 names were: \(shortestNames)")
}

//: [Next](@next)
