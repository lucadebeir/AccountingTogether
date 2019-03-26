//
//  Traveller.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import CoreData

extension Traveller {
    
    static func getAll() throws -> [Traveller] {
        let request: NSFetchRequest<Traveller> = Traveller.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "nameTraveller", ascending: true)]
        do {
            let travellers: [Traveller] = try CoreDataManager.context.fetch(request)
            return travellers
        } catch let error as NSError {
            throw error
        }
    }
    
    static func create(withName: String) throws -> Traveller {
        
        let traveller = Traveller(context: CoreDataManager.context)
        
        /// nom du contactPerso
        traveller.lastNameTraveller = withName
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return traveller
    }
    
    func edit(withName: String) throws {
        /// nom du contactPerso
        self.lastNameTraveller = withName
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    
    func delete() throws {
        do{
            CoreDataManager.context.delete(self)
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
    }
    
}
