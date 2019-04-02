//
//  TravellerSetViewModel.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 31/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

/// Delegate to simulate reactive programming to change of travel set
protocol TravellerSetViewModelDelegate {
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    
    
    
    /// called when a Trip is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func travellerDeleted(at indexPath: IndexPath)
    
    
    /// called when a Trip is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func travellerUpdated(at indexPath: IndexPath)
    
    
    /// called when a Trip is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func travellerAdded(at indexPath: IndexPath)
}


class TravellerSetViewModel {
    
    // MARK: -
    private let modelset : TravellerSet
    var dataset : [Traveller] = []
    var delegate : TravellerSetViewModelDelegate? = nil
    
    init() {
        self.modelset = TravellerSet()
    }
    
    init(trip: Trip) {
        if let data = trip.isComposedBy {
            for t in data.allObjects as! [Traveller] {
                self.dataset.append(t)
            }
            self.modelset = TravellerSet(travellers: self.dataset)
        }
        else{
            self.modelset = TravellerSet()
        }
    }
    convenience init(delegate : TravellerSetViewModelDelegate, trip: Trip) {
        self.init(trip: trip)
        self.delegate = delegate
        
    }
    
    public func add(traveller: Traveller){
        if self.modelset.indexOf(t: traveller) == -1{
            self.modelset.add(traveller: traveller)
            self.dataset.append(traveller)
            self.delegate?.travellerAdded(at: IndexPath(row:self.modelset.count() - 1,section:0))
            
        }
    }
    
    public func delete(travellerAt index: Int){
        TravellerDAO.delete(traveller: self.dataset[index])
        self.modelset.remove(traveller: self.dataset[index])
        self.dataset.remove(at: index)
        self.delegate?.travellerDeleted(at: IndexPath(row: index,section:0))
    }
    
    public var count : Int{
        return self.dataset.count
    }
    
    public func get(travellerAt index: Int) -> Traveller?{
        guard (index >= 0 ) && (index < self.count) else { return nil }
        return self.dataset[index]
    }
    
}
