//
//  IPLKnockoutViewModel.swift
//  IPL-Knockout!
//
//  Created by pranay chander on 03/03/21.
//

import Foundation

class IPLKnockoutViewModel {
    let teams = ["Mumbai Indians",
                 "Sunrisers Hyderabad",
                 "Royal Challengers Bangalore",
                 "Rajasthan Royals",
                 "Chennai Super Kings",
                 "Kolkata Knight Riders",
                 "Delhi Capitals",
                 "Kings XI Punjab"]

    var currentLevel: Levels = .qualifiers

    var simulateButtonTitle: String {
        return currentLevel == .qualifiers ? "Start IPL" : "Simulate"
    }

    var displayFixturesCount: Int {
        return currentLevel == .qualifiers ?  teams.count : currentLevelFixtures.count
    }

    var currentTeams = [String]()

    var currentLevelFixtures = [(String, String)]()

    func generateFixtures() {
        var decidedFixtureTeams = [String]()
        var fixtures = [(String, String)]()
        while decidedFixtureTeams.count !=  currentTeams.count {
            let selectedTeam = currentTeams.randomElement()!
            if !decidedFixtureTeams.contains(selectedTeam) {
                decidedFixtureTeams.append(selectedTeam)
                let selectedTeam2 = currentTeams.filter{$0 != selectedTeam && !decidedFixtureTeams.contains($0)}.randomElement()!
                decidedFixtureTeams.append(selectedTeam2)
                fixtures.append((selectedTeam, selectedTeam2))
            }
        }
        currentLevelFixtures = fixtures
        currentTeams = currentLevelFixtures.map {$0.0}
    }

    var totalLevels: Int {
        return Levels.allCases.count
    }

    func upgradeLevel() {
        if let level = Levels(rawValue: currentLevel.rawValue + 1) {
            currentLevel = level
        }
    }

    func winner() -> String {
        return currentLevel == .finals ? currentTeams.randomElement()! : ""
    }

    func reset() {
        currentLevel = .qualifiers
        currentTeams = teams
    }
}
