//: [Previous](@previous)

import Foundation

/*
 import and parse country names to an array and lowercase
 create list of single vowel words
 create a string of the vowels to use as a key
 loop through country names
 create variable to hold a vowel
 loop through characters of country name
 if letter is a vowel and vowel variable is nil, set variable to vowel
 if letter is a vowel and vowel variable is not nil, check if the vowels match
 if match, continue, if not append to string
 after character loop, if vowel variable is 1, add to list of single vowel words, else continue
 print list of single vowel words
 */

let bundle = Bundle.main
guard let path = bundle.path(forResource: "countries", ofType: "txt") else { fatalError("path is nil") }
guard let content = try? String(contentsOfFile: path) else { fatalError("content is nil") }

var countries = content.components(separatedBy: .newlines)
countries = countries.map({ $0.lowercased() })

var singleVowelNames: [String] = []
var vowels = "aeiou"

for country in countries {
    var vowelsInName = ""
    for letter in country {
        if vowels.contains(String(letter)) {
            if vowelsInName.contains(letter) {
                continue
            } else {
                vowelsInName.append(letter)
            }
        }
    }
    if vowelsInName.count == 1 {
        singleVowelNames.append(country)
    }
}
singleVowelNames = singleVowelNames.map({ $0.capitalized })

print("The countries with only one of the vowels are: \(singleVowelNames)")

//: [Next](@next)
