//
//  HealthKitWatchStore.swift
//  OktanaWatch Extension
//
//  Created by Aqshal Wibisono on 17/06/21.
//

import Foundation
import HealthKit
class HealthKitWatchStore: NSObject, ObservableObject{
   

   
  
    var isWorkoutActive = false
    
    let healthStore = HKHealthStore()
    var session : HKWorkoutSession!
    var builder : HKLiveWorkoutBuilder!
    @Published var heartRate : Double = 0
    @Published var averageHeartRate : Double = 0
    @Published var activeEnergy : Double = 0
    func getHealthKitStore() -> HKHealthStore {
        return healthStore
    }
    
    func authorizeHealthKit(){
       
            print("trying to authorize health kit")
        let healthKitTypesShare : Set = [
            HKObjectType.workoutType()]
        
            let healthKitTypesRead : Set = [HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!, HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!]
            healthStore.requestAuthorization(toShare: healthKitTypesShare, read: healthKitTypesRead) { (success, error) in
                if (error != nil){
                    print(error?.localizedDescription)
                }
                
            }
        
    }
    func startWorkoutSession(){
        let configuration = HKWorkoutConfiguration()
       
        configuration.activityType = .highIntensityIntervalTraining
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
                
                print(error?.localizedDescription)
                return
            }
        }
    }
    
    
}
extension HealthKitWatchStore : HKWorkoutSessionDelegate, HKLiveWorkoutBuilderDelegate{
    //func untuk check status workout
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
    //func untuk update metrics workout
    func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, didCollectDataOf collectedTypes: Set<HKSampleType>) {
        for type in collectedTypes{
            guard let quantityType = type as? HKQuantityType else{
                return
            }
            
            let stats = workoutBuilder.statistics(for: quantityType)
            updateForStatistics(stats)
            
        }
    }
    // update metrics menjadi statistic dari data tubuh yang diambil dari healthkit
    func updateForStatistics(_ statistics : HKStatistics?){
        guard let statistics = statistics else {return}
        DispatchQueue.main.async {
            switch statistics.quantityType{ //per tipe data yang diminta
            case HKQuantityType.quantityType(forIdentifier: .heartRate):
                let heartRateUnit = HKUnit.count().unitDivided(by: HKUnit.minute()) //convert heart rate count menjadi bpm
              self.heartRate =  statistics.mostRecentQuantity()?.doubleValue(for: heartRateUnit) ?? 0
                if let testRate = statistics.mostRecentQuantity()?.doubleValue(for: heartRateUnit){
                    print()
                    print("Heart rate: \(testRate)")
                }//ambil value paling terakhir dari heartRateUnit
                self.averageHeartRate = statistics.averageQuantity()?.doubleValue(for: heartRateUnit) ?? 0
            case HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned):
                let energyUnit = HKUnit.kilocalorie()
                self.activeEnergy = statistics.sumQuantity()?.doubleValue(for: energyUnit) ?? 0
                if let energyTest = statistics.sumQuantity()?.doubleValue(for: energyUnit) {
                    print("energy: \(energyTest)")
                }
            default:
                print("something was wrong with parsing the health data")
                return
            }
        }
    }
    func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
        
    }
    
    
}

