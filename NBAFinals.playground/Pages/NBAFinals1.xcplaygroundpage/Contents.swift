//: [Previous](@previous)

import Foundation

let bundle = Bundle.main

guard let path = bundle.path(forResource: "nba_finals", ofType: "csv") else { fatalError("path is nil") }

guard let content = try? String(contentsOfFile: path) else { fatalError("content2020 is nil") }

var babyNames = content.components(separatedBy: .newlines)
babyNames = babyNames.map { $0.uppercased() }
babyNames.popLast()
//: [Next](@next)
