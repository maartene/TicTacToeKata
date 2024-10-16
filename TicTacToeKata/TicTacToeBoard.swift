//
//  TicTacToeBoard.swift
//  TicTacToeKata
//
//  Created by Maarten Engels on 15/10/2024.
//
import Combine

class TicTacToeBoard: ObservableObject {
    enum TicTacToeError: Error {
        case outsideOfBoard
        case alreadyOccupiedCell
    }
    
    enum TicTacToeCell {
        case empty
        case nought
        case cross
    }
    
    static let width = 3
    static let height = 3
    var width: Int { Self.width }
    var height: Int { Self.height }
    var activePlayer = TicTacToeCell.cross
    
    @Published var cells: [[TicTacToeCell]] = Array(repeating: Array(repeating: .empty, count: width), count: height)
    
    subscript (row: Int, col: Int) -> TicTacToeCell? {
        guard (0 ..< width).contains(col), (0 ..< height).contains(row) else {
            return nil
        }
        
        return cells[row][col]
    }
    
    func placeCell(at row: Int, col: Int) throws {
        guard (0 ..< width).contains(col), (0 ..< height).contains(row) else {
            throw TicTacToeError.outsideOfBoard
        }
        
        guard cells[row][col] == .empty else {
            throw TicTacToeError.alreadyOccupiedCell
        }
        
        cells[row][col] = activePlayer
        
        if activePlayer == .nought {
            activePlayer = .cross
        } else {
            activePlayer = .nought
        }
    }
    
    var legalMoves: [(Int, Int)] {
        var result = [(Int, Int)]()
        for row in 0 ..< height {
            for col in 0 ..< width {
                if cells[row][col] == .empty {
                    result.append((col, row))
                }
            }
        }
        
        return result
    }
}
