//: [Previous](@previous)

import Foundation
/*
 import and parse countries file into array of countries
 create array to store shortest names
 create dictionary to store length of names
 loop through array and add name and length to dictionary
 loop from 0 to some number to find the first number key that has a value and add those words to array
 if only one word, print the shortest word is: x
 if more than one, print the shortest words are: x, y
 */

let bundle = Bundle.main
guard let path = bundle.path(forResource: "countries", ofType: "txt") else { fatalError("path is nil") }
guard let content = try? String(contentsOfFile: path) else { fatalError("content is nil") }

let countries = content.components(separatedBy: .newlines)

var shortestNames: [String] = []
var namesAndLengthsDict: [Int: [String]] = [:]

for country in countries {
    if namesAndLengthsDict[country.count] == nil {
        namesAndLengthsDict[country.count] = [country]
    } else {
        namesAndLengthsDict[country.count]?.append(country)
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
    print("The shortest country name is: \(shortestNames)")
} else {
    print("The shortest country names are: \(shortestNames)")
}
//: [Next](@next)
