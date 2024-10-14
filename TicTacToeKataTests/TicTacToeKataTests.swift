//
//  TicTacToeKataTests.swift
//  TicTacToeKataTests
//
//  Created by Maarten Engels on 11/10/2024.
//

import Testing
@testable import TicTacToeKata



class TicTacToeBoard {
    enum TicTacToeError: Error {
        case outsideOfBoard
    }
    
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
    
    func placeCell(_ cell: TicTacToeCell, at row: Int, col: Int) throws {
        guard (0 ..< width).contains(col), (0 ..< height).contains(row) else {
            throw TicTacToeError.outsideOfBoard
        }
        
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
    
    @Test("After placing a TicTacToeCell on a new board, the value of that cell is no longer empty") mutating func ticTacToeCellIsNotEmpty() throws {
        let cell: TicTacToeBoard.TicTacToeCell = .nought
        let row: Int = 1
        let col: Int = 0
        
        try board.placeCell(cell, at: row, col: col)
        
        #expect(board[row, col] == cell)
    }
    
    @Test("Placing a TicTacToeCell outside of the board, throws a TicTacToeError error") func ticTacToeCellOutsideOfBoardThrowsError() throws {
        let cell = TicTacToeBoard.TicTacToeCell.cross
        #expect(throws: (TicTacToeBoard.TicTacToeError).self) { try board.placeCell(cell, at: -1, col: 1) }
        #expect(throws: (TicTacToeBoard.TicTacToeError).self) { try board.placeCell(cell, at: 1, col: -1) }
        #expect(throws: (TicTacToeBoard.TicTacToeError).self) { try board.placeCell(cell, at: 4, col: 0) }
        #expect(throws: (TicTacToeBoard.TicTacToeError).self) { try board.placeCell(cell, at: 2, col: 67) }
    }
}
