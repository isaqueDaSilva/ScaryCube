//
//  HomeViewModel.swift
//  ScaryCube
//
//  Created by Isaque da Silva on 25/10/23.
//

import Foundation

extension HomeView {
    class HomeViewModel: ObservableObject {
        let manager = GameManager.shared
        
        @Published var player: Player?
        @Published var showingProfileView = false
        @Published var showingGameView = false
        
        func getPlayer() {
            Task { @MainActor in
                guard let playerIndex = await manager.player.first else { return }
                self.player = playerIndex
            }
        }
        
        func showingProfile() {
            showingProfileView = true
        }
        
        func startOrPauseGame() {
            showingGameView.toggle()
        }
        
        init() {
            getPlayer()
        }
    }
}
