//
//  ShowSharingStatusViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class SharingStatusViewController: UIViewController {
    
    var tripSelected: Trip?
    
    @IBOutlet weak var nameTripLabel: UILabel!
    
    @IBOutlet var tableSharingStatusViewController: SharingStatusTableViewController!
    
    
    override func viewDidLoad() {
        self.nameTripLabel.text = self.tripSelected?.nameTrip
        super.viewDidLoad()
        if let trip = self.tripSelected {
            self.tableSharingStatusViewController.sharingStatusSetViewModel = SharingStatusSetViewModel(delegate: self.tableSharingStatusViewController, trip: trip)
            
            
        } else {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? AddExpenseViewController {
            destination.tableSharingStatusViewController = self.tableSharingStatusViewController
        }
        
    }
}
