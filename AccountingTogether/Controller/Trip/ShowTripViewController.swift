//
//  ShowTripViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 23/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class ShowTripViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var listTrip: [Trip]? = nil
    var tripSelected: Trip? = nil
    
    @IBOutlet weak var trip: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            listTrip = try Trip.getAll()
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func delete(index: Int) {
        let t = listTrip![index]
        // supprime de la BD
        do {
            try t.delete()
            // supprime du model
            listTrip?.remove(at: index)
        } catch let e as NSError {
            print("Erreur a la suppression de VC :  \(e)")
            return
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTrip!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTrip", for: indexPath) as! TripTableViewCell
        
        cell.nameTrip.text = "\(String(describing: listTrip![indexPath.row].nameTrip!))"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (commit == UITableViewCell.EditingStyle.delete) {
            tableView.beginUpdates()
            do {
                try self.listTrip?[indexPath.row].delete()
                //self.listTrip?.remove(at: indexPath.row)
            } catch let e as NSError {
                print("Erreur a la suppression de VC :  \(e)")
                return
            }
            tableView.endUpdates()
        }
    }
    
    @IBAction func uwindToListTrip(segue: UIStoryboardSegue) {
        if let controller = segue.source as? AddTripViewController {
            if let newTrip = controller.newTrip {
                self.listTrip?.append(newTrip)
                self.trip.reloadData()
            }
        }
        else if segue.source is EditTripViewController {
            self.trip.reloadData()
        }
        else {
            self.trip.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTrip"{
            if let cell = sender as? UITableViewCell {
                guard let indexPath = self.trip.indexPath(for: cell)
                    else{
                    return
                }
                self.tripSelected = listTrip?[indexPath.row]
            }
            guard let tabBarController = segue.destination as? UITabBarController, let destinationVC = tabBarController.viewControllers?[0] as? ShowTripDetailViewController, let destinationVC1 = tabBarController.viewControllers?[1] as? ShowExpensesViewController, let destinationVC2 = tabBarController.viewControllers?[2] as? ShowRepaymentViewController, let destinationVC3 = tabBarController.viewControllers?[3] as? ShowTravellersViewController else {
                return
            }
            destinationVC.tableTrip = self.tripSelected
            destinationVC1.tableTrip = self.tripSelected
            destinationVC2.tableTrip = self.tripSelected
            destinationVC3.tableTrip = self.tripSelected
        }
    }
    
}
