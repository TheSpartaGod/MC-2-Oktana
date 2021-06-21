//
//  WorkoutCompleteViewController.swift
//  Oktana
//
//  Created by Deven Nathanael on 09/06/21.
//

import UIKit

class WorkoutCompleteViewController: UIViewController {
    
   
    @IBOutlet weak var timeCardView: LongMediumInfoCardView!
    @IBOutlet weak var heartCardView: MediumInfoCardView!
    @IBOutlet weak var caloriesCardView: MediumInfoCardView!
    @IBOutlet weak var energyCardView: LongMediumInfoCardView!
    @IBOutlet weak var doneButton: UIButton!
   
    @IBAction func onDoneButtonClick(_ sender: Any) {
        saveWorkout()
        MovementQueue.dequeueMovementList()
        navigationController?.popToRootViewController(animated: true)
     
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        configElements()
        // Do any additional setup after loading the view.
    }
    func saveWorkout(){
        //create new workout object
        
        if let user = CoreDataManager.shared.fetchUser() {
            //compare dates between current and last workout
           let now = Date()
            let nilDate = Date(timeIntervalSince1970: 2) //nildate kalo dia belom pernah workout sebelomnya
            let workouts = CoreDataManager.shared.fetchAllWorkoutData()
            let lastWorkoutDate = workouts?.last?.date
            let diffComponents = Calendar.current.dateComponents([.day], from: lastWorkoutDate ?? nilDate, to: now)
            if lastWorkoutDate == nilDate || diffComponents.day! > 0{
                let newStreak = user.total_streaks + 1
                CoreDataManager.shared.updateStreaksUser(user: user, streaks: Int(newStreak))
            }
            let newWorkout = CoreDataManager.shared.addWorkouttoUser(user: user, time: Int(MovementQueue.currentTotalTime), heart_rate: 150, calories: 150, date:now)
            // add energy points to user
            let newPoint =  user.energy_points + Int64(((MovementQueue.currentTotalTime/60) * 2))
            CoreDataManager.shared.updatePointUser(user: user, point: Int(newPoint))
            
           
        } else {
            print("error in saving workout")
            return
        }
        
    }
    func configElements(){
        let (m,s) = MovementQueue.secondsToMinutesSeconds(seconds: MovementQueue.currentTotalTime)
        timeCardView.cardTitleLabel.text = "Total Time"
        timeCardView.cardIcon.image = UIImage(systemName: "stopwatch")
        timeCardView.cardValueLabel.text = String(format: "%0.2d:%0.2d", m, s)
        timeCardView.layer.cornerRadius = 8
        timeCardView.clipsToBounds = true

        heartCardView.cardTitleLabel.text = "Average Heart Rate"
        heartCardView.cardIcon.image = UIImage(systemName: "heart.fill")
        heartCardView.cardIcon.tintColor = #colorLiteral(red: 0.9001493454, green: 0.2962301373, blue: 0.2932987511, alpha: 1)
        heartCardView.cardValueLabel.text = "\(MovementQueue.heartRate)"
        heartCardView.cardUnitLabel.text = "bpm"
        heartCardView.layer.cornerRadius = 8
        heartCardView.clipsToBounds = true

        caloriesCardView.cardTitleLabel.text = "Calories"
        caloriesCardView.cardIcon.image = UIImage(systemName: "flame")
        caloriesCardView.cardIcon.tintColor = #colorLiteral(red: 1, green: 0.6330538969, blue: 0.1733412416, alpha: 1)
        caloriesCardView.cardValueLabel.text = "\(MovementQueue.totalKcal)"
        caloriesCardView.cardUnitLabel.text = "kcal"
        caloriesCardView.layer.cornerRadius = 8
        caloriesCardView.clipsToBounds = true

        energyCardView.cardTitleLabel.text = "Energy Point"
        energyCardView.cardIcon.image = UIImage(systemName: "bolt")
        energyCardView.cardIcon.tintColor = #colorLiteral(red: 1, green: 0.8191718459, blue: 0.005730928387, alpha: 1)
        energyCardView.cardValueLabel.text = "+\((MovementQueue.currentTotalTime/60) * 2)"
        energyCardView.layer.cornerRadius = 8
        energyCardView.clipsToBounds = true

     
        doneButton.layer.cornerRadius = 15

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
