//
//  AddTripViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 23/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit


class AddTripViewController: UIViewController, UITextFieldDelegate {
    
    var newTrip: Trip?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

