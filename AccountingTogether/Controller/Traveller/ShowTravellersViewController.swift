//
//  ShowTravellersViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class ShowTravellersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var listTraveller: [Traveller]? = nil
    var travelerSelected: Traveller? = nil
    
    @IBOutlet weak var travellers: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            listTraveller = try Traveller.getAll()
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
    
     //MARK: - TableView data source protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTraveller!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTraveller", for: indexPath) as! TravellerTableViewCell
        
        cell.nameTraveller.text = "\(String(describing: listTraveller![indexPath.row].lastNameTraveller!)) \(String(describing: listTraveller![indexPath.row].firstNameTraveller!))"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (commit == UITableViewCell.EditingStyle.delete) {
            tableView.beginUpdates()
            do {
                try self.listTraveller?[indexPath.row].delete()
                //self.listTrip?.remove(at: indexPath.row)
            } catch let e as NSError {
                print("Erreur a la suppression de VC :  \(e)")
                return
            }
            tableView.endUpdates()
        }
    }
    
    //MARK: - Navigation
    
    @IBAction func uwindToListTravellers(segue: UIStoryboardSegue) {
        if let controller = segue.source as? AddTravellerViewController {
            if let newTraveller = controller.newTraveller {
                self.listTraveller?.append(newTraveller)
                self.travellers.reloadData()
            }
        }
        /*else if segue.source is EditTravellerViewController {
            self.travellers.reloadData()
        }*/
        else {
            self.travellers.reloadData()
        }
    }
    
    //In a storyboard-based application, you will often want to do a little prepare navigation
    //prepare la transition pour le segue qui a provoqué la tansition et le sender est la vue qui envoie cette transition.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get the new view controller using segue.destinationViewController.
        //Pass the selected object to the new view controller.
        if segue.identifier == "showTraveller"{
            if let cell = sender as? UITableViewCell {
                guard let indexPath = self.travellers.indexPath(for: cell)
                    else{
                        return
                }
                self.travelerSelected = listTraveller?[indexPath.row]
            }
            guard let tabBarController = segue.destination as? UITabBarController, let destinationVC = tabBarController.viewControllers?[0] as? ShowTravellerDetailViewController else {
                return
            }
            destinationVC.tableTraveller = self.travelerSelected
        }
    }
    
}
