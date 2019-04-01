//
//  ShowTripViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 23/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class TripCollectionViewController: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, TripSetViewModelDelegate {
    
    
    var collectionView: UICollectionView!
    var controllerVC: TripViewController!
    var tripSetViewModel: TripSetViewModel
    
    init(collectionView: UICollectionView, viewController: TripViewController) {
        
        self.tripSetViewModel = TripSetViewModel()
        self.collectionView = collectionView
        self.controllerVC = viewController
        
        super.init()
        
        self.tripSetViewModel.delegate = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func dataSetChanged() {
        
    }
    
    func tripDeleted(at indexPath: IndexPath) {
        self.collectionView.beginInteractiveMovementForItem(at: indexPath)
        self.collectionView.deleteItems(at: [indexPath])
        self.collectionView.endInteractiveMovement()
    }
    
    func tripUpdated(at indexPath: IndexPath) {
        
    }
    
    func tripAdded(at indexPath: IndexPath) {
        self.collectionView.beginInteractiveMovementForItem(at: indexPath)
        self.collectionView.insertItems(at: [indexPath])
        self.collectionView.endInteractiveMovement()
    }
    
    func numberOfSections(in tableView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tripSetViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellT", for: indexPath) as! TripCell
        guard let trip = self.tripSetViewModel.get(tripAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        cell.nameTrip?.text = "\(String(describing: trip.nameTrip!))"
        cell.imageTrip?.image = UIImage(data: trip.imageTrip!)
        return cell
    }
    
    func deleteHandlerAction(action: UICollectionViewDropItem,indexPath: IndexPath) -> Void {
        self.tripSetViewModel.delete(tripAt: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    private func collectionView(_ collectionView: UICollectionView, commit: UICollectionViewCell, forRowAt indexPath: IndexPath) {
        collectionView.delete(commit)
        tripDeleted(at: indexPath)
    }
    
}
