//
//  MovementQueue.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 13/06/21.
//

import Foundation

struct MovementQueue{
   static var data = [MovementGenerate(
                    movementIDGenerate: 0,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Side Jab",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: "sidejab1"),
                                    InstructionsGenerate(instructions: "sidejab2")
                                 ],
                                 calorieBurnGenerate: 80,
                                 costEPGenerate: 120,
                                category: 0),
                        
                                
                MovementGenerate(
                                movementIDGenerate: 1,
                                             iconMovementGenerate: "",
                                             animationMovementGenerate: [
                                                AnimationGenerate(animationFrame: ""),
                                                AnimationGenerate(animationFrame: "")
                                             ],
                                             namaMovementGenerate: "Squat",
                                             instructionsGenerate: [
                                                InstructionsGenerate(instructions: "do squats 1"),
                                                InstructionsGenerate(instructions: "do squat2 ")
                                             ],
                                             calorieBurnGenerate: 80,
                                             costEPGenerate: 140,
                                            category: 1),
                MovementGenerate(
                                movementIDGenerate: 2,
                                             iconMovementGenerate: "",
                                             animationMovementGenerate: [
                                                AnimationGenerate(animationFrame: ""),
                                                AnimationGenerate(animationFrame: "")
                                             ],
                                             namaMovementGenerate: "Pushup",
                                             instructionsGenerate: [
                                                InstructionsGenerate(instructions: "do pushup 1"),
                                                InstructionsGenerate(instructions: "do pushup2 ")
                                             ],
                                             calorieBurnGenerate: 80,
                                             costEPGenerate: 140,
                                            category: 3),
                MovementGenerate(
                                movementIDGenerate: 3,
                                             iconMovementGenerate: "",
                                             animationMovementGenerate: [
                                                AnimationGenerate(animationFrame: ""),
                                                AnimationGenerate(animationFrame: "")
                                             ],
                                             namaMovementGenerate: "Kick",
                                             instructionsGenerate: [
                                                InstructionsGenerate(instructions: "do kick1"),
                                                InstructionsGenerate(instructions: "do kick2 ")
                                             ],
                                             calorieBurnGenerate: 80,
                                             costEPGenerate: 140,
                                            category: 3)

                
    ]
    static var selectedMoves : [[Int]] = [[],[],[],[]] // untuk dimasukkin di movement list
    static var selectedMovesList : [Int] = [] //untuk dimasukkin di workout MODE
    static var currentWorkoutPosition : Int = 0
    static var totalTimerActive: Bool = false
    static var currentTotalTime : Int = 0
    static func secondsToMinutesSeconds (seconds : Int) -> (Int, Int) {
      return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    static func queueMovementList(){
        //Set as static var biar cuman 1x doang ke generate dan ga berubah.
        //edit MovementQueue variable utk set ke core data
        for i in MovementQueue.data{
            for j in 0...3{//input selected moves ke per category
                if i.category == j && !MovementQueue.selectedMoves[j].contains(i.movementIDGenerate){
                    selectedMoves[j].append(i.movementIDGenerate)
                    selectedMovesList.append(i.movementIDGenerate)
                  
                    
                }
                selectedMoves[j].sort()
            }
        
        }
        selectedMovesList.sort()
        /*
        for i in 0...3{
            for j in 0..<MovementQueue.data.count{
                let selectedMoveID = Int.random(in: 0..<MovementQueue.data.count)
               
                    if !MovementQueue.selectedMoves[i].contains(selectedMoveID) && MovementQueue.data[j].category == i {
                        MovementQueue.selectedMoves[i].append(selectedMoveID)
                    }
               
               
            }
                selectedMoves[i].sort(by: <)
            }*/
       
      
        
        print(MovementQueue.selectedMoves)
        print(MovementQueue.selectedMovesList)
        
       
    }
    
    
}
