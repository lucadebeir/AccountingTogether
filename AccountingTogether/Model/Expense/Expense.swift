
//
//  Expense.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Expense {
    
    public var nameE : String { return self.nameExpense ?? "" }
    public var amountE : Double { return self.amountExpense }
    
    
    convenience init(nameExpense: String, amountExpense: Double){
        self.init(context: CoreDataManager.context)
        self.nameExpense = nameExpense
        self.amountExpense = amountExpense
    }
    
}
