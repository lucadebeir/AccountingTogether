//
//  ShowTripViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 23/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class TripTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate, TripSetViewModelDelegate {
    
    var tableView: UITableView!
    var controllerVC: TripViewController!
    var tripSetViewModel: TripSetViewModel
    
    init(tableView: UITableView, viewController: TripViewController) {
        
        self.tripSetViewModel = TripSetViewModel()
        self.tableView = tableView
        self.controllerVC = viewController
        
        super.init()
        
        self.tripSetViewModel.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func dataSetChanged() {
        
    }
    
    func tripDeleted(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        self.tableView.endUpdates()
    }
    
    func tripUpdated(at indexPath: IndexPath) {
        
    }
    
    func tripAdded(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        self.tableView.endUpdates()        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tripSetViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellT", for: indexPath)
        guard let trip = self.tripSetViewModel.get(tripAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        cell.textLabel?.text = "\(String(describing: trip.nameTrip!))"
        cell.imageView?.image = UIImage(data: trip.imageTrip!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    private func tableView(_ tableView: UITableView, commit: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.delete(commit)
        tripDeleted(at: indexPath)
    }
    
    func deleteHandlerAction(action: UITableViewRowAction,indexPath: IndexPath) -> Void {
        self.tripSetViewModel.delete(tripAt: indexPath.row)
    }
    
    func editHandlerAction(action: UITableViewRowAction,indexPath: IndexPath) -> Void {
        self.controllerVC.performSegue(withIdentifier: "editTrip", sender: self)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "Delete", handler: self.deleteHandlerAction)
        delete.backgroundColor = UIColor.red
        let edit = UITableViewRowAction(style: .default, title: "Edit", handler: self.editHandlerAction)
        edit.backgroundColor = UIColor.orange
        return [delete, edit]
        
    }
}
