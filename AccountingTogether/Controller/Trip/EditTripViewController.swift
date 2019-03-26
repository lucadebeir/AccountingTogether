//
//  EditTripViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 23/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

class EditTripViewController: UIViewController {
    
    var trip: Trip? = nil
    
    
    @IBOutlet weak var nameTrip: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTrip.text = trip?.nameTrip
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editTrip(_ sender: Any) {
        let inputs: [String:UITextField] = ["name": nameTrip]
        if FormValidatorHelper.validateForm(inputs){
            do{
                try trip?.edit(withName: nameTrip.text!)
                DialogBoxHelper.alert(view: self, WithTitle: "Edition du contact", andMessage: "La mise à jours du contact est effectuée", closure: {(action) in
                    self.performSegue(withIdentifier: "editPerson", sender: self)
                })
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Erreur lors de l'ajout du contact professionnel")
            }
        }else{
            DialogBoxHelper.alert(view: self, errorMessage: "Formulaire invalide")
        }
    }
    
}
