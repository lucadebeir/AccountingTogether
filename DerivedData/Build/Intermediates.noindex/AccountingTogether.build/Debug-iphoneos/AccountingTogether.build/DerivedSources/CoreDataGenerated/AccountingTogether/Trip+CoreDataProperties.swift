//
//  Trip+CoreDataProperties.swift
//  
//
//  Created by Luca Debeir on 23/03/2019.
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

}
