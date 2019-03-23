//
//  TripExtension.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 23/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import CoreData

extension Trip {
    
    static func getAll() throws -> [Trip] {
        let request: NSFetchRequest<Trip> = Trip.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "nameTrip", ascending: true)]
        do {
            let trip: [Trip] = try CoreDataManager.context.fetch(request)
            return trip
        } catch let error as NSError {
            throw error
        }
    }
    
    static func create(withName: String) throws -> Trip {
        
        let trip = Trip(context: CoreDataManager.context)
        
        /// nom du contactPerso
        trip.nameTrip = withName
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return trip
    }
    
    func edit(withName: String) throws {
        /// nom du contactPerso
        self.nameTrip = withName
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    
}
