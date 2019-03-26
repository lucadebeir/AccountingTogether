//
//  ShowSharingStatusViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class ShowSharingStatusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var listExpense: [Expense]? = nil
    var expenseSelected: Expense? = nil
    
    @IBOutlet weak var expenses: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            listExpense = try Expense.getAll()
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listExpense!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellExpense", for: indexPath) as! ExpenseTableViewCell
        
        cell.nameExpense.text = "\(String(describing: listExpense![indexPath.row].nameExpense!))"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (commit == UITableViewCell.EditingStyle.delete) {
            tableView.beginUpdates()
            do {
                try self.listExpense?[indexPath.row].delete()
                //self.listTrip?.remove(at: indexPath.row)
            } catch let e as NSError {
                print("Erreur a la suppression de VC :  \(e)")
                return
            }
            tableView.endUpdates()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showExpense"{
            if let cell = sender as? UITableViewCell {
                guard let indexPath = self.expenses.indexPath(for: cell)
                    else{
                        return
                }
                self.expenseSelected = listExpense?[indexPath.row]
            }
        }
    }
}
