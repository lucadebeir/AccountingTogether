//
//  ShowExpensesViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class ExpenseTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate, ExpenseSetViewModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var expenseSetViewModel : ExpenseSetViewModel
    
    override init() {
        self.expenseSetViewModel = ExpenseSetViewModel()
        super.init()
        self.expenseSetViewModel.delegate = self
    }
    
    func dataSetChanged() {
        
    }
    
    func expenseDeleted(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        self.tableView.endUpdates()
    }
    
    func expenseUpdated(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        //self.tableView.
        self.tableView.endUpdates()
    }
    
    func expenseAdded(at indexPath: IndexPath) {
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
        return self.expenseSetViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellExpense", for: indexPath) as! ExpenseTableViewCell
        guard let expense = self.expenseSetViewModel.get(expenseAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        cell.nameExpense.text = "\(String(describing: expense.nameE))"
        cell.amountExpense.text = expense.amountE.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if(editingStyle == UITableViewCell.EditingStyle.delete){
            self.expenseSetViewModel.delete(expenseAt: indexPath.row)
        }
        
    }
    
}

