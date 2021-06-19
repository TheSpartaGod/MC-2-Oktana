//
//  WorkoutCompleteViewController.swift
//  Oktana
//
//  Created by Deven Nathanael on 09/06/21.
//

import UIKit

class WorkoutCompleteViewController: UIViewController {
    
    @IBOutlet weak var checklistImage: UIView!
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
            
           
            let newWorkout = CoreDataManager.shared.addWorkouttoUser(user: user, time: Int(MovementQueue.currentTotalTime), heart_rate: 150, calories: 150, date: Date())
            let newPoint =  user.energy_points + Int64(((MovementQueue.currentTotalTime/60) * 2))
            CoreDataManager.shared.updatePointUser(user: user, point: Int(newPoint))
            
          // add energy points to user
      
          // let allWorkout =  CoreDataManager.shared.fetchAllWorkoutData()
            //print(allWorkout?.count)
        } else {
            print("error in saving workout")
            return
        }
      
        //set workout object attribute
        
        
  
        
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
        heartCardView.cardValueLabel.text = "\(MovementQueue.heartRate)"
        heartCardView.cardUnitLabel.text = "bpm"
        heartCardView.layer.cornerRadius = 8
        heartCardView.clipsToBounds = true

        caloriesCardView.cardTitleLabel.text = "Calories"
        caloriesCardView.cardIcon.image = UIImage(systemName: "flame")
        caloriesCardView.cardValueLabel.text = "\(MovementQueue.totalKcal)"
        caloriesCardView.cardUnitLabel.text = "kcal"
        caloriesCardView.layer.cornerRadius = 8
        caloriesCardView.clipsToBounds = true

        energyCardView.cardTitleLabel.text = "Energy Point"
        energyCardView.cardIcon.image = UIImage(systemName: "bolt")
        energyCardView.cardValueLabel.text = "\((MovementQueue.currentTotalTime/60) * 2)"
        energyCardView.layer.cornerRadius = 8
        energyCardView.clipsToBounds = true

        checklistImage.layer.cornerRadius = checklistImage.frame.size.width/2
        checklistImage.layer.borderColor = CGColor(red: 168/255, green: 221/255, blue: 76/255, alpha: 1)
        checklistImage.layer.borderWidth = 10
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
