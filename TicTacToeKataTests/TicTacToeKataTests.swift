//
//  TicTacToeKataTests.swift
//  TicTacToeKataTests
//
//  Created by Maarten Engels on 11/10/2024.
//

import Testing
import Combine
@testable import TicTacToeKata

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
        let row: Int = 1
        let col: Int = 0
        
        try board.placeCell(at: row, col: col)
        
        #expect(board[row, col] == .cross)
    }
    
    @Test("Placing a TicTacToeCell outside of the board, throws a TicTacToeError error") func ticTacToeCellOutsideOfBoardThrowsError() throws {
        #expect(throws: (TicTacToeBoard.TicTacToeError).self) { try board.placeCell(at: -1, col: 1) }
        #expect(throws: (TicTacToeBoard.TicTacToeError).self) { try board.placeCell(at: 1, col: -1) }
        #expect(throws: (TicTacToeBoard.TicTacToeError).self) { try board.placeCell(at: 4, col: 0) }
        #expect(throws: (TicTacToeBoard.TicTacToeError).self) { try board.placeCell(at: 2, col: 67) }
    }
    
    @Test("Retrieving a cell outside of the board, returns nil") func ticTacToeCellOutsideOfBoardReturnsNil() {
        #expect(board[-1, 1] == nil)
        #expect(board[1, -6] == nil)
        #expect(board[4, 0] == nil)
        #expect(board[2, 67] == nil)
    }
    
    @Test("Placing a TicTacToeCell on an occupied space, throws a TicTacToeError.alreadyOccupiedCell error") func ticTacToeCellOnOccupiedCellThrowsError() throws {
        try board.placeCell(at: 1, col: 2)
        
        #expect {
            try board.placeCell(at: 1, col: 2)
        } throws: { error in
            guard let tttError = error as? TicTacToeBoard.TicTacToeError else {
                Issue.record("The thrown error should be a TicTacToeError")
                return false
            }
            
            return tttError == .alreadyOccupiedCell
        }
    }
    
    @Test("When a new board is created the 'cross' player is the active player") func onNewBoardActivePlayer() {
        #expect(board.activePlayer == .cross)
    }
    
    @Test("When a cell is placed on a new board, the 'nought' player becomes the active player") func whenPlacingACellOnANewBoard_nought_becomesActivePlayer() throws  {
        try board.placeCell(at: 1, col: 1)
        #expect(board.activePlayer == .nought)
    }
    
    @Test("When two cells are placed on a new board, the 'cross' player becomes the active player") func whenPlacingTwoCellsOnANewBoard_cross_becomesActivePlayer() throws  {
        try board.placeCell(at: 1, col: 1)
        try board.placeCell(at: 1, col: 2)
        #expect(board.activePlayer == .cross)
    }
    
    @Test("On a new board, all moves are legal") func legalMovesOnNewBoard() {
        let expectedLegalMoves = [
            [(0,0), (1,0), (2,0)],
            [(0,1), (1,1), (2,1)],
            [(0,2), (1,2), (2,2)],
        ]
        
        for row in 0 ..< 3 {
            for col in 0 ..< 3 {
                #expect(board.legalMoves.contains(where: { $0.0 == col && $0.1 == row }))
            }
        }
    }
    
    @Test("On a new board with some cells filled, the other cells are legal moves") func legalMovesOnFilledBoard() throws {
        let expectedLegalMoves = [
            (0,0), (1,0),
            (1,1), (2,1),
            (1,2), (2,2),
        ]
        
        let expectedIllegalMoves = [
            (0,2), (0,1), (2, 0)
        ]
        
        try board.placeCell(at: 0, col: 2)
        try board.placeCell(at: 1, col: 0)
        try board.placeCell(at: 2, col: 0)
        
        for expectedLegalMove in expectedLegalMoves {
            #expect(board.legalMoves.contains(where: { $0.0 == expectedLegalMove.0 && $0.1 == expectedLegalMove.1}))
        }
        
        for expectedIllegalMove in expectedIllegalMoves {
            #expect(board.legalMoves.contains(where: { $0.0 == expectedIllegalMove.0 && $0.1 == expectedIllegalMove.1}) == false)
        }
    }
    
    // MARK: Updating the UI
    var cancelables = Set<AnyCancellable>()         // boilerplate for the reflective system of iOS UI framework `SwiftUI`
    
    @Test("When a cell is placed, the board notifies subscribers of the updated cells") mutating func whenPlacingCell_subscribersAreNotified() throws {
        var cells = [[TicTacToeBoard.TicTacToeCell]]()
        board.$cells.sink { updatedCells in
            cells = updatedCells
        }.store(in: &cancelables)
        
        try board.placeCell(at: 2, col: 1)
        
        #expect(cells == board.cells)
    }
}
