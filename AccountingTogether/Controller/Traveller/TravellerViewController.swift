//
//  ShowTravellersViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class TravellerViewController: UIViewController {
    
    var tripSelected : Trip?
    @IBOutlet var tableTravellerEmbedViewController: TableTravellerEmbedViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let trip = self.tripSelected {
            self.tableTravellerEmbedViewController.travellerSetViewModel = TravellerSetViewModel(trip: trip)
            
        } else {
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func uwindToListTraveller(segue: UIStoryboardSegue) {
        if (segue.identifier == "addTraveller") {
            let embedTravellerController = segue.source as! EmbedTravellerViewController
            if let traveller = embedTravellerController.newTraveller {
                self.tableTravellerEmbedViewController.travellerSetViewModel.add(traveller: traveller)
                CoreDataManager.save()
            }
        }
    }
    
}
