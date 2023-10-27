//
//  GameManager.swift
//  ScaryCube
//
//  Created by Isaque da Silva on 24/10/23.
//

import CoreData
import Foundation

actor GameManager {
    static let shared = GameManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    var player = [Player]()
    
    private func save() {
        do {
            try context.save()
            fetchPlayer()
        } catch let error {
            print("Falied to save Player. Error: \(error)")
        }
    }
    
    func fetchPlayer() {
        let request = NSFetchRequest<Player>(entityName: "Player")
        do {
            player = try context.fetch(request)
        } catch let error {
            print("Falied to fetch Player. Error: \(error)")
        }
    }
    
    func createNewPlayer(username: String) {
        let newPlayer = Player(context: context)
        newPlayer.id = UUID()
        newPlayer.username = username
        save()
    }
    
    func addNewPointToListPoints(_ numbers: String) {
        let newPoint = Game(context: context)
        newPoint.point = numbers
        
        guard let playerIndex = player.first else { return }
        newPoint.player = Player(context: context)
        newPoint.player?.id = playerIndex.id
        newPoint.player?.username = playerIndex.username
        playerIndex.points?.adding(newPoint)
        save()
    }
    
    func deletePlayer() {
        guard let playerIndex = player.first else { return }
        context.delete(playerIndex)
        save()
    }
    
    private init() { 
        self.container = NSPersistentContainer(name: "PlayerModel")
        self.context = container.viewContext
        
        self.container.loadPersistentStores { (success, error) in
            if (error != nil) {
                print("Falied to load Player.")
            }
        }
        self.context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
}
