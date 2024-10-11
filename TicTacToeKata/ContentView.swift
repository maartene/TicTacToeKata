//
//  ContentView.swift
//  TicTacToeKata
//
//  Created by Maarten Engels on 11/10/2024.
//

import SwiftUI

struct CellView: View {
    let value: Character
    
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
    var body: some View {
        VStack {
            Text("TicTacToe")
                .font(.largeTitle)
                .foregroundStyle(.secondary)
            
            Grid(horizontalSpacing: 5,
                 verticalSpacing: 5) {
                GridRow {
                    CellView("X")
                    CellView("O")
                    CellView("X")
                }
                GridRow {
                    CellView("O")
                    CellView(" ")
                    CellView("O")
                }
                GridRow {
                    CellView("X")
                    CellView("O")
                    CellView("X")
                }
            }
            .padding()
            
            Text("Player 1 wins")
                .font(.title2)
                .foregroundStyle(.primary)
            
            Button("Restart") {
                print("Restart")
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
