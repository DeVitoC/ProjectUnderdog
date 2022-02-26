import UIKit
Character(",").isLowercase
Character(",").isUppercase
//let alphabet = "abcdefghijklmnopqrstuvwxyz"
let alphabet = "abcdefghijklmnopqrstuvwxyz"
                         .map { $0 }
//let upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
//                         .map { String($0) }

func rot(inputString: String, shift: Int) -> String {
    var alphaNumDict: [Character: Int] = [:]
//    var numAlphaDict: [Int: String] = [:]
    for (index, char) in alphabet.enumerated() {
        alphaNumDict[char] = index
//        numAlphaDict[index] = String(char)
    }

    var resultString = ""
    for char in inputString {
        guard let num = alphaNumDict[Character(char.lowercased())] else {
            resultString.append(char)
            continue
        }
        let targetCharNum = convert(sourceIndex: num, shift: shift)
        let resultChar = alphabet[targetCharNum] // This should always have a value in my dict
        if char.isLowercase {
            resultString.append(resultChar)
        } else {
            resultString.append(resultChar.uppercased())
        }
    }
    return resultString
}

// My implementation
func convert(sourceIndex: Int, shift: Int) -> Int {
    print("sourceIndex: \(sourceIndex), shift: \(shift)")
    let remainder = shift % alphabet.count
    print(remainder)
    var adjustedShift: Int = remainder
    if remainder < 0 &&
        -remainder > sourceIndex {
        adjustedShift = remainder + alphabet.count
    } else if remainder > alphabet.count - 1 - sourceIndex {
        adjustedShift = remainder - alphabet.count
    }
    print(adjustedShift)
    let resultNum = sourceIndex + adjustedShift
    print(resultNum)
    return resultNum
}


// Jared's Implemention
func targetIndex(sourceIndex: Int, shift: Int) -> Int {
    let moduloShift = shift % alphabet.count

    if moduloShift == 0 {
        return sourceIndex
    } else if moduloShift < 0 {
        let shifted = sourceIndex + moduloShift
        if shifted < 0 {
            return alphabet.indices.upperBound + shifted
        } else {
            return shifted
        }
    } else /* moduloShift > 0 */ {
        let shifted = sourceIndex + moduloShift
        if shifted > alphabet.indices.last! {
            return shifted - alphabet.count
        } else {
            return shifted
        }
    }
}

let resultString = rot(inputString: "Test, 1", shift: 25)
print(resultString)
//(27).truncatingRemainder(dividingBy: 26)
print(convert(sourceIndex: 0, shift: -131))
