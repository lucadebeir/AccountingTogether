//
//  AddRepaymentViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData
import Foundation


class AddRepaymentViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var amountTF: UITextField!
    
    @IBOutlet weak var pickerViewPaidBy: UIPickerView!
    @IBOutlet weak var pickerViewPaidFor: UIPickerView!
    
    var newRepayment: Repayment? = nil
    
    var pickerDataPaidBy: [Traveller] = [Traveller]()
    var pickerDataPaidFor: [String] = [String]()
    
    var travellerSelected : Traveller?
    
    
    override func viewDidLoad() {
        if let repaymentToUpdate = self.newRepayment {
            self.nameTF.text = repaymentToUpdate.nameR
        }
    }
    
    // preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "addRepayment" { //UNWIND LINK
            let nameRepayment: String = self.nameTF.text!
            guard let amountRepayment = self.amountTF.text else { return }
            let amountE = Double(amountRepayment)
            self.newRepayment = Repayment(nameRepayment: nameRepayment, amountRepayment: amountE!)
            /*self.newRepayment?.paidBy = self.travellerSelected*/
            
        }
        else if segue.identifier == "cancel"{
            if let repaymentToCancel = self.newRepayment {
                RepaymentDAO.delete(repayment: repaymentToCancel)
                
            }
            
        }
        else{
            self.newRepayment = nil
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

