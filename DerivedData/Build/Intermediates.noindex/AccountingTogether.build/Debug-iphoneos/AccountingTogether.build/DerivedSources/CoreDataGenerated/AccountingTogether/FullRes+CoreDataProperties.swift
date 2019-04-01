//
//  FullRes+CoreDataProperties.swift
//  
//
//  Created by Luca Debeir on 31/03/2019.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension FullRes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FullRes> {
        return NSFetchRequest<FullRes>(entityName: "FullRes")
    }

    @NSManaged public var imageData: Data?
    @NSManaged public var thumbnail: Thumbnail?

}
