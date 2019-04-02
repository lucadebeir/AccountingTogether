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


class AddExpenseViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    
    @IBOutlet weak var pickerViewPaidBy: UIPickerView!
    @IBOutlet weak var pickerViewPaidFor: UIPickerView!
    
    var pickerDataPaidBy: [Traveller] = [Traveller]()
    var pickerDataPaidFor: [String] = [String]()
    
    var newExpense: Expense? = nil
    
    var travellerSelected : Traveller?
    
    
    override func viewDidLoad() {
        if let expenseToUpdate = self.newExpense {
            self.nameTF.text = expenseToUpdate.nameE
        }
    }
    
    // preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "addExpense" { //UNWIND LINK
            let nameExpense: String = self.nameTF.text!
            guard let amountExpense = self.priceTF.text else { return }
            let amountE = Double(amountExpense)
            self.newExpense = Expense(nameExpense: nameExpense, amountExpense: amountE!)
            /*self.newExpense?.paidBy = self.travellerSelected*/
            
        }
        else if segue.identifier == "cancel"{
            if let expenseToCancel = self.newExpense {
                ExpenseDAO.delete(expense: expenseToCancel)
                
            }
            
        }
        else{
            self.newExpense = nil
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*// The number of rows of data
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     return pickerDataPaidBy.count
     }
     
     // The data to return fopr the row and component (column) that's being passed in
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     return pickerDataPaidBy[row].firstNameTraveller!
     }*/
    
}

