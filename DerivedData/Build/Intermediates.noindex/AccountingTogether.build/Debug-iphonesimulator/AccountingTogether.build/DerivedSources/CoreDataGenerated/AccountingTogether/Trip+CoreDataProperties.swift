//
//  Trip+CoreDataProperties.swift
//  
//
//  Created by Luca Debeir on 26/03/2019.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var nameTrip: String?
    @NSManaged public var travellers: NSSet?

}

// MARK: Generated accessors for travellers
extension Trip {

    @objc(addTravellersObject:)
    @NSManaged public func addToTravellers(_ value: Traveller)

    @objc(removeTravellersObject:)
    @NSManaged public func removeFromTravellers(_ value: Traveller)

    @objc(addTravellers:)
    @NSManaged public func addToTravellers(_ values: NSSet)

    @objc(removeTravellers:)
    @NSManaged public func removeFromTravellers(_ values: NSSet)

}
