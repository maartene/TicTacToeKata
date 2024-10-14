//
//  TicTacToeKataTests.swift
//  TicTacToeKataTests
//
//  Created by Maarten Engels on 11/10/2024.
//

import Testing
@testable import TicTacToeKata



struct TicTacToeBoard {
    enum TicTacToeCell {
        case empty
    }
    
    let width = 3
    let height = 3
    
    subscript (row: Int, col: Int) -> TicTacToeCell {
        .empty
    }
}

struct TicTacToeKataTests {
    let board = TicTacToeBoard()
    
    @Test("A TicTacToe board is three wide") func ticTacToeBoardIsThreeWide() {
        #expect(board.width == 3)
    }
    
    @Test("A TicTacToe board is three high") func ticTacToeBoardIsThreeHigh() {
        #expect(board.height == 3)
    }
    
    @Test("A new TicTacToe board is empty") func ticTacToeBoardIsEmpty() {
        for row in 0 ..< board.height {
            for col in 0 ..< board.width {
                #expect(board[row, col] == .empty)
            }
        }
        
    }
}
