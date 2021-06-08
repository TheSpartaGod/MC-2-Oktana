//
//  Movement+CoreDataProperties.swift
//  Oktana
//
//  Created by Gratianus Martin on 09/06/21.
//
//

import Foundation
import CoreData


extension Movement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movement> {
        return NSFetchRequest<Movement>(entityName: "Movement")
    }

    @NSManaged public var movementId: String?
    @NSManaged public var user: User?

}

extension Movement : Identifiable {

}
