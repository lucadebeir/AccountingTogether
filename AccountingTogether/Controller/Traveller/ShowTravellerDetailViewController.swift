//
//  ShowTravellerDetailViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ShowTravellerDetailViewController: UIViewController {
    
    var tableTraveller: Traveller? = nil
    
    @IBOutlet weak var nameTravellerLabel: UILabel!
    
    override func viewDidLoad() {
        self.nameTravellerLabel.text = tableTraveller?.nameTraveller
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
