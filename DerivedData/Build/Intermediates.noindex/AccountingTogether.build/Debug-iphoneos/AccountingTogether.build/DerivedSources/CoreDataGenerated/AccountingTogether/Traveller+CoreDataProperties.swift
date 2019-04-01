//
//  Traveller+CoreDataProperties.swift
//  
//
//  Created by Luca Debeir on 31/03/2019.
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
    @NSManaged public var firstNameTraveller: String?
    @NSManaged public var lastNameTraveller: String?
    @NSManaged public var bePaid: NSSet?
    @NSManaged public var getARefund: NSSet?
    @NSManaged public var participates: Trip?
    @NSManaged public var paye: NSSet?
    @NSManaged public var refund: NSSet?

}

// MARK: Generated accessors for bePaid
extension Traveller {

    @objc(addBePaidObject:)
    @NSManaged public func addToBePaid(_ value: Expense)

    @objc(removeBePaidObject:)
    @NSManaged public func removeFromBePaid(_ value: Expense)

    @objc(addBePaid:)
    @NSManaged public func addToBePaid(_ values: NSSet)

    @objc(removeBePaid:)
    @NSManaged public func removeFromBePaid(_ values: NSSet)

}

// MARK: Generated accessors for getARefund
extension Traveller {

    @objc(addGetARefundObject:)
    @NSManaged public func addToGetARefund(_ value: Repayment)

    @objc(removeGetARefundObject:)
    @NSManaged public func removeFromGetARefund(_ value: Repayment)

    @objc(addGetARefund:)
    @NSManaged public func addToGetARefund(_ values: NSSet)

    @objc(removeGetARefund:)
    @NSManaged public func removeFromGetARefund(_ values: NSSet)

}

// MARK: Generated accessors for paye
extension Traveller {

    @objc(addPayeObject:)
    @NSManaged public func addToPaye(_ value: Expense)

    @objc(removePayeObject:)
    @NSManaged public func removeFromPaye(_ value: Expense)

    @objc(addPaye:)
    @NSManaged public func addToPaye(_ values: NSSet)

    @objc(removePaye:)
    @NSManaged public func removeFromPaye(_ values: NSSet)

}

// MARK: Generated accessors for refund
extension Traveller {

    @objc(addRefundObject:)
    @NSManaged public func addToRefund(_ value: Repayment)

    @objc(removeRefundObject:)
    @NSManaged public func removeFromRefund(_ value: Repayment)

    @objc(addRefund:)
    @NSManaged public func addToRefund(_ values: NSSet)

    @objc(removeRefund:)
    @NSManaged public func removeFromRefund(_ values: NSSet)

}
