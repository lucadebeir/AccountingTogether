//
//  AddTravellerViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddTravellerViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var lastNameTravellerTF: UITextField!
    @IBOutlet weak var firstNameTravellerTF: UITextField!
    @IBOutlet weak var arrivalDateTraveller: UIDatePicker!
    
    var newTraveller: Traveller? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTraveller(_ sender: Any) {
        let inputs: [String: UITextField] = ["name": lastNameTravellerTF, "prénom": firstNameTravellerTF]
        if FormValidatorHelper.validateForm(inputs){
            do{
                newTraveller = try Traveller.create(withName: lastNameTravellerTF.text!, withPrenom: firstNameTravellerTF.text!, withDate: arrivalDateTraveller!.date)
                self.dismiss(animated: true, completion: nil)
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Ajout du voyageur échoué")
            }
            
        }else{
            DialogBoxHelper.alert(view: self, WithTitle: "Erreur", andMessage: "Données du formulaire invalides", closure: nil)
        }
        
    }
    //MARK - 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
