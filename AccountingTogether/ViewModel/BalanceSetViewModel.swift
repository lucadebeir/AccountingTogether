//
//  BalanceSetViewModel.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 04/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

protocol BalanceSetViewModelDelegate {
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    
    
    
    /// called when a Balance is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func balanceDeleted(at indexPath: IndexPath)
    
    
    /// called when a Balance is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func balanceUpdated(at indexPath: IndexPath)
    
    
    /// called when a Balance is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func balanceAdded(at indexPath: IndexPath)
}

//----------------------------------------------------------------------------------------------------------------
class BalanceSetViewModel {
    
    // MARK: -
    private let modelset : BalanceSet
    var dataset : [Balance] = []
    var delegate : BalanceSetViewModelDelegate? = nil
    
    
    init() {
        self.modelset = BalanceSet()
    }
    
    init(traveller : Traveller) {
        let data = BalanceDAO.fetchAllBalanceOfTraveller(traveller: traveller)
        self.modelset = BalanceSet(balance: data)
        for p in self.modelset{
            self.dataset.append(p)
        }
    }
    
    init(trip : Trip){
        let data = BalanceDAO.fetchAllBalance(trip: trip)
        self.modelset = BalanceSet(balance: data)
        for p in self.modelset{
            self.dataset.append(p)
        }
    }
    convenience init(delegate : BalanceSetViewModelDelegate, trip: Trip) {
        self.init(trip: trip)
        self.delegate = delegate
        
    }
    
    public func add(balance: Balance){
        if self.modelset.indexOf(b: balance) == -1{
            self.modelset.add(balance: balance)
            self.dataset.append(balance)
            self.delegate?.balanceAdded(at: IndexPath(row:self.modelset.count() - 1,section:0))
            
        }}
    
    public func delete(balanceAt index: Int){
        BalanceDAO.delete(balance: self.dataset[index])
        self.modelset.remove(balance : self.dataset[index])
        self.dataset.remove(at: index)
        self.delegate?.balanceDeleted(at: IndexPath(row: index,section:0))
    }
    
    public var count : Int{
        return self.dataset.count
    }
    
    
    
    public func get(balanceAt index: Int) -> Balance?{
        guard (index >= 0 ) && (index < self.count) else { return nil }
        return self.dataset[index]
    }
    
    
}
