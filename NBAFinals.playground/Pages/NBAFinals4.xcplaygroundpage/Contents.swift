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

func mvpRankings() -> [Int: [String]] {
    let yearsWithMVPs = NBAYears.filter({ (_, entry) in
        return entry.MVP != ""
    })
    let mvps = yearsWithMVPs.map({ (_, entry) in
        return entry.MVP.replacingOccurrences(of: "\\", with: "")
    })
    var mvpRanks: [String: Int] = [:]

    for mvp in mvps {
        if mvpRanks[mvp] == nil {
            mvpRanks[mvp] = 1
        } else {
            mvpRanks[mvp]! += 1
        }
    }
    var rankings: [Int: [String]] = [:]
    for (name, number) in mvpRanks {
        if number > 1 {
            if rankings[number] == nil {
                rankings[number] = [name]
            } else {
                rankings[number]!.append(name)
            }
        }
    }
    return rankings
}

let mvpRanking = mvpRankings()
let order = mvpRanking.map({ (num, _) in
    return num
}).sorted(by: { $0 > $1 })
print(order)

for num in order {
    print("\(num) times: \(mvpRanking[num]!)")
}

//: [Next](@next)
