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


class AddExpenseViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate,
UIPickerViewDataSource  {
    
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    
    @IBOutlet weak var pickerViewPaidBy: UIPickerView!
    
    var pickerDataPaidBy: [Traveller] = []
    
    var newExpense: Expense? = nil
    var newPayFor: PayFor? = nil
    
    var travellerSelectedPayBy: Traveller? = nil
    
    var tripSelected: Trip?
    
    @IBOutlet var addExpenseController: TableTravellersExpenseViewController!
    
    var tableSharingStatusViewController: SharingStatusTableViewController!
    
    override func viewDidLoad() {
        if let expenseToUpdate = self.newExpense {
            self.nameTF.text = expenseToUpdate.nameE
        }
        else if let _data = TripDAO.getTravellersOfATrip(trip: tripSelected!){
            
            for t in _data.allObjects as! [Traveller]{
                self.pickerDataPaidBy.append(t)
            }
        }
        
        self.travellerSelectedPayBy = self.pickerDataPaidBy[0]
        
        //connect the pickerView :
        self.pickerViewPaidBy.delegate = self
        self.pickerViewPaidBy.dataSource = self
        //pickerData = ["it 1", "it2", "it3"]
        
        if let t = self.tripSelected {
            self.addExpenseController.travellerSetViewModel = TravellerSetViewModel(trip : t)
        }
        else {
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
            
            //the price for each
            let priceForEach = amountE! / Double(self.addExpenseController.selectedTravellers.count())
            
            self.newExpense = Expense(nameExpense: nameExpense, amountExpense: amountE!)
            self.newExpense?.paidBy = self.travellerSelectedPayBy
            for t in addExpenseController.selectedTravellers {
                self.newPayFor = PayFor(priceAmount: priceForEach, t: t, e: self.newExpense!, trip: self.tripSelected!)
                CoreDataManager.save()
            }
            CoreDataManager.save()
        }
        if let destination = segue.destination as? ExpenseViewController {
            destination.tableSharingStatusViewController = self.tableSharingStatusViewController
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
    
    //number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     return pickerDataPaidBy.count
     }
     
     // The data to return fopr the row and component (column) that's being passed in
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     return pickerDataPaidBy[row].fullname
     }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //the friend selected in the picker :
        travellerSelectedPayBy = pickerDataPaidBy[row]
    }
    
}

