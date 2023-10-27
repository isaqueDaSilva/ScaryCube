//
//  Player+CoreDataProperties.swift
//  ScaryCube
//
//  Created by Isaque da Silva on 25/10/23.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var username: String?
    @NSManaged public var points: NSSet?

    public var wrappedUsername: String {
        username ?? "Unknown Username"
    }
    
    public var pointsLists: [Game] {
        let points = points as? Set<Game> ?? []
        return points.sorted { $0.point < $1.point }
    }
}

// MARK: Generated accessors for points
extension Player {

    @objc(addPointsObject:)
    @NSManaged public func addToPoints(_ value: Game)

    @objc(removePointsObject:)
    @NSManaged public func removeFromPoints(_ value: Game)

    @objc(addPoints:)
    @NSManaged public func addToPoints(_ values: NSSet)

    @objc(removePoints:)
    @NSManaged public func removeFromPoints(_ values: NSSet)

}

extension Player : Identifiable {

}
