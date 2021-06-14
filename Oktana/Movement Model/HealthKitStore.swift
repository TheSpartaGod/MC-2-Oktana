//
//  healthKit.swift
//  Oktana
//
//  Created by Gratianus Martin on 09/06/21.
//

import Foundation
import HealthKit

struct HealthKitStore{
    static var shared = HealthKitStore()
    private init() {}
    
    let healthStore = HKHealthStore()
    
    func getHealthKitStore() -> HKHealthStore {
        return healthStore
    }

}
