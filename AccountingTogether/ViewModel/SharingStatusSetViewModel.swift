//
//  SharingStatusSetViewModel.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 03/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

/// Delegate to simulate reactive programming to change of travel set
protocol SharingStatusSetViewModelDelegate {
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    
    
    
    /// called when a SharingStatus is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func sharingStatusDeleted(at indexPath: IndexPath)
    
    
    /// called when a SharingStatus is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func sharingStatusUpdated(at indexPath: IndexPath)
    
    
    /// called when a SharingStatus is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func sharingStatusAdded(at indexPath: IndexPath)
}


class SharingStatusSetViewModel {
    
    // MARK: -
    private let modelset : PayForSet
    var dataset : [PayFor] = []
    var delegate : SharingStatusSetViewModelDelegate? = nil
    
    init() {
        self.modelset = PayForSet()
    }
    
    init(trip: Trip) {
        if let data = trip.contain {
            for p in data.allObjects as! [PayFor] {
                self.dataset.append(p)
            }
            self.modelset = PayForSet(payFor: self.dataset)
        }
        else{
            self.modelset = PayForSet()
        }
    }
    convenience init(delegate : SharingStatusSetViewModelDelegate, trip: Trip) {
        self.init(trip: trip)
        self.delegate = delegate
        
    }
    
    public func add(payFor: PayFor){
        if self.modelset.indexOf(p: payFor) == -1{
            self.modelset.add(payFor: payFor)
            self.dataset.append(payFor)
            self.delegate?.sharingStatusAdded(at: IndexPath(row:self.modelset.count() - 1,section:0))
            
        }
    }
    
    public func delete(payForAt index: Int){
        PayForDAO.delete(payFor: self.dataset[index])
        self.modelset.remove(payFor: self.dataset[index])
        self.dataset.remove(at: index)
        self.delegate?.sharingStatusDeleted(at: IndexPath(row: index,section:0))
    }
    
    public var count : Int{
        return self.dataset.count
    }
    
    public func get(payForAt index: Int) -> PayFor? {
        guard (index >= 0 ) && (index < self.count) else { return nil }
        return self.dataset[index]
    }
    
}
