//: [Previous](@previous)

import Foundation

/*
 import and parse list of countries to array
 create array of countries with > 50% vowels
 create list of vowels
 loop through countries
 create variable to track number of vowels in country name
 loop through country name
 if char is vowel, increment number of vowels
 if number of vowels is greater than country name length divided by 2, add to list of countries
 print list of countries
 */

let bundle = Bundle.main
guard let path = bundle.path(forResource: "countries", ofType: "txt") else { fatalError("path is nil") }
guard let content = try? String(contentsOfFile: path) else { fatalError("content is nil") }

let countries = content.components(separatedBy: .newlines)

var countriesWithVowels: [String] = []
let vowels = "AEIOU"

for country in countries {
    var numVowels = 0
    for char in country {
        if vowels.contains(String(char).capitalized) {
            numVowels += 1
        }
    }

    if Double(numVowels) >= (Double(country.count) / 2) {
        countriesWithVowels.append(country)
    }
}

print(countriesWithVowels)

//: [Next](@next)
