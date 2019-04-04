//
//  BalanceDAO.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 04/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import CoreData
import Foundation

class BalanceDAO {
    
    static let request : NSFetchRequest<Balance> = Balance.fetchRequest()
    static func save(){
        CoreDataManager.save()
    }
    
    static func fetchAll() -> [Balance]?{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return nil
        }
        
    }
    
    
    static func fetchAllBalanceOfTraveller(traveller: Traveller) -> [Balance]{
        
        var pBalance: [Balance] = []
        
        for balance in traveller.result?.allObjects as! [Balance] {
            
            pBalance.append(balance)
        }
        
        return pBalance
    }
    
    static func fetchAllBalance(trip : Trip) -> [Balance]{
        
        var Balance: [Balance] = []
        
        if let _travellersOfTrip = TripDAO.getTravellersOfATrip(trip: trip) {
            
            for f in _travellersOfTrip.allObjects as! [Traveller]{
                
                var tab : [Balance] = []
                tab = BalanceDAO.fetchAllBalanceOfTraveller(traveller: f)
                for i in tab {
                    if i.amount < 0 {
                        Balance.append(i)
                    }
                }
                
            }
            
            return Balance
        }
        else {
            return Balance
        }
    }
    
    static func getBalance(t: Traveller, fullname : String) -> [Balance]? {
        self.request.predicate = NSPredicate(format: "nameTravellerPaidFor == %@ AND relatedTo == %@", fullname,  t)
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return nil
        }
    }
    
    static func updateBalances(paidBy: Traveller, paidFor: Traveller, amount: Double){
        let paidBalance : [Balance]? = getBalance(t: paidBy, fullname: paidFor.fullname)
        
        if(paidBalance!.count == 0){
            let balance : Balance = Balance(nameT: paidFor.fullname, amount: amount)
            balance.relatedTo = paidBy
        }else{
            paidBalance![0].amount = paidBalance![0].amount + amount
        }
        
        let otherBalance :  [Balance]? = getBalance(t: paidFor, fullname: paidBy.fullname)
        
        if(otherBalance!.count == 0){
            let balance : Balance = Balance(nameT: paidBy.fullname, amount: -amount)
            balance.relatedTo = paidFor
            
        }else{
            otherBalance![0].amount = otherBalance![0].amount - amount
        }
        
    }
    
    
    
    static func delete(balance : Balance){
        CoreDataManager.context.delete(balance)
    }
    
}
