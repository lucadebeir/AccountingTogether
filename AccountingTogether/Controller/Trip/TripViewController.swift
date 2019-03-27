//
//  TripViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 27/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class TripViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var listTrip: [Trip] = []
    var tripSelected: Trip? = nil
    
    @IBOutlet weak var trip: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            listTrip = try Trip.getAll()
        }catch let error as NSError{
            DialogBoxHelper.alert(view: self, error: error)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listTrip.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellT", for: indexPath) as! TripCell
        cell.nameTrip.text = "\(String(describing: listTrip[indexPath.row].nameTrip!))"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
        
    func delete(index: Int) {
        let t = listTrip[index]
        // supprime de la BD
        do {
            try t.delete()
            // supprime du model
            listTrip.remove(at: index)
        } catch let e as NSError {
            print("Erreur a la suppression de VC :  \(e)")
            return
        }
    }
    
    @IBAction func uwindToListTrip(segue: UIStoryboardSegue) {
        if let controller = segue.source as? AddTripViewController {
            if let newTrip = controller.newTrip {
                self.listTrip.append(newTrip)
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
    }
    
}
