import UIKit

//let alphabet = "abcdefghijklmnopqrstuvwxyz"
let alphabet: [String] = "abcdefghijklmnopqrstuvwxyz"
                         .map { String($0) }
//let upperAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

func rot(inputString: String, shift: Int) -> String {
    var alphaNumDict: [String: Int] = [:]
    var numAlphaDict: [Int: String] = [:]
    for (index, char) in alphabet.enumerated() {
        alphaNumDict[String(char)] = index
        numAlphaDict[index] = String(char)
    }

    var resultString = ""
    for char in inputString {
        guard let num = alphaNumDict[String(char)] else { continue }
        let targetCharNum = convert(sourceIndex: num, shift: shift)

        let resultChar = numAlphaDict[targetCharNum]! // This should always have a value in my dict
        resultString.append(resultChar)
    }
    return resultString
}

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

//let resultString = rot(inputString: "test", shift: -25)
//print(resultString)
//(27).truncatingRemainder(dividingBy: 26)
print(convert(sourceIndex: 0, shift: -131))
