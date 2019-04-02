//
//  RepaymentTableViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class RepaymentTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate, RepaymentSetViewModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var repaymentSetViewModel : RepaymentSetViewModel
    
    override init() {
        self.repaymentSetViewModel = RepaymentSetViewModel()
        super.init()
        self.repaymentSetViewModel.delegate = self
    }
    
    func dataSetChanged() {
        
    }
    
    func repaymentDeleted(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        self.tableView.endUpdates()
    }
    
    func repaymentUpdated(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        //self.tableView.
        self.tableView.endUpdates()
    }
    
    func repaymentAdded(at indexPath: IndexPath) {
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
        return self.repaymentSetViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRepayment", for: indexPath) as! RepaymentTableViewCell
        guard let repayment = self.repaymentSetViewModel.get(repaymentAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        cell.nameRepayment.text = "\(String(describing: repayment.nameR))"
        cell.amountRepayment.text = repayment.amountR.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if(editingStyle == UITableViewCell.EditingStyle.delete){
            self.repaymentSetViewModel.delete(repaymentAt: indexPath.row)
        }
        
    }
    
}


