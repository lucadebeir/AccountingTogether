//
//  Thumbnail+CoreDataProperties.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 28/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//
//

import Foundation
import CoreData


extension Thumbnail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Thumbnail> {
        return NSFetchRequest<Thumbnail>(entityName: "Thumbnail")
    }

    @NSManaged public var id: Double
    @NSManaged public var imageData: NSData?
    @NSManaged public var fullRes: FullRes?

}
