//
//  RepaymentExtension.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 26/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//


import Foundation
import CoreData

extension Repayment {
    
    static func getAll() throws -> [Repayment] {
        let request: NSFetchRequest<Repayment> = Repayment.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "nameRepayment", ascending: true)]
        do {
            let repayments: [Repayment] = try CoreDataManager.context.fetch(request)
            return repayments
        } catch let error as NSError {
            throw error
        }
    }
    
    static func create(withName: String) throws -> Repayment {
        
        let repayment = Repayment(context: CoreDataManager.context)
        
        /// nom du contactPerso
        repayment.nameRepayment = withName
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            throw error
        }
        return repayment
    }
    
    func edit(withName: String) throws {
        /// nom du contactPerso
        self.nameRepayment = withName
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
