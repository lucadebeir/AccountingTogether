//
//  RepaymentTableViewCell.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

class RepaymentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameRepayment: UILabel!
    @IBOutlet weak var travellerPaying: UILabel!
    @IBOutlet weak var travellerRefunding: UILabel!
    @IBOutlet weak var amountRepayment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}