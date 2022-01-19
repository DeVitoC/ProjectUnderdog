import UIKit

/*
 Import words from countries file
 parse list of countries to array
 create array to store words with "United"
 loop through words array
 if word contains "United", add to words with United array
 print words with United array
 */

let bundle = Bundle.main
guard let path = bundle.path(forResource: "countries", ofType: "txt") else { fatalError("path is nil") }
guard let content = try? String(contentsOfFile: path) else { fatalError("content is nil") }

let words = content.components(separatedBy: .newlines)

var wordsWithUnited: [String] = []
for word in words {
    if word.contains("United") {
        wordsWithUnited.append(word)
    }
}

print(wordsWithUnited)
