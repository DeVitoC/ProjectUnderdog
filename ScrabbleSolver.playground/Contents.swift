import UIKit

let bundle = Bundle.main
guard let path = bundle.path(forResource: "sowpods", ofType: "txt") else { fatalError("unable to get path") }
let wordsString = try String(contentsOfFile: path)

var wordsArray = wordsString.components(separatedBy: .newlines)
wordsArray.popLast()

let rack = "piques".uppercased()

let scores: [String: Int] = [
    "a": 1,
    "b": 3,
    "c": 3,
    "d": 2,
    "e": 1,
    "f": 4,
    "g": 2,
    "h": 4,
    "i": 1,
    "j": 8,
    "k": 5,
    "l": 1,
    "m": 3,
    "n": 1,
    "o": 1,
    "p": 3,
    "q": 10,
    "r": 1,
    "s": 1,
    "t": 1,
    "u": 1,
    "v": 4,
    "w": 4,
    "x": 8,
    "y": 4,
    "z": 10
]

func getValidWords(inLetters letters: String) -> [String] {
    let possibleWords = wordsArray.filter({ $0.count <= letters.count })
    var validWords: [String] = []

    for word in possibleWords {
        var letters = rack
        var isValid = true
        for letter in word {
            if let index = letters.firstIndex(of: letter) {
                letters.remove(at: index)
            } else {
                isValid = false
                break
            }
//            if letters.contains(letter) {
//                guard let index = letters.firstIndex(of: letter) else { continue }
//                letters.remove(at: index)
//            } else {
//                isValid = false
//                break
//            }
        }
        if isValid {
            validWords.append(word)
        }
    }
    return validWords
}

func getScores(forWords words: [String]) -> [(Int, String)] {
    var totalScores: [(Int, String)] = []

    for word in words {
        var score = 0
        for letter in word {
            guard let scoreToAdd = scores[String(letter).lowercased()] else { fatalError("score for \(letter) is not valid")}
            score += scoreToAdd
        }
        totalScores.append((score, word))
    }

    totalScores = totalScores.sorted(by: { $0.0 > $1.0})
    return totalScores
}

let validWords = getValidWords(inLetters: rack)
let scoresList = getScores(forWords: validWords)

for score in scoresList {
    print("\(score.0) \(score.1)")
}
