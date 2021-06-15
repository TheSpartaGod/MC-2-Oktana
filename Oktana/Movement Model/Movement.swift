//
//  Movement.swift
//  Oktana
//
//  Created by Gratianus Martin on 08/06/21.
//

import Foundation
 
struct MovementGenerate {
    var movementIDGenerate: Int
    var iconMovementGenerate: String
    var animationMovementGenerate: [AnimationGenerate]
    var namaMovementGenerate: String
    var instructionsGenerate:[InstructionsGenerate]
    var calorieBurnGenerate: Int
    var costEPGenerate: Int
    var category: Int
}

struct InstructionsGenerate {
    var instructions: String
}

struct AnimationGenerate {
    var animationFrame: String
}


struct Movements {
    var data = [MovementGenerate(
                    movementIDGenerate: 1,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0,
                                category: 0)
    ]
}
