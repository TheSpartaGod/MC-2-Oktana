//
//  MovementQueue.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 13/06/21.
//

import Foundation
import CoreData
struct MovementQueue{
    
    static var currentUserInitialized : Bool = false
    static var selectedMoves : [[Int]] = [[],[],[],[]] // untuk dimasukkin di movement list
    static var selectedMovesList : [Int] = [] //untuk dimasukkin di workout MODE
    
    static var currentWorkoutPosition : Int = 0
    static var totalTimerActive: Bool = false
    static var currentTotalTime : Int = 0
    static var MovementList  = Movements()
    static var isBreak : Bool = false
    static func secondsToMinutesSeconds (seconds : Int) -> (Int, Int) {
      return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    static func calculateEnergy() -> Int{
        let (m,s) = MovementQueue.secondsToMinutesSeconds(seconds: MovementQueue.currentTotalTime)
        let energyPoint : Int = m * 2
        return energyPoint
        
    }
    static func dequeueMovementList(){// only call this when u are sure the workout is done
        MovementQueue.selectedMoves = [[],[],[],[]]
        MovementQueue.selectedMovesList = []
        MovementQueue.totalTimerActive = false
        MovementQueue.currentWorkoutPosition = 0
        MovementQueue.isBreak = false
        MovementQueue.currentTotalTime = 0
        
    }
    static func queueMovementList(){
        //Set as static var biar cuman 1x doang ke generate dan ga berubah.
        //edit MovementQueue variable utk set ke core data
        for i in MovementList.data{
            for j in 1...4{//input selected moves ke per category
                if i.category == j && !MovementQueue.selectedMoves[j-1].contains(i.movementIDGenerate){
                    selectedMoves[j-1].append(i.movementIDGenerate)
                    selectedMovesList.append(i.movementIDGenerate)
                    
                }
                
                
                selectedMoves[j-1].sort()
            }
        
        }
        selectedMovesList.sort()
  
        print(MovementQueue.selectedMoves)
        print(MovementQueue.selectedMovesList)
        
       
    }
    
    
}
