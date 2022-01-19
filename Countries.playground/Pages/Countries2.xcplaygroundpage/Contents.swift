//: [Previous](@previous)

import Foundation

/*
 import and parse countries list to countries array
 create array to hold countries that end and begin with a vowel
 create list of vowels
 loop through the array of countries
 if country prefix and suffix is a vowel, add to array of countries that end and begin with vowel
 print resulting array
 */

let bundle = Bundle.main
guard let path = bundle.path(forResource: "countries", ofType: "txt") else { fatalError("path is nil") }
guard let content = try? String(contentsOfFile: path) else { fatalError("content is nil") }

let countries = content.components(separatedBy: .newlines)

var countriesWithVowels: [String] = []
let vowels = "AEIOU"

for country in countries {
    if vowels.contains(country.prefix(1).capitalized) && vowels.contains(country.suffix(1).capitalized) {
        countriesWithVowels.append(country)
    }
}

print(countriesWithVowels)

//: [Next](@next)
