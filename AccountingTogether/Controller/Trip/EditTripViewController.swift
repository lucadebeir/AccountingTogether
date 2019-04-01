//
//  EditTripViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 23/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

class EditTripViewController: TripViewController {
    
    var tripToEdit: Trip?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedEditTrip"{
            if let embedController = segue.destination as? EmbedTripViewController{
                embedController.newTrip = self.tripToEdit
            }
        }
    }
    
}
