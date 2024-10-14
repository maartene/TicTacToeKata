//
//  TicTacToeKataTests.swift
//  TicTacToeKataTests
//
//  Created by Maarten Engels on 11/10/2024.
//

import Testing
@testable import TicTacToeKata

struct TicTacToeBoard {
    let width = 3
    let height = 3
}

struct TicTacToeKataTests {
    @Test("A TicTacToe board is three wide") func ticTacToeBoardIsThreeWide() {
        let board = TicTacToeBoard()
        #expect(board.width == 3)
    }
    
    @Test("A TicTacToe board is three high") func ticTacToeBoardIsThreeHigh() {
        let board = TicTacToeBoard()
        #expect(board.height == 3)
    }
}
