//
//  Game+CoreDataProperties.swift
//  ScaryCube
//
//  Created by Isaque da Silva on 25/10/23.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var point: Int16
    @NSManaged public var player: Player?

}

extension Game : Identifiable {

}
