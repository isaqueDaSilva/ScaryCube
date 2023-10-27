//
//  ProfileViewModel.swift
//  ScaryCube
//
//  Created by Isaque da Silva on 25/10/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    let manager = GameManager.shared
    
    @Published var player: Player?
    @Published var profileState: ProfileState = .nonCreated
    @Published var username = ""
    
    func getPlayer() {
        Task { @MainActor in
            guard let playerIndex = await manager.player.first else { return }
            self.player = playerIndex
            if player != nil { profileState = .created }
        }
    }
    
    func createProfile() {
        Task { @MainActor in
            await manager.createNewPlayer(username: username)
            profileState = .loading
            getPlayer()
            self.username = ""
        }
    }
    
    func deletePlayer() {
        Task { @MainActor in
            await manager.deletePlayer()
            getPlayer()
        }
    }
    
    init() {
        getPlayer()
    }
}
