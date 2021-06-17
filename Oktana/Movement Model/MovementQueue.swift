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
    static var cardioNum : Int = 0
    
    static var selectedMoves : [[Int]] = [[],[],[],[]] // untuk dimasukkin di movement list
    static var selectedMovesList : [Int] = [] //untuk dimasukkin di workout MODE
    static var currentWorkoutPosition : Int = 0
    static var totalTimerActive: Bool = false
    static var currentTotalTime : Int = 0
    static var currentSet : Int = 0
    var isTest : Bool = false
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
        
    }
    static func queueFitnessList(){
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
        
    }
    
    
}
