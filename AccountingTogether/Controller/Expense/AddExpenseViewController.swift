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
    
    @IBOutlet weak var pickerViewPaidBy: UIPickerView!
    @IBOutlet weak var pickerViewPaidFor: UIPickerView!
    
    var pickerDataPaidBy: [Traveller] = [Traveller]()
    var pickerDataPaidFor: [String] = [String]()
    
    var newExpense: Expense? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try pickerDataPaidBy = Traveller.getAll()
        } catch {
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addExpense(_ sender: Any) {
        let inputs: [String: UITextField] = ["name": nameTF, "price": priceTF]
        if FormValidatorHelper.validateForm(inputs){
            do{
                newExpense = try Expense.create(withName: nameTF.text!, withAmount: Double(priceTF.text!) ?? 0.0)
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
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerDataPaidBy.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataPaidBy[row].firstNameTraveller!
    }
    
}
