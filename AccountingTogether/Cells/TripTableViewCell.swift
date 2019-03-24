//
//  TripTableViewCell.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 23/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import UIKit

class TripTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameTrip: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
