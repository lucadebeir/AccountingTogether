//
//  TableTravellersExpenseViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 03/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

class TableTravellersExpenseViewController: NSObject, UITableViewDataSource, UITableViewDelegate, TravellerSetViewModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var travellerSetViewModel : TravellerSetViewModel
    
    var selectedTravellers : TravellerSet = TravellerSet(travellers: [])
    
    override init() {
        self.travellerSetViewModel = TravellerSetViewModel()
        super.init()
        self.travellerSetViewModel.delegate=self
    }
    
    func dataSetChanged() {
        
    }
    
    func travellerDeleted(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        self.tableView.endUpdates()
    }
    
    func travellerUpdated(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        //self.tableView.
        self.tableView.endUpdates()
    }
    
    func travellerAdded(at indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        self.tableView.endUpdates()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //permet de choisir le nombre de sections (confert fonction pour afficher le nom des section si on veut)
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //permet de choisir le nombre de lignes
        return self.travellerSetViewModel.count
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "payFor", for: indexPath)
        guard let traveller = self.travellerSetViewModel.get(travellerAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        cell.textLabel?.text = " \(traveller.fullname) "
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if(editingStyle == UITableViewCell.EditingStyle.delete){
            self.travellerSetViewModel.delete(travellerAt: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let f = self.travellerSetViewModel.get(travellerAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        if(self.selectedTravellers.contains(f)){
            
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            self.selectedTravellers.remove(traveller: f)
        }else{
            
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            self.selectedTravellers.add(traveller: f)
        }
        
        
    }
    
}
