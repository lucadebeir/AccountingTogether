//
//  ExpenseViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class ExpenseViewController: UIViewController {
    
    var travellerSelected : Traveller?
    var tripSelected: Trip?
    
    @IBOutlet weak var nameTripLabel: UILabel!
    
    @IBOutlet var tableExpenseViewController: ExpenseTableViewController!
    
    var tableSharingStatusViewController: SharingStatusTableViewController!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTripLabel.text = self.tripSelected?.nameTrip
        if let trip = self.tripSelected {
            self.tableExpenseViewController.expenseSetViewModel = ExpenseSetViewModel(delegate: self.tableExpenseViewController, trip: trip)
            
            
        } else {
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AddExpenseViewController {
            destination.tripSelected = self.tripSelected
        }
    }
    
    @IBAction func uwindToListExpense(segue: UIStoryboardSegue) {
        if (segue.identifier == "addExpense") {
            let travellerController = segue.source as! AddExpenseViewController
            if let expense = travellerController.newExpense {
                self.tableExpenseViewController.expenseSetViewModel.add(expense: expense)
                CoreDataManager.save()
            }
            if let payFor = travellerController.newPayFor {
                self.tableSharingStatusViewController.sharingStatusSetViewModel.add(payFor: payFor)
                CoreDataManager.save()
            }
        }
    }
    
}

