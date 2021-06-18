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
    var animationMovementGenerate: String
    var namaMovementGenerate: String
    var instructionsGenerate:[InstructionsGenerate]
    var calorieBurnGenerate: Int
    var costEPGenerate: Int
 
}

struct InstructionsGenerate {
    var instructions: String
}

struct fitnessProgressGenerate {
    var title: String
    var benchmark: Float
    var currentTestData: Int?
    var previousTestData: Int?
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
                                iconMovementGenerate: "Jab & cross",
                                animationMovementGenerate: "1.jabCross",
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
                                iconMovementGenerate: "Hook Uppercut",
                                animationMovementGenerate: "2.hookUppercut",
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
                                iconMovementGenerate: "Roundhouse kick",
                                animationMovementGenerate: "3.roundhouseKick",
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
                                iconMovementGenerate: "Knee",
                                animationMovementGenerate: "4.knee",
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
                                iconMovementGenerate: "Side kick",
                                animationMovementGenerate: "5.sideKick",
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
                                iconMovementGenerate: "Front kick",
                                animationMovementGenerate: "6.frontKick",
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
                                iconMovementGenerate: "Elbow",
                                animationMovementGenerate: "7.elbow",
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
                                iconMovementGenerate: "Superman Punch",
                                animationMovementGenerate: "8.supermanPunch",
                                namaMovementGenerate: "Superman Punch",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Start in fight stance"),
                                    InstructionsGenerate(instructions: "2. Lift up your leg like you want to do a front kick"),
                                    InstructionsGenerate(instructions: "3. Throw a punch while slide in to the front")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 200),
                MovementGenerate(
                                movementIDGenerate: 9,
                                category: 1,
                                iconMovementGenerate: "Jumping Jacks",
                                animationMovementGenerate: "9.jumpingJack",
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
                                iconMovementGenerate: "Mountain Climber",
                                animationMovementGenerate: "10.mountainClimber",
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
                                iconMovementGenerate: "Burpees",
                                animationMovementGenerate: "11.burpees",
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
                                iconMovementGenerate: "Push Up",
                                animationMovementGenerate: "12.pushUp",
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
                                iconMovementGenerate: "Inchworm",
                                animationMovementGenerate: "13.inchWorm",
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
                                iconMovementGenerate: "Plank Pushup",
                                animationMovementGenerate: "14.plankToPushUp",
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
                                iconMovementGenerate: "Alternating hook",
                                animationMovementGenerate: "15.alternatingHook",
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
                                iconMovementGenerate: "Alternating Uppercut",
                                animationMovementGenerate: "16.alternatingUppercut",
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
                                iconMovementGenerate: "Jab Cross Hook Upper Cut",
                                animationMovementGenerate: "17.jabCrossHookUppercut",
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
                                iconMovementGenerate: "sit up jab straight",
                                animationMovementGenerate: "18.sitUpJabCross",
                                namaMovementGenerate: "Sit Up Jab Straight",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Lie down on your back and bend your legs to stabilize your lower body."),
                                    InstructionsGenerate(instructions: "2. Cross your hands to opposite shoulders or place them behind your ears, without pullling on your neck."),
                                    InstructionsGenerate(instructions: "3. Curl your upper body all the way up toward your knees. Exhale as you lift."),
                                    InstructionsGenerate(instructions: "4. Do a jab and cross, slowly lower yourself down, returning to your starting point. Inhale as you lower.")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),
                MovementGenerate(
                                movementIDGenerate: 19,
                                category: 3,
                                iconMovementGenerate: "Leg Raise",
                                animationMovementGenerate: "19.legRaises",
                                namaMovementGenerate: "Leg Raise",
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
                        iconMovementGenerate: "Flutter Kicks",
                        animationMovementGenerate: "20.flutterKicks",
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
                                iconMovementGenerate: "Scissors",
                                animationMovementGenerate: "21.scissors",
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
                                iconMovementGenerate: "Sit Up Alternating Hook",
                                animationMovementGenerate: "22.sitUpAlternatingHook",
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
                                iconMovementGenerate: "Squat",
                                animationMovementGenerate: "23.squat",
                                namaMovementGenerate: "Squat",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Stand straight with feet hip-width apart and your feet turned out slightly to open the hip joint "),
                                    InstructionsGenerate(instructions: "2. Lower your body until your thighs are parallel to the floor. "),
                                    InstructionsGenerate(instructions: "3. Pause, then return to the starting position."),
                                    InstructionsGenerate(instructions: "4. Repeat the movement")
                                ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),
        MovementGenerate(
                        movementIDGenerate: 24,
                        category: 4,
                        iconMovementGenerate: "Lunges",
                        animationMovementGenerate: "24.lunges",
                        namaMovementGenerate: "Lunges",
                        instructionsGenerate: [
                            InstructionsGenerate(instructions: "1. Stand with your feet hip-width apart, keep your back straight, your shoulders back, and your abs tight. "),
                            InstructionsGenerate(instructions: "2. Take a step forward and slowly bend both knees, until your back knee is just above the floor. "),
                            InstructionsGenerate(instructions: "3. Stand back up and repeat the movement."),
                            InstructionsGenerate(instructions: "4. Alternate legs until the set is complete.")
                        ],
                        calorieBurnGenerate: 0,
                        costEPGenerate: 0),
        MovementGenerate(
                                        movementIDGenerate: 25,
                                        category: 4,
                                        iconMovementGenerate: "Jump Squat",
                                        animationMovementGenerate: "25.jumpSquat",
                                        namaMovementGenerate: "Jump Squat",
                                        instructionsGenerate: [
                                                InstructionsGenerate(instructions: "1. Stand tall with your feet hip-width apart"),
                                                InstructionsGenerate(instructions: "2. Hinge at the hips to push your butt back and lower down until your thighs are parallel to the floor. Then press your feet down to explode off the floor and jump as high as you can."),
                                                InstructionsGenerate(instructions: "3. Allow your knees to bend 45 degrees when you land, and then immediately drop back down into a squat, and jump again")
                                            ],
                                        calorieBurnGenerate: 0,
                                        costEPGenerate: 0),
                
                            MovementGenerate(
                                        movementIDGenerate: 26,
                                        category: 4,
                                        iconMovementGenerate: "Squat Roundhouse Kick",
                                        animationMovementGenerate: "26.squatRoundhouseKick",
                                namaMovementGenerate: "Squat Roundhouse Kick",
                                instructionsGenerate: [
                                    InstructionsGenerate(instructions: "1. Stand with your feet shoulder width apart and your arms in front of your chest"),
                                        InstructionsGenerate(instructions: "2. Do a squat, and when you come up, kick your left leg to the side"),
                                        InstructionsGenerate(instructions: "3. Keep your core tight, your knees should be extended in the same direction as your toes"),
                                        InstructionsGenerate(instructions: "4.  Squeeze your glutes when you go up and your knees should not go over your toes")
                                    ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),

                            MovementGenerate(
                                        movementIDGenerate: 27,
                                        category: 4,
                                        iconMovementGenerate: "Back Lunges Front Kick",
                                    animationMovementGenerate: "27.backLungesFrontKick",
                                        namaMovementGenerate: "Back Lunges Front Kick",
                                    instructionsGenerate: [
                                        InstructionsGenerate(instructions: "1. Start with feet together"),
                                        InstructionsGenerate(instructions: "2. Step back with one foot to complete a lunge"),
                                        InstructionsGenerate(instructions: "3. Step back toward starting position, swinging your leg through to complete a kick"),
                                        InstructionsGenerate(instructions: "4. Return to starting position and repeat")
                                    ],
                                calorieBurnGenerate: 0,
                                costEPGenerate: 0),

                            MovementGenerate(
                                        movementIDGenerate: 28,
                                        category: 4,
                                        iconMovementGenerate: "Squat Side Kick",
                                    animationMovementGenerate: "28.squatSideKick",
                                        namaMovementGenerate: "Squat Side Kick",
                                        instructionsGenerate: [
                                        InstructionsGenerate(instructions: "1. Stand with your feet shoulder-width distance apart, feet parallel. Hold your hands out in front of you for balance. Bend your knees, lowering your hips deeply into a squat, keeping weight back in your heels."),
                                        InstructionsGenerate(instructions: "2. Then rise back up, straightening the legs completely and lifting the right leg out to the side, squeezing the outer glute."),
                                        InstructionsGenerate(instructions: "3. As you step the foot back into shoulder-width distance position, squat down again. Then stand up and do a side leg lift on the left side. Lower the leg back to the starting position."),
                                        InstructionsGenerate(instructions: "4. Repeat this pattern for one minute.")
                                        ],
                                    calorieBurnGenerate: 0,
                                    costEPGenerate: 0),
                    ]
}
