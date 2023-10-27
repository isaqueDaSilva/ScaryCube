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
        
        @MainActor @Published var player = [Player]()
        @Published var showingProfileView = false
        @Published var showingGameView = false
        
        func getPlayer() {
            Task { @MainActor in
                await manager.fetchPlayer()
                self.player = await manager.player
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
