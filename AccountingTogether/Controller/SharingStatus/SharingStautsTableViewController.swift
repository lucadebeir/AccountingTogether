//
//  SharingStatusTableViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 03/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class SharingStatusTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate, SharingStatusSetViewModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sharingStatusSetViewModel : SharingStatusSetViewModel
    
    override init() {
        self.sharingStatusSetViewModel = SharingStatusSetViewModel()
        super.init()
        self.sharingStatusSetViewModel.delegate = self
    }
    
    func dataSetChanged() {
        
    }
    
    func sharingStatusDeleted(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        self.tableView.endUpdates()
    }
    
    func sharingStatusUpdated(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        //self.tableView.
        self.tableView.endUpdates()
    }
    
    func sharingStatusAdded(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        self.tableView.endUpdates()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    //MARK: - table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sharingStatusSetViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showBalance", for: indexPath) as! SharingStatusTableViewCell
        guard let payFor = self.sharingStatusSetViewModel.get(payForAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        cell.nameTravellerPaidBy.text = "\(String(describing: payFor.be?.paidBy?.fullname))"
        cell.nameTravellerPaidFor.text = "\(String(describing: payFor.must?.fullname))"
        cell.amount.text = payFor.priceAmount.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if(editingStyle == UITableViewCell.EditingStyle.delete){
            self.sharingStatusSetViewModel.delete(payForAt: indexPath.row)
        }
        
    }
    
}
