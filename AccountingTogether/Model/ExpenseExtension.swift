//
//  ExpenseExtension.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import CoreData

extension Expense {
    
    static func getAll() throws -> [Expense] {
        let request: NSFetchRequest<Expense> = Expense.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "nameExpense", ascending: true)]
        do {
            let expenses: [Expense] = try CoreDataManager.context.fetch(request)
            return expenses
        } catch let error as NSError {
            throw error
        }
    }
    
    static func create(withName: String, withAmount: Double) throws -> Expense {
        
        let expense = Expense(context: CoreDataManager.context)
        
        /// nom du contactPerso
        expense.nameExpense = withName
        expense.amountExpense = withAmount
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return expense
    }
    
    func edit(withName: String) throws {
        /// nom du contactPerso
        self.nameExpense = withName
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    
    func delete() throws {
        do{
            CoreDataManager.context.delete(self)
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    
}
