//
//  Game.swift
//  BowlingScoresTDD
//
//  Created by BJ Miller on 12/25/23.
//

import Foundation

final class Game {
    private var total = 0
    
    func roll(_ pins: Int) {
        total += pins
    }
    
    func score() -> Int {
        total
    }
}
