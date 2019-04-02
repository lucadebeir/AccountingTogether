//
//  Traveller.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Traveller {
    
    public var lastName : String { return self.lastNameTraveller ?? "" }
    public var firstName : String { return self.firstNameTraveller ?? "" }
    public var fullname : String { return "\(self.firstName) \(self.lastName)" }
    
    public var arrival : Date? {
        get{ return (self.arrivalDate as Date?) }
        set{ self.arrivalDate = (newValue as Date?) }
    }
    
    convenience init(lastName: String, firstName: String){
        self.init(context: CoreDataManager.context)
        self.lastNameTraveller = lastName
        self.firstNameTraveller = firstName
    }
    
    convenience init(lastName: String, firstName: String, arrivalDate: Date){
        self.init(context: CoreDataManager.context)
        self.lastNameTraveller = lastName
        self.firstNameTraveller = firstName
        self.arrivalDate = arrivalDate
    }
    
}
