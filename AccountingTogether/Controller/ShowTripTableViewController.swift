//
//  ViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 13/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

class ShowTripeTableViewController: UIViewController {

    var tableTrip: Trip? = nil
    
    @IBOutlet weak var nameTripLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTripLabel.text = tableTrip?.nameTrip
        self.title = "\(tableTrip!.nameTrip!)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! EditTripViewController
        destinationVC.trip = tableTrip!
    }


}

