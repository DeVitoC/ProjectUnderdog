//: [Previous](@previous)

import Foundation

/*
 import and parse both baby names files to arrays
 create array of same names
 find intersection(s) of arrays and add to array of same names
 print array of same names
 */

let bundle = Bundle.main
guard let path2020 = bundle.path(forResource: "baby_names_2020_short", ofType: "txt") else { fatalError("path is nil") }
guard let path1880 = bundle.path(forResource: "baby_names_1880_short", ofType: "txt") else { fatalError("path is nil") }
guard let content2020 = try? String(contentsOfFile: path2020) else { fatalError("content is nil") }
guard let content1880 = try? String(contentsOfFile: path1880) else { fatalError("content is nil") }

var babyNames2020 = content2020.components(separatedBy: .newlines)
babyNames2020.popLast()
var babyNames1880 = content1880.components(separatedBy: .newlines)
babyNames1880.popLast()

var sameNames = babyNames1880.filter { babyNames2020.contains($0) }

print("The names that were in the top for for both 1880 and 2020 are: \(sameNames.description).")

//: [Next](@next)

extension Array {
    var description: String {
        var descriptionString = ""
        for item in self {
            descriptionString.append("\(item), ")
        }
        descriptionString.popLast()
        descriptionString.popLast()
        return descriptionString
    }
}
