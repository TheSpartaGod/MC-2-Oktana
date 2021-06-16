//
//  CoreDataManager.swift
//  Oktana
//
//  Created by Gratianus Martin on 09/06/21.
//

import Foundation
import CoreData

struct CoreDataManager {
    // MARK: - Config CoreData
    static var shared = CoreDataManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Oktana")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        if context.hasChanges{
            do {
                try context.save()
            } catch {
                let error = error as NSError
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    // MARK: - Func for Business Process
    
    // Call this function when the user open up the App for the first time to set all user data to 0
    func saveUser() -> User? {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        guard let userEntity = NSEntityDescription.entity(forEntityName: "User", in: context) else {
            return nil
        }
        
        let user = NSManagedObject(entity: userEntity, insertInto: context)
        user.setValue(0, forKey: "energy_points")
        user.setValue(0, forKey: "total_streaks")
        user.setValue(0, forKey: "weekly_goals")
        
        do {
            try context.save()
            return user as? User
        } catch {
            fatalError()
        }
    }
    
    
    //Call this function to get user data (energy points, total streaks, weekly goals)
    func fetchUser() -> User? {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        do {
            let user = try context.fetch(fetchRequest)
            return user.count == 0 ? nil : user[0] as? User
        } catch {
            print("could not fetch user \(error.localizedDescription)")
            return nil
        }
    }
    
    // Call this function when user unlocked a movement to add movement on the list
    func addMovementtoUser(user: User, movementID: Int){
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        guard let movementEntity = NSEntityDescription.entity(forEntityName: "Movement", in: context) else {
            return
        }
        
        let movementEntityObject = NSManagedObject(entity: movementEntity, insertInto: context)
        
        movementEntityObject.setValue(movementID, forKey: "movementId")
        
        movementEntityObject.setValue(user, forKey: "user")
        
        do {
            try context.save()
        } catch {
            fatalError()
        }
    }
    
    //Call this function when you need available movement list data
    func fetchAvailableMovement() -> [Movement]? {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movement")
        
        
        do{
            var availableMovements: [Movement] = []
            let movements = try context.fetch(fetchRequest)
            for move in movements as! [Movement] {
                availableMovements.append(move)
            }
            return availableMovements
        }catch {
            print("Could not fetch movement list \(error.localizedDescription)")
            return nil
        }
    }
    
    
    // Call this function when user completed a workout to save the W.data
    func addWorkouttoUser(user: User, time: Int, heart_rate: Int, calories: Int, date: Date){
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        guard let workoutEntity = NSEntityDescription.entity(forEntityName: "Workout", in: context) else {
            return
        }
        
        let workoutEntityObject = NSManagedObject(entity: workoutEntity, insertInto: context)
        
        workoutEntityObject.setValue(time, forKey: "totalTime")
        workoutEntityObject.setValue(calories, forKey: "totalCalories")
        workoutEntityObject.setValue(heart_rate, forKey: "avgHeartRate")
        workoutEntityObject.setValue(date, forKey: "date")
        
        workoutEntityObject.setValue(user, forKey: "user")
        
        do {
            try context.save()
        } catch {
            fatalError()
        }
    }
    
    
    //Call this function when you need all the workout data
    func fetchAllWorkoutData() -> [Workout]? {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Workout")
        
        
        do{
            var workoutData: [Workout] = []
            let workouts = try context.fetch(fetchRequest)
            for work in workouts as! [Workout] {
                workoutData.append(work)
            }
            return workoutData.count == 0 ? nil : workoutData
        }catch {
            print("Could not fetch movement list \(error.localizedDescription)")
            return nil
        }
    }
    
    
    //Call this function when the user completed fitness test to save fitness test data
    func addFitnesstoUser(user: User, cardio: Int, upperStrength: Int, coreStrength: Int, lowerStrength: Int){
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        guard let fitnessEntity = NSEntityDescription.entity(forEntityName: "Fitness", in: context) else {
            return
        }
        
        let fitnessEntityObject = NSManagedObject(entity: fitnessEntity, insertInto: context)
        
        fitnessEntityObject.setValue(cardio, forKey: "cardio")
        fitnessEntityObject.setValue(coreStrength, forKey: "coreStrength")
        fitnessEntityObject.setValue(lowerStrength, forKey: "lowerStrength")
        fitnessEntityObject.setValue(upperStrength, forKey: "upperStrength")
        
        fitnessEntityObject.setValue(user, forKey: "user")
        
        do {
            try context.save()
        } catch {
            fatalError()
        }
    }
    
    //Call this function to fetch all fitness test data
    func fetchAllFitnessData() -> [Fitness]? {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Fitness")
        
        do{
            var fitnessData: [Fitness] = []
            let fitnesses = try context.fetch(fetchRequest)
            for fit in fitnesses as! [Fitness] {
                fitnessData.append(fit)
            }
            return fitnessData.count == 0 ? nil : fitnessData
        }catch {
            print("Could not fetch fitness data \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchCurrentFitnessData() -> Fitness? {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Fitness")
        
        do{
            var fitnessData: [Fitness] = []
            let fitnesses = try context.fetch(fetchRequest)
            for fit in fitnesses as! [Fitness] {
                fitnessData.append(fit)
            }
            return fitnessData.count == 0 ? nil : fitnessData.last
        }catch {
            print("Could not fetch fitness data \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchPreviousFitnessData() -> Fitness? {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Fitness")
        
        do{
            var fitnessData: [Fitness] = []
            let fitnesses = try context.fetch(fetchRequest)
            for fit in fitnesses as! [Fitness] {
                fitnessData.append(fit)
            }
            return fitnessData.count == 1 || fitnessData.count == 0 ? nil : fitnessData[fitnessData.count - 2]
        }catch {
            print("Could not fetch fitness data \(error.localizedDescription)")
            return nil
        }
    }
}
