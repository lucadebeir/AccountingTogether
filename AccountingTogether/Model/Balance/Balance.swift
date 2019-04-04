//
//  Balance.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 04/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

extension Balance {
    
    public var amountB: Double { return self.amount}
    
    public var nameT: String { return self.nameTravellerPaidFor!}
    
    
    convenience init(nameT: String, amount : Double) {
        self.init(context: CoreDataManager.context)
        self.nameTravellerPaidFor = nameT
        self.amount = amount
    }
    
}
