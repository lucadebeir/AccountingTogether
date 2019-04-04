//
//  PayForDAO.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 03/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import CoreData

class PayForDAO {
    
    static let request: NSFetchRequest<PayFor> = PayFor.fetchRequest()
    
    static func save() {
        CoreDataManager.save()
    }
    
    static func getAll() -> [PayFor]? {
        //self.request.sortDescriptors = [NSSortDescriptor(key: "nameTrip", ascending: true)]
        self.request.predicate = nil
        do {
            return try CoreDataManager.context.fetch(self.request)
        } catch {
            return nil
        }
    }
    
    static func fetchAllPayForOfTrip(trip : Trip) -> [PayFor]{
        var tripPayFor: [PayFor] = []
        
        if let _payForsOfTravel = TripDAO.getPayForsOfATrip(trip: trip) {
            
            for p in _payForsOfTravel.allObjects as! [PayFor] {
                
                tripPayFor.append(p)
                
            }
        }
        return tripPayFor
        
    }
    
    
    static func delete(payFor: PayFor) {
        CoreDataManager.context.delete(payFor)
        self.save()
    }
    
}
