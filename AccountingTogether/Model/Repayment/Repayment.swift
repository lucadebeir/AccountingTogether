
//
//  Repayment.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Repayment {
    
    public var nameR : String { return self.nameRepayment ?? "" }
    public var amountR : Double { return self.amountRepayment }
    
    
    convenience init(nameRepayment: String, amountRepayment: Double){
        self.init(context: CoreDataManager.context)
        self.nameRepayment = nameRepayment
        self.amountRepayment = amountRepayment
    }
    
}
