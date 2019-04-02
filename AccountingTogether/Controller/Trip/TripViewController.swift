//
//  TripViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 27/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

class TripViewController: UIViewController {
    
    var tripTableVC: TripTableViewController!
    
    var tripSelected: Trip?
    
    @IBOutlet weak var trip: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tripTableVC = TripTableViewController(tableView: self.trip, viewController: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func uwindToListTrip(segue: UIStoryboardSegue) {
        if (segue.identifier == "addTrip") {
            let embedTripController = segue.source as! EmbedTripViewController
            if let trip = embedTripController.newTrip {
                self.tripTableVC.tripSetViewModel.add(trip: trip)
                CoreDataManager.save()
            }
        }
    }
    
  
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTrip"{
            if let cell = sender as? UICollectionViewCell {
                guard let indexPath = self.trip.indexPath(for: cell)
                    else{
                        return
                }
                self.tripSelected = listTrip[indexPath.row]
            }
            guard let tabBarController = segue.destination as? UITabBarController, let destinationVC = tabBarController.viewControllers?[0] as? ShowTripDetailViewController, let destinationVC1 = tabBarController.viewControllers?[1] as? ShowExpensesViewController, let destinationVC2 = tabBarController.viewControllers?[2] as? ShowRepaymentViewController, let destinationVC3 = tabBarController.viewControllers?[3] as? ShowTravellersViewController else {
                return
            }
            destinationVC.tableTrip = self.tripSelected
            destinationVC1.tableTrip = self.tripSelected
            destinationVC2.tableTrip = self.tripSelected
            destinationVC3.tableTrip = self.tripSelected
        }
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "showTrip"){
            
            if let destination = segue.destination as? ShowTripDetailViewController {
                if let cell = sender as? UITableViewCell{
                    
                    guard let indexPath = self.tripTableVC.tableView.indexPath(for: cell) else{
                        return
                    }
                    
                    guard let trip = self.tripTableVC.tripSetViewModel.get(tripAt: indexPath.row) else{
                        fatalError("no travel found at this index")
                    }
                    destination.tripSelected = trip
                    self.tripSelected = trip
                }
            }
            
            guard let tabBarController = segue.destination as? UITabBarController, let destinationVC = tabBarController.viewControllers?[0] as? ShowTripDetailViewController, let destinationVC1 = tabBarController.viewControllers?[1] as? ShowExpensesViewController, let destinationVC2 = tabBarController.viewControllers?[2] as? ShowRepaymentViewController, let destinationVC3 = tabBarController.viewControllers?[3] as? TravellerViewController else {
                return
            }
            destinationVC.tripSelected = self.tripSelected
            destinationVC1.tableTrip = self.tripSelected
            destinationVC2.tableTrip = self.tripSelected
            destinationVC3.tripSelected = self.tripSelected
            
        }
        else if (segue.identifier == "editTrip"){
            if let destination = segue.destination as? EditTripViewController {
                if let cell = sender as? UITableViewCell {
                    
                    guard let indexPath = self.tripTableVC.tableView.indexPath(for: cell) else{
                        return
                    }
                    
                    guard let trip = self.tripTableVC.tripSetViewModel.get(tripAt: indexPath.row) else{
                        fatalError("no travel found at this index")
                    }
                    destination.tripToEdit = trip
                }
            }
        }
        
    }
    
}
