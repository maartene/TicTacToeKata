//
//  ContentView.swift
//  TicTacToeKata
//
//  Created by Maarten Engels on 11/10/2024.
//

import SwiftUI

struct CellView: View {
    let value: Character
    
    init(_ cell: TicTacToeBoard.TicTacToeCell) {
        switch cell {
        case .empty:
            value = " "
        case .cross:
            value = "X"
        case .nought:
            value = "O"
        }
    }
    
    var body: some View {
        Text("\(value)")
            .font(.largeTitle)
            .frame(width: 30, height: 30)
            .background(Color.gray.opacity(0.5))
    }
    
    init(_ value: Character) {
        self.value = value
    }
}

struct ContentView: View {
    @StateObject var board = TicTacToeBoard()
    
    var body: some View {
        VStack {
            Text("TicTacToe")
                .font(.largeTitle)
                .foregroundStyle(.secondary)
            
            Grid(horizontalSpacing: 5,
                 verticalSpacing: 5) {
                ForEach((0 ..< board.height), id: \.self) { row in
                    GridRow {
                        ForEach((0 ..< board.width), id: \.self) { column in
                            CellView(board[row, column] ?? .empty)
                        }
                    }
                }
            }
            .padding()
            
            Text("It is \(board.activePlayer)'s turn.")
                .font(.headline)
            
            Text("Player 1 wins")
                .font(.title2)
                .foregroundStyle(.primary)
            
            Button("Place!") {
                try? board.placeCell(.cross, at: 1, col: 2)
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
