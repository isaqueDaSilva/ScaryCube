//
//  GameViewModel.swift
//  ScaryCube
//
//  Created by Isaque da Silva on 24/10/23.
//

import Foundation
import SwiftUI

extension GameView {
    class GameViewModel: ObservableObject {
        let manager = GameManager.shared
        
        @Published var playGame = false
        @Published var firstSortedNumber = 0
        @Published var secondSortedNumber = 0
        @Published var currentSide = 4
        @Published var time = 5
        
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        let sides = [4, 6, 8, 12, 20, 100]
        
        func play() {
            withAnimation {
                playGame = true
            }
        }
        
        func contdown() {
            guard playGame else { return }
            
            if time > 0 {
                firstSortedNumber = Int.random(in: 1...currentSide)
                secondSortedNumber = Int.random(in: 1...currentSide)
                time -= 1
            } else if time == 0 {
                withAnimation {
                    playGame = false
                }
                time = 5
                Task {
                    await manager.addNewPointToListPoints("\(firstSortedNumber), \(secondSortedNumber)")
                }
            }
        }
    }
}
