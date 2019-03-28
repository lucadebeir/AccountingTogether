//
//  Thumbnail+CoreDataProperties.swift
//  
//
//  Created by Luca Debeir on 28/03/2019.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Thumbnail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Thumbnail> {
        return NSFetchRequest<Thumbnail>(entityName: "Thumbnail")
    }

    @NSManaged public var id: Double
    @NSManaged public var imageData: Data?
    @NSManaged public var fullRes: FullRes?

}
