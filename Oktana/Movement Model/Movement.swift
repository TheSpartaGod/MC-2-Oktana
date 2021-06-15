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
}

struct InstructionsGenerate {
    var instructions: String
}

struct AnimationGenerate {
    var animationFrame: String
}


struct Movements {
    var data = [MovementGenerate(
                    movementIDGenerate: 0,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Push Up",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 1,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Inchworm",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 2,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Jab Straight",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 3,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Alternate Hook",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 4,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Alternate Uppercut",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 5,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Jab Straight Hook Uppercut",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 6,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Jab Uppercut Hook Straight",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 7,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Sit Up Jab Straight",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 8,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Sit Up Hook",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 9,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Leg Raise",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 10,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Flutter Kick",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 11,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Scissors",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 12,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Mountain Climber",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 13,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Squat Front Kick",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 14,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Squat Side Kick",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 15,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Lunges Front Kick",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 16,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Alternating Reverse Lunges",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 17,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Jump Squat",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 18,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Alternating High Knee",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 19,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Alternating Front Kick",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 20,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Alternating Roundhouse Kick",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 21,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Jumping Jack",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 22,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Side to Side Shuffle",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
                MovementGenerate(
                    movementIDGenerate: 23,
                                 iconMovementGenerate: "",
                                 animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                 ],
                                 namaMovementGenerate: "Burpees",
                                 instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                 ],
                                 calorieBurnGenerate: 0,
                                 costEPGenerate: 0),
    ]
}
