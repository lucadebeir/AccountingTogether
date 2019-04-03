//
//  TripDAO.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 31/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import CoreData

class TripDAO {
    
    static let request: NSFetchRequest<Trip> = Trip.fetchRequest()
    
    static func save() {
        CoreDataManager.save()
    }
    
    static func getAll() -> [Trip]? {
        //self.request.sortDescriptors = [NSSortDescriptor(key: "nameTrip", ascending: true)]
        self.request.predicate = nil
        do {
            return try CoreDataManager.context.fetch(self.request)
        } catch {
            return nil
        }
    }
    
    static func getTravellersOfATrip(trip : Trip) -> NSSet?{
        return trip.isComposedBy
    }
    
    static func getPayForsOfATrip(trip : Trip) -> NSSet?{
        return trip.contain
    }
    
    static func delete(trip: Trip) {
        CoreDataManager.context.delete(trip)
        self.save()
    }
    
}
