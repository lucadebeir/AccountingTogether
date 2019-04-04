//
//  BalanceTableViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 03/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class BalanceTableViewController: NSObject, UITableViewDataSource, BalanceSetViewModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var balanceSetViewModel : BalanceSetViewModel
    
    override init() {
        self.balanceSetViewModel = BalanceSetViewModel()
        super.init()
    }
    
    func dataSetChanged() {
        
    }
    
    func balanceDeleted(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        self.tableView.endUpdates()
    }
    
    func balanceUpdated(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        //self.tableView.
        self.tableView.endUpdates()
    }
    
    func balanceAdded(at indexPath: IndexPath) {
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
        return self.balanceSetViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let payFor = self.balanceSetViewModel.get(balanceAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "showBalance", for: indexPath) as? SharingStatusTableViewCell
        
        cell?.amount?.text = "\(payFor.amount.description)€"
        cell?.nameTravellerPaidBy?.text = " \(payFor.relatedTo!.fullname ) must be at \(String(describing: payFor.nameTravellerPaidFor! )) "
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if(editingStyle == UITableViewCell.EditingStyle.delete){
            self.balanceSetViewModel.delete(balanceAt: indexPath.row)
        }
        
    }
    
}
