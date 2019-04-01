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

    var tripSelected: Trip? = nil
    
    @IBOutlet weak var nameTripLabel: UILabel!
    @IBOutlet weak var imageTrip: UIImageView!
    @IBOutlet weak var datesTrip: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let trip = self.tripSelected {
            self.nameTripLabel.text = trip.nameTrip
            self.imageTrip.image = UIImage(named: "blabla")
        } else {
            self.nameTripLabel.text = ""
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

