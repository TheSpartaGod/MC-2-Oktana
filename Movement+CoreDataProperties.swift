//
//  Movement+CoreDataProperties.swift
//  Oktana
//
//  Created by Gratianus Martin on 14/06/21.
//
//

import Foundation
import CoreData


extension Movement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movement> {
        return NSFetchRequest<Movement>(entityName: "Movement")
    }

    @NSManaged public var movementId: Int64
    @NSManaged public var user: User?

}

extension Movement : Identifiable {

}
