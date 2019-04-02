//
//  TableTravellerEmbedViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 02/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

class TableTravellerEmbedViewController: NSObject, UITableViewDataSource, TravellerSetViewModelDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var travellerSetViewModel : TravellerSetViewModel
    
    override init() {
        self.travellerSetViewModel = TravellerSetViewModel()
        super.init()
        self.travellerSetViewModel.delegate = self
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "travellerCell", for: indexPath)
        guard let traveller = self.travellerSetViewModel.get(travellerAt: indexPath.row) else{
            fatalError("no travel found at this index")
        }
        cell.textLabel?.text = " \(traveller.fullname) "
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        
        //let alertHelper = AlertHelper()
        //alertHelper.alert(title: "", message: "")
        if(editingStyle == UITableViewCell.EditingStyle.delete){
            self.travellerSetViewModel.delete(travellerAt: indexPath.row)
        }
    }
    
    
}
