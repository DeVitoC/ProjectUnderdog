//: [Previous](@previous)

import Foundation

/*
 Implemented with dictionary
 start time
 import list of baby names as array and list of scrabble words as dictionary
 create array to store results
 loop through baby names
 reverse name
 look for reversed name in dictionary of scrabble words
 if found, add forward baby name to results array
 end time
 print results array
 print time taken
 */

/*
 In the first implementation, .contains on the array searches from the beginning of the array until it finds the search key or reaches the end of the array which is O(n).
 On the other hand, in this implentation, .contains on the set uses a hash method to find the location of the search key and can check in O(1) time.
 In the array implementation the run time complexity is O(n) with regard to the baby names multiplied by O(n) with regard to the scrabble names.
 In the dictionary implementation the run time complexity is O(n) with regard to the baby names multiplied by O(1) with regard to the scrabble names
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

var scrabbleWords: Set = Set(contentScrabble.components(separatedBy: .newlines))

var resultBabyNames: [String] = []

for babyName in babyNames {
    let reversedName = String(babyName.reversed())

    if scrabbleWords.contains(reversedName) {
        resultBabyNames.append(babyName.capitalized)
    }
}

let endTime = Date()
let elapsedTime = endTime.timeIntervalSince(startTime)

print(resultBabyNames)
print(elapsedTime)

//: [Next](@next)
