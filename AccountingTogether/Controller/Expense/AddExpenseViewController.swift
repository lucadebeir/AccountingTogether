//
//  AddExpenseViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData
import Foundation


class AddExpenseViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    
    var newExpense: Expense? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addExpense(_ sender: Any) {
        let inputs: [String: UITextField] = ["name": nameTF, "price": priceTF]
        if FormValidatorHelper.validateForm(inputs){
            do{
                newExpense = try Expense.create(withName: nameTF.text!)
                self.dismiss(animated: true, completion: nil)
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Ajout de la dépense échouée")
            }
            
        }else{
            DialogBoxHelper.alert(view: self, WithTitle: "Erreur", andMessage: "Données du formulaire invalides", closure: nil)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
