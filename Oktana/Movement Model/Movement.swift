//
//  Movement.swift
//  Oktana
//
//  Created by Gratianus Martin on 08/06/21.
//

import Foundation
 
struct MovementGenerate {
    var movementIDGenerate: Int
    var category: Int
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

/*
 1. Jab & Straight
 2. Hook & Uppercut
 3. Roundhouse Kick
 4. Knee
 5. Side Kick
 6. Front Kick
 7. Elbow
 8. Superman Punch
 */
struct Movements {
    var data = [
                MovementGenerate(
                                movementIDGenerate: 1,
                                category: 2,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Jab & Cross",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Stand in fight stance, feet slightly wider than shoulder-width apart with the left foot in front and fists protecting face."),
                                    InstructionsGenerate(instructions: "2. Extend left hand forward with control, rotating palm to face down."),
                                    InstructionsGenerate(instructions: "3. Snap left arm back to starting position."),
                                    InstructionsGenerate(instructions: "4. Rotate right hip forward and pivot on right foot until heel comes off the ground, shifting weight forward and extending right arm forward to punch, rotating palm to face down."),
                                    InstructionsGenerate(instructions: "5. Back to fight stance again")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),
                MovementGenerate(
                                movementIDGenerate: 2,
                                category: 2,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Hook & Uppercut",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Stand in fight stance"),
                                    InstructionsGenerate(instructions: "2. Bend left arm at 90-degree angle and swing, pivot rear heel when throwing punch"),
                                    InstructionsGenerate(instructions: "3. Snap left arm back to face again"),
                                    InstructionsGenerate(instructions: "4. Rotate right hip forward, pivot on ball of right foot, loop and swing right."),
                                    InstructionsGenerate(instructions: "5. Back to fight stance again"),
      
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 100),
                MovementGenerate(
                                movementIDGenerate: 3,
                                category: 4,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Roundhouse Kick",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Stand in fight stance"),
                                    InstructionsGenerate(instructions: "2. Twist the hip and bring your left to aim"),
                                    InstructionsGenerate(instructions: "3. Dtraighten your leg by extending your knee and hips. "),
                                    InstructionsGenerate(instructions: "4. Back to fight stance again.")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 120),
                MovementGenerate(
                                movementIDGenerate: 4,
                                category: 4,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Knee",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Stand in fight stance"),
                                    InstructionsGenerate(instructions: "2. Throw the knee diagonally, throw the arm down that is the same side as your knee and lean your body back."),
                                    InstructionsGenerate(instructions: "3. Back to fight stance again.")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 120),
                MovementGenerate(
                                movementIDGenerate: 5,
                                category: 4,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Side Kick",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Stand in fight stance"),
                                    InstructionsGenerate(instructions: "2. Lift the knee on your front leg"),
                                    InstructionsGenerate(instructions: "3. Fully extends your leg"),
                                    InstructionsGenerate(instructions: "4. Bend your knee again and place it on the ground.")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 150),
                MovementGenerate(
                                movementIDGenerate: 6,
                                category: 4,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Front Kick",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Stand in fight stance"),
                                    InstructionsGenerate(instructions: "2. Lift the knee on your front leg"),
                                    InstructionsGenerate(instructions: "3. Fully extends your leg")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 150),
                MovementGenerate(
                                movementIDGenerate: 7,
                                category: 2,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Elbow",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Start in fight stance"),
                                    InstructionsGenerate(instructions: "2. Lift and fully bend your arm then"),
                                    InstructionsGenerate(instructions: "3. Swing your arm, pivot rear heel when throwing punch"),
                                    InstructionsGenerate(instructions: "3. Back to fight stance again"),
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 180),
                MovementGenerate(
                                movementIDGenerate: 8,
                                category: 4,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Superman Punch",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Start in fight stance"),
                                    InstructionsGenerate(instructions: "2. Lift up your leg like you want to do a front kick"),
                                    InstructionsGenerate(instructions: "3. Throw a punch while slide to the front")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 200),
                MovementGenerate(
                                movementIDGenerate: 9,
                                category: 2,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Push Up",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Get down on all fours, placing your hands slightly wider than your shoulders."),
                                    InstructionsGenerate(instructions: "2. Straighten your arms and legs."),
                                    InstructionsGenerate(instructions: "3. Lower your body until your chest nearly touches the floor."),
                                    InstructionsGenerate(instructions: "4. Push youself back up.")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 200),
                MovementGenerate(
                                movementIDGenerate: 10,
                                category: 2,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Inchworm",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: ""),
                                    InstructionsGenerate(instructions: "")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 200),
    ]
}
