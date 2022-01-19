//: [Previous](@previous)

import Foundation

/*
 import and parse countries list into array lowercased
 create array for names that contain another country name
 loop through country names
 nested loop through country names
 if same name, continue
 if outer name contains inner name, add to array
 print list of names that contain another
 */

let bundle = Bundle.main
guard let path = bundle.path(forResource: "countries", ofType: "txt") else { fatalError("path is nil") }
guard let content = try? String(contentsOfFile: path) else { fatalError("content is nil") }

var countries = content.components(separatedBy: .newlines)
countries = countries.map({ $0.lowercased() })

var namesThatContainAnother: [String] = []

for country1 in countries {
    for country2 in countries {
        if country1 == country2 {
            continue
        }

        if country1.contains(country2) {
            namesThatContainAnother.append(country1)
        }
    }
}

print("Country names that contain another country name: \(namesThatContainAnother)")

//: [Next](@next)
