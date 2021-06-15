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
 Skill
 1. Jab & Cross -> self, situp jab cross
 2. Hook & Uppercut -> alternating hook, alternating uppercut, jab cross hook uppercut, situp alternating hook
 3. Roundhouse Kick -> alternating roundhouse kick
 4. Knee -> alternating knee
 5. Side Kick -> self, squat side kick
 6. Front Kick -> alternating front kick(self)
 7. Elbow -> alternating elbow(self)
 8. Superman Punch -> self
 
 Core
 
 9. Jumping Jack
 10. Mountain Climber
 11. Burpees
 
 Upper Body Exercise
 12. Pushup
 13. Inchworm
 14. Plank Pushup
 
 (unlock)
 15. Alternating Hook
 16. Alternating Uppercut
 17. Jab Cross Hook Uppercut

 Core
 18. Situp Jab Straight
 19. Leg Raise
 20. Flutter Kick
 21. Scissors
 
 (unlock)
 22. Situp Alternating Hook
 
 Lower Body Exercise
 23. Squat
 24. Lunges
 25. Jump Squat
 
 (unlock)
 26. Squat Roundhouse Kick
 27. Back Lunges front kick
 28. Squat Side Kick
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
                                    InstructionsGenerate(instructions: "4. Rotate right hip forward, pivot on ball of right foot, loop and swing right hand up."),
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
                                category: 2,
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
                                category: 1,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Jumping Jack",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Stand upright with your legs together, arms at your sides."),
                                    InstructionsGenerate(instructions: "2. Bend your knees slightly, and jump into the air."),
                                    InstructionsGenerate(instructions: "3. As you jump, spread your legs to be about shoulder-width apart. Stretch your arms out and over your head."),
                                    InstructionsGenerate(instructions: "4. Jump back to starting position.")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),
                MovementGenerate(
                                movementIDGenerate: 10,
                                category: 1,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Mountain Climber",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Start from a high plank position with your hands stacked directly under your shoulders."),
                                    InstructionsGenerate(instructions: "2. Drive one knee forward toward your chest while engaging your abs."),
                                    InstructionsGenerate(instructions: "3. Return to your plank position, then drive the knee of your opposite foot in. Repeat the movement, alternating legs and speeding up your movements.")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 200),
                MovementGenerate(
                                movementIDGenerate: 11,
                                category: 2,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Burpees",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Start in a squat position with your knees bent, back straight, and your feet about shoulder-width apart."),
                                    InstructionsGenerate(instructions: "2. Lower your hands to the floor in front of you so they’re just inside your feet."),
                                    InstructionsGenerate(instructions: "3. With your weight on your hands, kick your feet back so you’re on your hands and toes, and in a pushup position."),
                                    InstructionsGenerate(instructions: "4. Keeping your body straight from head to heels, do one pushup. Remember not to let your back sag or to stick your butt in the air."),
                                    InstructionsGenerate(instructions: "5. Do a frog kick by jumping your feet back to their position."),
                                    InstructionsGenerate(instructions: "6. Stand and reach your arms over your head."),
                                    InstructionsGenerate(instructions: "7. Jump quickly into the air so you land back where you started."),
                                    InstructionsGenerate(instructions: "8. As soon as you land with knees bent, get into a squat position and do another repetition.")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),
                MovementGenerate(
                                movementIDGenerate: 12,
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
                                costEPGenerate: 0),
                MovementGenerate(
                                movementIDGenerate: 13,
                                category: 2,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Inchworm",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Stand tall then reach your hands toward the floor in front of your feet. Allow your knees to bend slightly as needed."),
                                    InstructionsGenerate(instructions: "2. Place your hands on the floor and walk your hand forward, one at a time until a full plank position. Keep your legs relatively straight."),
                                    InstructionsGenerate(instructions: "3. Return to standing by walk your hand back.")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),
                MovementGenerate(
                                movementIDGenerate: 14,
                                category: 2,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Plank Push Up",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Start in a plank position"),
                                    InstructionsGenerate(instructions: "2. Place down one hand at a time to lift up into a push up position."),
                                    InstructionsGenerate(instructions: "3. Keep back straight and core tight."),
                                    InstructionsGenerate(instructions: "4. Move one arm at a time back into the plank position."),

                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),
                MovementGenerate(
                                movementIDGenerate: 15,
                                category: 2,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Alternating Hook",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Stand in fight stance"),
                                    InstructionsGenerate(instructions: "2. Bend left arm at 90-degree angle and swing, pivot rear heel when throwing punch"),
                                    InstructionsGenerate(instructions: "3. Snap left arm back to face again"),
                                    InstructionsGenerate(instructions: "4. Do it with your other arm and repeat")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),
                MovementGenerate(
                                movementIDGenerate: 16,
                                category: 2,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Alternating Uppercut",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Stand in fight stance"),
                                    InstructionsGenerate(instructions: "4. Rotate right hip forward, pivot on ball of right foot, loop and swing right hand up."),
                                    InstructionsGenerate(instructions: "5. Back to fight stance again and do it with your other arm."),
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),
                MovementGenerate(
                                movementIDGenerate: 17,
                                category: 2,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Jab Cross Hook Uppercut",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Stand in fight stance"),
                                    InstructionsGenerate(instructions: "2. Do a jab followed by a cross, hook and then uppercut"),
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),
                MovementGenerate(
                                movementIDGenerate: 18,
                                category: 3,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Sit Up Jab Straight",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Lie down on your back and bend your legs to stabilize your lower body."),
                                    InstructionsGenerate(instructions: "2. Cross your hands to opposite shoulders or place them behind your ears, without pullling on your neck."),
                                    InstructionsGenerate(instructions: "3. Curl your upper body all the way up toward your knees. Exhale as you lift."),
                                    InstructionsGenerate(instructions: "4. Do a jab and cross, slowly lower yourself down, returning to your starting point. Inhale as you lower.")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0)
            ]
}
