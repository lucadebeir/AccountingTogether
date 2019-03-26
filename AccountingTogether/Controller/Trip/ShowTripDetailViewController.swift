//
//  ViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 13/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ShowTripDetailViewController: UIViewController {

    var tableTrip: Trip? = nil
    
    @IBOutlet weak var nameTripLabel: UILabel!
    
    override func viewDidLoad() {
        self.nameTripLabel.text = tableTrip?.nameTrip
        super.viewDidLoad()
        print("viewDidLoadDetailVC")
        print(tableTrip?.nameTrip)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

