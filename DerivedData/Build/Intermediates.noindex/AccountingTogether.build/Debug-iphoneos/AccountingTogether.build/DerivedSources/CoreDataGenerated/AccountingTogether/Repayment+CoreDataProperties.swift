//
//  Repayment+CoreDataProperties.swift
//  
//
//  Created by Luca Debeir on 28/03/2019.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Repayment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Repayment> {
        return NSFetchRequest<Repayment>(entityName: "Repayment")
    }

    @NSManaged public var amountRepayment: Double
    @NSManaged public var nameRepayment: String?
    @NSManaged public var refundBy: Traveller?
    @NSManaged public var refundFor: Traveller?

}
