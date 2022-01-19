//: [Previous](@previous)

import Foundation

/*
 Implemented with array
 start time
 import list of baby names and list of scrabble words to arrays
 create array to store results
 loop through baby names
 reverse name
 look for reversed name in list of scrabble words
 if found, add forward baby name to results array
 end time
 print results array
 print time taken
 */

let startTime = Date()
let bundle = Bundle.main
guard let path2020 = bundle.path(forResource: "baby_names_2020_short", ofType: "txt") else { fatalError("path2020 is nil") }
guard let pathScrabble = bundle.path(forResource: "sowpods", ofType: "txt") else { fatalError("pathScrabble is nil") }

guard let content2020 = try? String(contentsOfFile: path2020) else { fatalError("content2020 is nil") }
guard let contentScrabble = try? String(contentsOfFile: pathScrabble) else { fatalError("contentScrabble is nil") }

var babyNames = content2020.components(separatedBy: .newlines)
babyNames = babyNames.map { $0.uppercased() }
babyNames.popLast()
var scrabbleWords = contentScrabble.components(separatedBy: .newlines)
scrabbleWords.popLast()


var resultBabyNames: [String] = []

for babyName in babyNames {
    let reversedName = String(babyName.reversed())

    if scrabbleWords.contains(reversedName) {
        resultBabyNames.append(babyName)
    }
}

let endTime = Date()
let elapsedTime = endTime.timeIntervalSince(startTime)

print(resultBabyNames)
print(elapsedTime)

//: [Next](@next)
