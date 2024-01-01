//
//  GameTests.swift
//  BowlingScoresTDDTests
//
//  Created by BJ Miller on 12/25/23.
//

@testable import BowlingScoresTDD
import XCTest

final class GameTests: XCTestCase {
    var game: Game!
    override func setUp() async throws {
        try await super.setUp()
        game = Game()
    }
    
    override func tearDown() async throws {
        game = nil
        try await super.tearDown()
    }
    
    private func rollMany(pins: Int, times: Int) {
        (1...times).forEach { _ in game.roll(pins) }
    }
    
    func testGutterGame() {
        rollMany(pins: 0, times: 20)
        XCTAssertEqual(game.score(), 0)
    }
    
    func testAllOnes() {
        rollMany(pins: 1, times: 20)
        XCTAssertEqual(game.score(), 20)
    }
    
//    func testOneSpare() {
//        game.roll(5)
//        game.roll(5)
//        game.roll(3)
//        rollMany(pins: 0, times: 17)
//        XCTAssertEqual(game.score(), 16)
//    }
    
}
