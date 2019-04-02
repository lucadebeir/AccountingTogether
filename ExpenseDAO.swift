//
//  ExpenseDAO.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import CoreData

class ExpenseDAO {
    
    static let request: NSFetchRequest<Expense> = Expense.fetchRequest()
    
    static func save() {
        CoreDataManager.save()
    }
    
    static func getAll() -> [Expense]? {
        //self.request.sortDescriptors = [NSSortDescriptor(key: "nameTrip", ascending: true)]
        self.request.predicate = nil
        do {
            return try CoreDataManager.context.fetch(self.request)
        } catch {
            return nil
        }
    }
    
    static func delete(expense: Expense) {
        CoreDataManager.context.delete(expense)
        self.save()
    }
    
}

