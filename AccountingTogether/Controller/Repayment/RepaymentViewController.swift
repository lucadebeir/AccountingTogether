//
//  RepaymentViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class RepaymentViewController: UIViewController {
    
    var travellerSelected : Traveller?
    var tripSelected: Trip?
    
    @IBOutlet weak var nameTripLabel: UILabel!
    
    @IBOutlet var tableRepaymentViewController: RepaymentTableViewController!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AddRepaymentViewController {
            destination.travellerSelected = self.travellerSelected
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let traveller = self.travellerSelected {
            self.tableRepaymentViewController.repaymentSetViewModel = RepaymentSetViewModel(delegate: self.tableRepaymentViewController, traveller: traveller)
            
            
        } else {
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func uwindToListRepayment(segue: UIStoryboardSegue) {
        if (segue.identifier == "addRepayment") {
            let travellerController = segue.source as! AddRepaymentViewController
            if let repayment = travellerController.newRepayment {
                self.tableRepaymentViewController.repaymentSetViewModel.add(repayment: repayment)
                CoreDataManager.save()
            }
        }
    }
    
}

