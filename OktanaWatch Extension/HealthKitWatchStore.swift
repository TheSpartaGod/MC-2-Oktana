//
//  HealthKitWatchStore.swift
//  OktanaWatch Extension
//
//  Created by Aqshal Wibisono on 17/06/21.
//

import Foundation
import HealthKit
class HealthKitWatchStore: NSObject, ObservableObject, HKLiveWorkoutBuilderDelegate{
    func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, didCollectDataOf collectedTypes: Set<HKSampleType>) {
        for type in collectedTypes{
            guard let quantityType = type as? HKQuantityType else{
                return
            }
            
            let stats = workoutBuilder.statistics(for: quantityType)
            //let label = labelForQuantityType(quantityType)
            DispatchQueue.main.async {
                
            }
            
        }
    }
    func updateForStatistics(_ statistics : HKStatistics?){
        guard let statistics = statistics else {return}
        DispatchQueue.main.async {
            switch statistics.quantityType{ //per tipe data yang diminta
            case HKQuantityType.quantityType(forIdentifier: .heartRate):
                let heartRateUnit = HKUnit.count().unitDivided(by: HKUnit.minute()) //convert heart rate count menjadi bpm
                self.heartRate =  statistics.mostRecentQuantity()?.doubleValue(for: heartRateUnit) ?? 0 //ambil value paling terakhir dari heartRateUnit
                self.averageHeartRate = statistics.averageQuantity()?.doubleValue(for: heartRateUnit) ?? 0
            case HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned):
                let energyUnit = HKUnit.kilocalorie()
                self.activeEnergy = statistics.sumQuantity()?.doubleValue(for: energyUnit) ?? 0
            default:
                print("something was wrong with parsing the health data")
                return
            }
        }
    }
    
    
    func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
        
    }
    
    
    
    static var shared = HealthKitWatchStore()
  
    var isWorkoutActive = false
    
    let healthStore = HKHealthStore()
    var session : HKWorkoutSession!
    var builder : HKLiveWorkoutBuilder!
    var heartRate : Double = 0
    var averageHeartRate : Double = 0
    var activeEnergy : Double = 0
    func getHealthKitStore() -> HKHealthStore {
        return healthStore
    }
    
    func authorizeHealthKit(){
        if !HKHealthStore.isHealthDataAvailable(){
            let healthKitTypes : Set = [HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!, HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!]
            healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { (success, error) in
                
            }
        }
    }
    func startWorkoutSession(){
        let configuration = HKWorkoutConfiguration()
       
        configuration.activityType = .kickboxing
        configuration.locationType = .indoor
        
        do {
            session = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
            builder = session.associatedWorkoutBuilder()
        } catch  {
            print(error)
            return
        }
        builder.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore, workoutConfiguration: configuration)
        session.delegate = self
        builder.delegate = self
        session.startActivity(with: Date())
        builder.beginCollection(withStart: Date()) { (success, error) in
            guard success else{
                
                print("errror")
                return
            }
        }
    }
    
    
}
extension HealthKitWatchStore : HKWorkoutSessionDelegate{
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        DispatchQueue.main.async {
            self.isWorkoutActive = toState == .running
        }
        if toState == .ended{
            builder.endCollection(withEnd: date) { (success,error) in
                self.builder.finishWorkout { (workout, error)  in
                    
                }
            }
        }
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        
    }
    
    
}

