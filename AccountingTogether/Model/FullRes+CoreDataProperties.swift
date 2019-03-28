//
//  FullRes+CoreDataProperties.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 28/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//
//

import Foundation
import CoreData


extension FullRes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FullRes> {
        return NSFetchRequest<FullRes>(entityName: "FullRes")
    }

    @NSManaged public var imageData: NSData?
    @NSManaged public var thumbnail: Thumbnail?

}
