//
//  Fitness+CoreDataProperties.swift
//  Oktana
//
//  Created by Gratianus Martin on 09/06/21.
//
//

import Foundation
import CoreData


extension Fitness {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Fitness> {
        return NSFetchRequest<Fitness>(entityName: "Fitness")
    }

    @NSManaged public var cardio: Int64
    @NSManaged public var upperStrength: Int64
    @NSManaged public var coreStrength: Int64
    @NSManaged public var lowerStrength: Int64
    @NSManaged public var user: User?

}

extension Fitness : Identifiable {

}
