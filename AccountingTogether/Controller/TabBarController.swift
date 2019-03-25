//
//  TabBarController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 25/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    var tripSelected: Trip? = nil
    
    @IBOutlet var tabBarTrip: TabBarController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ShowTripDetailViewController
        destinationVC.tableTrip = self.tripSelected
        print("prepareTBC")
        print(self.tripSelected?.nameTrip)
    }
    
}
