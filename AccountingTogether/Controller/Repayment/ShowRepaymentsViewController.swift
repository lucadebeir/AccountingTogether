//
//  ShowRepaymentsViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData

class ShowRepaymentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var listRepayment: [Repayment]? = nil
    var repaymentSelected: Repayment? = nil
    
    @IBOutlet weak var nameTripLabel: UILabel!
    
    var tableTrip: Trip? = nil
    
    @IBOutlet weak var repayments: UITableView!
    
    
    override func viewDidLoad() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //MARK: - Table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listRepayment!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRepayment", for: indexPath) as! RepaymentTableViewCell
        
        cell.nameRepayment.text = "\(String(describing: listRepayment![indexPath.row].nameRepayment!))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
    
    //MARK: - Navigation
    
    /// <#Description#>
    ///
    /// - Parameter segue: <#segue description#>
    @IBAction func uwindToListRepayments(segue: UIStoryboardSegue) {
        if let controller = segue.source as? AddRepaymentViewController {
            if let newRepayment = controller.newRepayment {
                self.listRepayment?.append(newRepayment)
                self.repayments.reloadData()
            }
        }
        else {
            self.repayments.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            guard let indexPath = self.repayments.indexPath(for: cell)
                else{
                    return
            }
            self.repaymentSelected = listRepayment?[indexPath.row]
        }
    }
    
}
