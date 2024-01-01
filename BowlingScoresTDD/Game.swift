//
//  Game.swift
//  BowlingScoresTDD
//
//  Created by BJ Miller on 12/25/23.
//

import Foundation

final class Game {
    private var rolls: [Int] = Array(repeating: 0, count: 21)
    private var currentRoll = 0

    func roll(_ pins: Int) {
        rolls[currentRoll] = pins
        currentRoll += 1
    }

    func parse(rolls: String) {
        var copy = rolls
        while !copy.isEmpty {
            let roll = String(copy.removeFirst())
            if roll == "X" {
                self.roll(10)
            } else if roll == "/" {
                let lastRoll = self.rolls[currentRoll - 1]
                let spare = 10 - lastRoll
                self.roll(spare)
            } else if roll == "-" {
                self.roll(0)
            } else {
                self.roll(Int(roll) ?? 0)
            }
        }
    }

    private func isSpare(_ roll: Int) -> Bool { frameSum(roll) == 10 }
    private func isStrike(_ roll: Int) -> Bool { rolls[roll] == 10 }
    private func strikeBonus(_ roll: Int) -> Int { rolls[roll + 1] + rolls[roll + 2] }
    private func spareBonus(_ roll: Int) -> Int { rolls[roll + 2] }
    private func frameSum(_ roll: Int) -> Int { rolls[roll] + rolls[roll + 1] }

    func score() -> Int {
        var score = 0
        var roll = 0
        for _ in 1...10 {
            if isStrike(roll) {
                score += 10 + strikeBonus(roll)
                roll += 1
            } else if isSpare(roll) {
                score += 10 + spareBonus(roll)
                roll += 2
            } else {
                score += frameSum(roll)
                roll += 2
            }
        }
        return score
    }
}
