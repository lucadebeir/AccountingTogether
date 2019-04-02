//
//  RepaymentSetViewModel.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

/// Delegate to simulate reactive programming to change of travel set
protocol RepaymentSetViewModelDelegate {
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    
    
    
    /// called when a Repayment is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func repaymentDeleted(at indexPath: IndexPath)
    
    
    /// called when a Repayment is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func repaymentUpdated(at indexPath: IndexPath)
    
    
    /// called when a Repayment is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func repaymentAdded(at indexPath: IndexPath)
}


class RepaymentSetViewModel {
    
    // MARK: -
    private let modelset : RepaymentSet
    var dataset : [Repayment] = []
    var delegate : RepaymentSetViewModelDelegate? = nil
    
    init() {
        self.modelset = RepaymentSet()
    }
    
    init(traveller: Traveller) {
        if let data = traveller.bePaid {
            for e in data.allObjects as! [Repayment] {
                self.dataset.append(e)
            }
            self.modelset = RepaymentSet(repayments: self.dataset)
        }
        else{
            self.modelset = RepaymentSet()
        }
    }
    convenience init(delegate : RepaymentSetViewModelDelegate, traveller: Traveller) {
        self.init(traveller: traveller)
        self.delegate = delegate
        
    }
    
    public func add(repayment: Repayment){
        if self.modelset.indexOf(e: repayment) == -1{
            self.modelset.add(repayment: repayment)
            self.dataset.append(repayment)
            self.delegate?.repaymentAdded(at: IndexPath(row:self.modelset.count() - 1,section:0))
            
        }
    }
    
    public func delete(repaymentAt index: Int){
        RepaymentDAO.delete(repayment: self.dataset[index])
        self.modelset.remove(repayment: self.dataset[index])
        self.dataset.remove(at: index)
        self.delegate?.repaymentDeleted(at: IndexPath(row: index,section:0))
    }
    
    public var count : Int{
        return self.dataset.count
    }
    
    public func get(repaymentAt index: Int) -> Repayment? {
        guard (index >= 0 ) && (index < self.count) else { return nil }
        return self.dataset[index]
    }
    
}

