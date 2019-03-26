//
//  Expense+CoreDataProperties.swift
//  
//
//  Created by Luca Debeir on 26/03/2019.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var nameExpense: String?
    @NSManaged public var price: Int16
    @NSManaged public var paidBy: Traveller?
    @NSManaged public var paidFor: Traveller?

}
