//
//  EditTravellerViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

class EditTravellerViewController: TravellerViewController {
    
    var travellerToEdit: Traveller?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedEditTraveller"{
            if let embedController = segue.destination as? EmbedTravellerViewController{
                embedController.newTraveller = self.travellerToEdit
            }
        }
    }
    
}
