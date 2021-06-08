//
//  Workout+CoreDataProperties.swift
//  Oktana
//
//  Created by Gratianus Martin on 09/06/21.
//
//

import Foundation
import CoreData


extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var totalTime: Int64
    @NSManaged public var avgHeartRate: Int64
    @NSManaged public var totalCalories: Int64
    @NSManaged public var date: Date?
    @NSManaged public var user: User?

}

extension Workout : Identifiable {

}
