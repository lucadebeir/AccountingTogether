//
//  Traveller+CoreDataProperties.swift
//  
//
//  Created by Luca Debeir on 26/03/2019.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Traveller {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Traveller> {
        return NSFetchRequest<Traveller>(entityName: "Traveller")
    }

    @NSManaged public var arrivalDate: Date?
    @NSManaged public var birthdate: Date?
    @NSManaged public var currentlyTravelling: Bool
    @NSManaged public var firstNameTraveller: String?
    @NSManaged public var nameTraveller: String?
    @NSManaged public var priceTrip: Int16
    @NSManaged public var isPaidFor: Expense?
    @NSManaged public var paye: Expense?
    @NSManaged public var trip: Trip?

}
