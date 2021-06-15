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
                                movementIDGenerate: 13,
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
                                movementIDGenerate: 14,
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
                                costEPGenerate: 200),
                MovementGenerate(
                                movementIDGenerate: 15,
                                category: 2,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Plank Push Up",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Start in a plank position"),
                                    InstructionsGenerate(instructions: "2. Place down one hand at a time to lift up into a pushup position."),
                                    InstructionsGenerate(instructions: "3. Keep back straight and core tight"),
                                    InstructionsGenerate(instructions: "4. Move one arm at a time back into the plank position.")

                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 200),
                MovementGenerate(
                                movementIDGenerate: 12,
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
                MovementGenerate(
                                movementIDGenerate: 19,
                                category: 3,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: " ",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Lie on your back, legs straight and together."),
                                    InstructionsGenerate(instructions: "2. Keep your legs straight and lift them all the way up to the ceiling until your butt comes off the floor."),
                                    InstructionsGenerate(instructions: "3. Slowly lower your legs back down till they're just above the floor. Hold for a moment."),
                                    InstructionsGenerate(instructions: "4. Raise your legs back up. Repeat.")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),
                MovementGenerate(
                        movementIDGenerate: 20,
                        category: 3,
                        iconMovementGenerate: "",
                        animationMovementGenerate: [
                            AnimationGenerate(animationFrame: ""),
                            AnimationGenerate(animationFrame: "")
                        ],
                        namaMovementGenerate: "Flutter Kick",
                        instructionsGenerate: [
                            InstructionsGenerate(instructions: "1. Lie down on your back and place your hands under your glutes."),
                            InstructionsGenerate(instructions: "2. Keep your legs straight and raise your heels off the ground so they are roughly three inches off the ground."),
                            InstructionsGenerate(instructions: "3. Next, simply raise your right foot up several inches and then as you lower it down, raise your left foot up."),
                            InstructionsGenerate(instructions: "4. Alternate back and forth in a fluttering motion.")
                        ],
                        calorieBurnGenerate: 0,
                        costEPGenerate: 0),
                MovementGenerate(
                                movementIDGenerate: 21,
                                category: 3,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Scissors",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Lie down on your back with your hands either at your sides or underneath your glutes for added back support."),
                                    InstructionsGenerate(instructions: "2. Extend your legs out straight, then twist them in and out above each other, or straight up and down"),
                                    InstructionsGenerate(instructions: "3. Either way, don't let your legs drop to the mat as you're working through your reps.")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),
                MovementGenerate(
                                movementIDGenerate: 22,
                                category: 3,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Situp Alternating Hook",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Lie face-up on the ground with your knees bent and feet flat. Place your fingertips behind your ears with your elbows pointed out."),
                                    InstructionsGenerate(instructions: "2. Sit up and rotate your shoulders. Touch your right elbow to your left knee" ),
                                    InstructionsGenerate(instructions: "3.  Punch your hand by turning the core muscles and back, thereby swinging the arm, which is bent at an angle near or at 90 degrees, in a horizontal arc into the opponent. "),
                                    InstructionsGenerate(instructions: "4. Return to the starting position, and alternate sides.")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),
                MovementGenerate(
                                movementIDGenerate: 23,
                                category: 4,
                                iconMovementGenerate: "",
                                animationMovementGenerate: [
                                    AnimationGenerate(animationFrame: ""),
                                    AnimationGenerate(animationFrame: "")
                                ],
                                namaMovementGenerate: "Squat",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Stand straight with feet hip-width apart and your feet turned out slightly to open the hip joint "),
                                    InstructionsGenerate(instructions: "2. Lower your body until your thighs are parallel to the floor. "),
                                    InstructionsGenerate(instructions: "3. Pause, then return to the starting position."),
                                    InstructionsGenerate(instructions: "4. Repeat the movement")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0)
                    ]
}
// ini perubahan
