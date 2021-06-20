//
//  MovementQueue.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 13/06/21.
//

import Foundation

struct MovementQueue{
    static var MovementList  = Movements()
    static var isBreak : Bool = false
    static var testRecord : [Int] = []
    //static var testNumber = 0
    static var selectedMoves : [[Int]] = [[],[],[],[]] // untuk dimasukkin di movement list
    static var selectedMovesList : [Int] = [] //untuk dimasukkin di workout MODE
    static var currentWorkoutPosition : Int = 0
    static var totalTimerActive: Bool = false
    static var currentTotalTime : Int = 0
    static var currentSet : Int = 0
    static var workoutHasStarted : Bool = false
    static var isTest : Bool = false
    static var heartRate : Int = 0
    static var totalKcal : Int = 0
    static var demoMode : Bool = true //JANGAN LUPA DEMO MODE DI DISABLE KALO MAU KE TESTFLIGHT
    static func secondsToMinutesSeconds (seconds : Int) -> (Int, Int) {
        return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    static func calculateEnergy() -> Int{
            let (m,s) = MovementQueue.secondsToMinutesSeconds(seconds: MovementQueue.currentTotalTime)
            let energyPoint : Int = m * 2
            return energyPoint

        }
    static func queueMovementList(){
        //Set as static var biar cuman 1x doang ke generate dan ga berubah.
        //edit MovementQueue variable utk set ke core data
        //fetch available movements
        if demoMode == false{
            var movements = CoreDataManager.shared.fetchAvailableMovement()!
            //store id from available movement to array
            var movementID : [Int] = []
            for id in movements{
                movementID.append(Int(id.movementId))
            }
            for i in MovementList.data{
                for j in 1...4{//input selected moves ke per category
                    if i.category == j && movementID.contains(i.movementIDGenerate) &&  !MovementQueue.selectedMoves[j-1].contains(i.movementIDGenerate){// check apakah id ada di available movement arrayu
                        selectedMoves[j-1].append(i.movementIDGenerate)
                        selectedMovesList.append(i.movementIDGenerate)
                        
                    }
            
                }
                
            }
          
            //MARK: Randomize movements
            //metodenya adalah shuffle list yang diatas, terus remove index terakhir sampe batas tertentu
            for i in 0...3{
                selectedMoves[i].shuffle()//shuffle entry di tiap2 kategori
                for _ in selectedMoves[i]{
                    if selectedMoves[i].count > 2{//remove index terakhir kalo count masih lebih dari 2
                        if let removeItemIndex : Int = selectedMovesList.firstIndex(of: selectedMoves[i].last!){
                            selectedMovesList.remove(at: removeItemIndex)
                        }
                        selectedMoves[i].remove(at: selectedMoves[i].count - 1)
                        
                    }
                }
                selectedMoves[i].sort()
                
            }
            selectedMovesList.sort()
           
        }else{
            //DEMO MOVES
            selectedMoves = [[9,10] ,[7, 8],[18, 20],[3, 4]]
            
            selectedMovesList = [3, 4, 7, 8, 9, 10, 18, 20]
        }
        
    }
    static func queueFitnessList(){
        MovementQueue.isTest = true
        var movements = CoreDataManager.shared.fetchAvailableMovement()
        selectedMoves = [[9],[12],[18],[23]]
        selectedMovesList = [9, 12, 18, 23]
        
    }
    
    static func dequeueMovementList(){// only call this when u are sure the workout is done
        MovementQueue.selectedMoves = [[],[],[],[]]
        MovementQueue.selectedMovesList = []
        MovementQueue.totalTimerActive = false
        MovementQueue.currentWorkoutPosition = 0
        MovementQueue.isBreak = false
        MovementQueue.currentTotalTime = 0
        MovementQueue.workoutHasStarted = false
        MovementQueue.isTest = false
        MovementQueue.heartRate = 0
        MovementQueue.totalKcal = 0
        MovementQueue.testRecord = []
        
        
        
    }
    
    
}
