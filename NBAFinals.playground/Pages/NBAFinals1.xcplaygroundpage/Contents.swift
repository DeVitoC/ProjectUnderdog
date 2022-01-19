//: [Previous](@previous)

import Foundation

let NBAYears = getCSVAsDict()

struct NBAFinalsYear {
    let year: Int
    let winner: String
    let loser: String
    let score: String
    let MVP: String
}

func getCSVAsDict() -> [Int: NBAFinalsYear] {
    let bundle = Bundle.main
    guard let path = bundle.path(forResource: "nba_finals", ofType: "csv") else { fatalError("path is nil") }
    guard let content = try? String(contentsOfFile: path) else { fatalError("content is nil") }
    var NBAYears = content.components(separatedBy: .newlines)
    NBAYears.removeFirst()

    var NBAYearsDict: [Int: NBAFinalsYear] = [:]

    for NBAYear in NBAYears {
        if NBAYear == "" {
            continue
        }

        let yearComponents = NBAYear.components(separatedBy: ",")
        guard let year = Int(yearComponents[0]) else { continue }
        let yearEntry = NBAFinalsYear(year: year, winner: yearComponents[1], loser: yearComponents[2], score: yearComponents[3], MVP: yearComponents[4])
        NBAYearsDict[year] = yearEntry
    }

    return NBAYearsDict
}

func winner(forYear year: Int) -> String {
    NBAYears[year]?.winner ?? "That year is not available in this data."
}

print(winner(forYear: 1999))

//: [Next](@next)
