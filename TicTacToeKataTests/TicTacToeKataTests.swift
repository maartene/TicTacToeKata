//
//  TicTacToeKataTests.swift
//  TicTacToeKataTests
//
//  Created by Maarten Engels on 11/10/2024.
//

import Testing
@testable import TicTacToeKata



class TicTacToeBoard {
    enum TicTacToeCell {
        case empty
        case nought
        case cross
    }
    
    let width = 3
    let height = 3
    
    lazy var cells: [[TicTacToeCell]] = Array(repeating: Array(repeating: .empty, count: width), count: height)
    
    subscript (row: Int, col: Int) -> TicTacToeCell {
        cells[row][col]
    }
    
    func placeCell(_ cell: TicTacToeCell, at row: Int, col: Int) {
        cells[row][col] = cell
    }
}

struct TicTacToeKataTests {
    var board = TicTacToeBoard()
    
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
    
    @Test("After placing a TicTacToeCell on a new board, the value of that cell is no longer empty") mutating func ticTacToeCellIsNotEmpty() {
        let cell: TicTacToeBoard.TicTacToeCell = .nought
        let row: Int = 1
        let col: Int = 0
        
        board.placeCell(cell, at: row, col: col)
        
        #expect(board[row, col] == cell)
    }
}
