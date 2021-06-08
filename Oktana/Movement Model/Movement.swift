//
//  Movement.swift
//  Oktana
//
//  Created by Gratianus Martin on 08/06/21.
//

import Foundation
 
struct MovementGenerate {
    var movementIDGenerate: String
    var iconMovementGenerate: String
    var animationMovementGenerate: [AnimationGenerate]
    var namaMovementGenerate: String
    var instructionsGenerate:[InstructionsGenerate]
    var calorieBurnGenerat: Int
    var costEPGenerate: Int
}

struct InstructionsGenerate {
    var instructions: String
}

struct AnimationGenerate {
    var animationFrame: String
}


struct Movements {
    var data = [MovementGenerate(
                    movementIDGenerate: "01",
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
                                 calorieBurnGenerat: 0,
                                 costEPGenerate: 0)
    ]
}
