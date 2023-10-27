//
//  Game+CoreDataProperties.swift
//  ScaryCube
//
//  Created by Isaque da Silva on 26/10/23.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var point: String?
    @NSManaged public var player: Player?
    
    public var wrappedPoint: String {
        point ?? "No point"
    }
}

extension Game : Identifiable {

}
