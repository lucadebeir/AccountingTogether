//
//  EmbedTravellerViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

class EmbedTravellerViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var dateArrival: UIDatePicker!
    
    var newTraveller : Traveller?
    var tripSelected: Trip?
    
    override func viewDidLoad() {
        if let travellerToUpdate = self.newTraveller {
            self.lastNameTF.text = travellerToUpdate.lastName
        }
    }
    // preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "addTraveller" { //UNWIND LINK
            let lastName: String = self.lastNameTF.text!
            let firstName: String = self.firstNameTF.text!
            self.newTraveller = Traveller(lastName: lastName, firstName: firstName)
            self.newTraveller?.participates = self.tripSelected
            
        }
        else if segue.identifier == "cancel"{
            if let travellerToCancel = self.newTraveller {
                TravellerDAO.delete(traveller: travellerToCancel)
                
            }
            
        }
        else{
            self.newTraveller = nil
        } }
    
    
    // MARK: - TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text{
            if text != ""{
                textField.resignFirstResponder()
                return true
            } }
        return false
    }
}
