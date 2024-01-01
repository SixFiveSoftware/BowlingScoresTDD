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
    
    func testOneSpare() {
        game.roll(5)
        game.roll(5)
        game.roll(3)
        rollMany(pins: 0, times: 17)
        XCTAssertEqual(game.score(), 16)
    }
    
    func testOneStrike() {
        game.roll(10)
        game.roll(4)
        game.roll(3)
        rollMany(pins: 0, times: 16)
        XCTAssertEqual(game.score(), 24)
    }
    
    func testPerfectGame() {
        rollMany(pins: 10, times: 12)
        XCTAssertEqual(game.score(), 300)
    }
    
    func testEndingSpare() {
        rollMany(pins: 10, times: 10)
        game.roll(9)
        game.roll(1)
        XCTAssertEqual(game.score(), 289)
    }
    
    func test267() {
        game.parse(rolls: "XXXX9/8/XXXXXX")
        XCTAssertEqual(game.score(), 267)
    }

    func test227() {
        game.parse(rolls: "819/XXX8/X8/XXXX")
        XCTAssertEqual(game.score(), 227)
    }
    
    func test174() {
        game.parse(rolls: "X819/X8/X8/9/817/X")
        XCTAssertEqual(game.score(), 174)
    }
    
    func test299() {
        game.parse(rolls: "XXXXXXXXXXX9")
        XCTAssertEqual(game.score(), 299)
    }
}
