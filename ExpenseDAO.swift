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
    
    static func fetchAllExpenseOfTrip(trip : Trip) -> [Expense]{
        var tripExpense: [Expense] = []
        
        if let _travellersOfTravel = TripDAO.getTravellersOfATrip(trip: trip) {
            
            for t in _travellersOfTravel.allObjects as! [Traveller]{
                
                if let _expensesOfTraveller = t.paye {
                    
                    for t in _expensesOfTraveller.allObjects as! [Expense]{
                        
                        tripExpense.append(t)
                    }
                }
            }
        }
        return tripExpense
        
    }
    
    static func delete(expense: Expense) {
        CoreDataManager.context.delete(expense)
        self.save()
    }
    
}

