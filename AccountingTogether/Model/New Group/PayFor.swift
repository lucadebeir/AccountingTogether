//
//  PayFor.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 03/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension PayFor {
    
    public var amount : Double {
        get{ return self.priceAmount }
        set{ self.priceAmount = (newValue as Double) }
    }
    
    public var traveller : Traveller? {
        get{ return self.must }
        set{ self.must = (newValue) }
    }
    
    public var expense : Expense? {
        get{ return self.be }
        set{ self.be = newValue }
    }
    
    convenience init(priceAmount: Double, t: Traveller, e: Expense){
        self.init(context: CoreDataManager.context)
        self.amount = priceAmount
        self.traveller = t
        self.expense = e
    }
    
}
