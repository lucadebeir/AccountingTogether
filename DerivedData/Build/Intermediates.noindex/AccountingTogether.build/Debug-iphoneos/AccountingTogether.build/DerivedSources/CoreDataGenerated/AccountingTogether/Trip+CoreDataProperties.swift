//
//  Trip+CoreDataProperties.swift
//  
//
//  Created by Luca Debeir on 31/03/2019.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var dateBeginTrip: Date?
    @NSManaged public var dateEndTrip: Date?
    @NSManaged public var imageTrip: Data?
    @NSManaged public var nameTrip: String?
    @NSManaged public var isComposedBy: NSSet?

}

// MARK: Generated accessors for isComposedBy
extension Trip {

    @objc(addIsComposedByObject:)
    @NSManaged public func addToIsComposedBy(_ value: Traveller)

    @objc(removeIsComposedByObject:)
    @NSManaged public func removeFromIsComposedBy(_ value: Traveller)

    @objc(addIsComposedBy:)
    @NSManaged public func addToIsComposedBy(_ values: NSSet)

    @objc(removeIsComposedBy:)
    @NSManaged public func removeFromIsComposedBy(_ values: NSSet)

}
