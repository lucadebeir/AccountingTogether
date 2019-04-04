//
//  BalanceViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class BalanceViewController: UIViewController {
    
    var tripSelected: Trip?
    
    @IBOutlet weak var nameTripLabel: UILabel!
    
    @IBOutlet var tableBalanceViewController: BalanceTableViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTripLabel.text = self.tripSelected?.nameTrip
        if let trip = self.tripSelected {
            self.tableBalanceViewController.balanceSetViewModel = BalanceSetViewModel(delegate: self.tableBalanceViewController, trip: trip)
            
            
        } else {
            
        }
    }
    
    /*func sharingCalculation(pf: [PayFor], repayment: [Repayment], travellers: [Traveller] ){
        //Variable containing the dictionary of people and dictionnary
        var dd: [Traveller: [Traveller: Double]]? = nil
        let zero: Double = 0
        
        
        //Initialisation of the dictionary
        for tr1 in travellers{
            for tr2 in travellers{
                let j: [Traveller: Double] = [tr2: zero]
                dd![tr1]=j
            }
        }
        for p in pf{
            let payeur: Traveller = p.traveller!
            let aPaye: Traveller = p.expense!.paidBy!
            let amount: Double = p.amount
            if payeur != aPaye{
                let i: [Traveller: Double] = [payeur: -amount]
                let j: [Traveller: Double] = [aPaye: amount]
                dd![payeur] = j
                dd![aPaye] = i
            }
        }
    }*/
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? AddExpenseViewController {
            destination.tableBalanceViewController = self.tableBalanceViewController
            destination.tripSelected = self.tripSelected
            
        }
        
    }
}
