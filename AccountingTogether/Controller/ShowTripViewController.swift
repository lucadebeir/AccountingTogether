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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTrip!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTrip", for: indexPath) as! TripTableViewCell
        
        cell.nameTrip.text = "\(String(describing: listTrip![indexPath.row].nameTrip!))"
        
        return cell
    }
    
    var count: Int {
        return self.listTrip!.count
    }
    
    @IBAction func uwindToListTrip(segue: UIStoryboardSegue) {
        trip.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTrip"{
            let destinationVC = segue.destination as! ShowTripDetailViewController
            destinationVC.tableTrip = tripSelected
        }
    }
    
}
