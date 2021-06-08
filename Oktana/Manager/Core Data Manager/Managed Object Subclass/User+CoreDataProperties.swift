//
//  User+CoreDataProperties.swift
//  Oktana
//
//  Created by Gratianus Martin on 09/06/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var energy_points: Int64
    @NSManaged public var weekly_goals: Int64
    @NSManaged public var total_streaks: Int64
    @NSManaged public var movement: NSSet?
    @NSManaged public var workout: NSSet?

}

// MARK: Generated accessors for movement
extension User {

    @objc(addMovementObject:)
    @NSManaged public func addToMovement(_ value: Movement)

    @objc(removeMovementObject:)
    @NSManaged public func removeFromMovement(_ value: Movement)

    @objc(addMovement:)
    @NSManaged public func addToMovement(_ values: NSSet)

    @objc(removeMovement:)
    @NSManaged public func removeFromMovement(_ values: NSSet)

}

// MARK: Generated accessors for workout
extension User {

    @objc(addWorkoutObject:)
    @NSManaged public func addToWorkout(_ value: Workout)

    @objc(removeWorkoutObject:)
    @NSManaged public func removeFromWorkout(_ value: Workout)

    @objc(addWorkout:)
    @NSManaged public func addToWorkout(_ values: NSSet)

    @objc(removeWorkout:)
    @NSManaged public func removeFromWorkout(_ values: NSSet)

}

extension User : Identifiable {

}
