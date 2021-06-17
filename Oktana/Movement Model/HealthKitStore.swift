//
//  healthKit.swift
//  Oktana
//
//  Created by Gratianus Martin on 09/06/21.
//

import Foundation
import HealthKit

class HealthKitStore{
    static var shared = HealthKitStore()
    private init() {}
    
    let healthStore = HKHealthStore()
    var heartRate : HKQuantityType!
    func getHealthKitStore() -> HKHealthStore {
        return healthStore
    }
    func getHeartRate()  {
       heartRate = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        healthStore.requestAuthorization(toShare: [heartRate], read: nil) { success, Error in
            if success{
             
                
            }
            else{
                print("Failed to get heart rate data")
            }
        }
    }

}
