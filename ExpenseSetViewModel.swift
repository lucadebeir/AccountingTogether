//
//  ExpenseSetViewModel.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

/// Delegate to simulate reactive programming to change of travel set
protocol ExpenseSetViewModelDelegate {
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    
    
    
    /// called when a Expense is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func expenseDeleted(at indexPath: IndexPath)
    
    
    /// called when a Expense is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func expenseUpdated(at indexPath: IndexPath)
    
    
    /// called when a Expense is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func expenseAdded(at indexPath: IndexPath)
}


class ExpenseSetViewModel {
    
    // MARK: -
    private let modelset : ExpenseSet
    var dataset : [Expense] = []
    var delegate : ExpenseSetViewModelDelegate? = nil
    
    init() {
        self.modelset = ExpenseSet()
    }
    
    init(traveller: Traveller) {
        if let data = traveller.bePaid {
            for e in data.allObjects as! [Expense] {
                self.dataset.append(e)
            }
            self.modelset = ExpenseSet(expenses: self.dataset)
        }
        else{
            self.modelset = ExpenseSet()
        }
    }
    convenience init(delegate : ExpenseSetViewModelDelegate, traveller: Traveller) {
        self.init(traveller: traveller)
        self.delegate = delegate
        
    }
    
    public func add(expense: Expense){
        if self.modelset.indexOf(e: expense) == -1{
            self.modelset.add(expense: expense)
            self.dataset.append(expense)
            self.delegate?.expenseAdded(at: IndexPath(row:self.modelset.count() - 1,section:0))
            
        }
    }
    
    public func delete(expenseAt index: Int){
        ExpenseDAO.delete(expense: self.dataset[index])
        self.modelset.remove(expense: self.dataset[index])
        self.dataset.remove(at: index)
        self.delegate?.expenseDeleted(at: IndexPath(row: index,section:0))
    }
    
    public var count : Int{
        return self.dataset.count
    }
    
    public func get(expenseAt index: Int) -> Expense? {
        guard (index >= 0 ) && (index < self.count) else { return nil }
        return self.dataset[index]
    }
    
}

