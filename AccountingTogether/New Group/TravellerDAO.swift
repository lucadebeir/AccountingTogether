//
//  TravellerDAO.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 31/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import CoreData

class TravellerDAO {
    
    static let request: NSFetchRequest<Traveller> = Traveller.fetchRequest()
    
    static func save() {
        CoreDataManager.save()
    }
    
    static func getAll() -> [Traveller]? {
        self.request.predicate = nil
        do {
            return try CoreDataManager.context.fetch(self.request)
        } catch {
            return nil
        }
    }
    
    /*static func create(withName: String, withImage: UIImage) throws -> Trip {
     
     let trip = Trip(context: CoreDataManager.context)
     
     trip.nameTrip = withName
     trip.imageTrip = withImage.pngData()
     CoreDataManager.save()
     return trip
     }*/
    
    /*func edit(withName: String) throws {
     self.nameTrip = withName
     do{
     try CoreDataManager.save()
     }catch let error as NSError{
     throw error
     }
     }*/
    
    static func delete(traveller: Traveller) {
        CoreDataManager.context.delete(traveller)
        self.save()
    }
    
}
