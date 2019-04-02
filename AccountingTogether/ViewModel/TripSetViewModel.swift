//
//  TripSetViewModel.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 31/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

/// Delegate to simulate reactive programming to change of travel set
protocol TripSetViewModelDelegate {
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    
    
    
    /// called when a Trip is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func tripDeleted(at indexPath: IndexPath)
    
    
    /// called when a Trip is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func tripUpdated(at indexPath: IndexPath)
    
    
    /// called when a Trip is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func tripAdded(at indexPath: IndexPath)
}


class TripSetViewModel {
    
    // MARK: -
    private let modelset : TripSet
    var dataset : [Trip] = []
    var delegate : TripSetViewModelDelegate? = nil
    
    init() {
        if let data = TripDAO.getAll() {
            self.modelset = TripSet(trips: data)
            for p in self.modelset{
                self.dataset.append(p)
            }
        }
        else{
            self.modelset = TripSet()
        }
    }
    convenience init(delegate : TripSetViewModelDelegate) {
        self.init()
        self.delegate = delegate
        
    }
    
    public func add(trip: Trip){
        if self.modelset.indexOf(t: trip) == -1{
            self.modelset.add(trip: trip)
            self.dataset.append(trip)
            self.delegate?.tripAdded(at: IndexPath(row:self.modelset.count() - 1,section:0))
            
        }
    }
    
    public func delete(tripAt index: Int){
        TripDAO.delete(trip: self.dataset[index])
        self.modelset.remove(trip: self.dataset[index])
        self.dataset.remove(at: index)
        self.delegate?.tripDeleted(at: IndexPath(row: index,section:0))
    }

    public var count : Int{
        return self.dataset.count
    }
    
    public func get(tripAt index: Int) -> Trip?{
        guard (index >= 0 ) && (index < self.count) else { return nil }
        return self.dataset[index]
    }
    
}
