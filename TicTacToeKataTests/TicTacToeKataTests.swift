//
//  TicTacToeKataTests.swift
//  TicTacToeKataTests
//
//  Created by Maarten Engels on 11/10/2024.
//

import Testing
@testable import TicTacToeKata

struct TicTacToeBoard {
    let width = 0
}

struct TicTacToeKataTests {
    @Test("The test framework is behaving correctly") func example() {
        #expect(1 + 1 == 2)
    }
    
    @Test("A TicTacToe board is three wide") func ticTacToeBoardIsThreeWide() {
        let board = TicTacToeBoard()
        #expect(board.width == 3)
    }
}
