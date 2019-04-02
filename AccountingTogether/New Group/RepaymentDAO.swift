//
//  RepaymentDAO.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import CoreData

class RepaymentDAO {
    
    static let request: NSFetchRequest<Repayment> = Repayment.fetchRequest()
    
    static func save() {
        CoreDataManager.save()
    }
    
    static func getAll() -> [Repayment]? {
        //self.request.sortDescriptors = [NSSortDescriptor(key: "nameTrip", ascending: true)]
        self.request.predicate = nil
        do {
            return try CoreDataManager.context.fetch(self.request)
        } catch {
            return nil
        }
    }
    
    static func delete(repayment: Repayment) {
        CoreDataManager.context.delete(repayment)
        self.save()
    }
    
}

