//
//  TripExtension.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 23/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Trip {
    
    public var title : String { return self.nameTrip ?? "" }
    
    public var end : Date? {
        get{ return (self.dateEndTrip as Date?) }
        set{ self.dateEndTrip = (newValue as Date?) }
    }
    
    public var beginning : Date? {
        get{ return (self.dateBeginTrip as Date?) }
    }
    
    convenience init(t : String, i : UIImage){
        self.init(context: CoreDataManager.context)
        self.nameTrip = t
        self.imageTrip = i.pngData()
    }
    
}
