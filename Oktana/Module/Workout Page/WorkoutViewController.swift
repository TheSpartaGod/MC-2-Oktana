//
//  WorkoutViewController.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 08/06/21.
//

import UIKit
import HealthKit

class WorkoutViewController: UIViewController {
    
    @IBOutlet var baseView: UIView!
    @IBOutlet weak var energyStreakView: UIView!
    @IBOutlet weak var mainWorkoutLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var progressBarBase: UIView!
    @IBOutlet weak var progressBarFill: UIView!
    @IBOutlet weak var startWorkoutButton: UIView!
    @IBOutlet weak var streakCountLabel: UILabel!
    @IBOutlet weak var energyPointLabel: UILabel!
    @IBOutlet weak var timeCardView: MediumInfoCardView!
    @IBOutlet weak var calorieCardView: MediumInfoCardView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var newUser = User()
    var lastWorkout = Workout()
    @objc func didTapView(_ sender: UITapGestureRecognizer){//add gesture recognizer untuk button biar move ke workout detail
        performSegue(withIdentifier: "homeToDetail", sender: nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        if MovementQueue.currentUserInitialized == false{
            performSegue(withIdentifier: "showOnboarding", sender: self)
        }
        self.navigationController?.isNavigationBarHidden = true
            configElements()
            
        // Do any additional setup after loading the view.
    }
    
        
    func configElements(){
        //MARK: ENERGY STREAK VIEW
        streakCountLabel.text = "0"
        energyPointLabel.text = "0"
        if MovementQueue.currentUserInitialized == true{
    
            let opUser = CoreDataManager.shared.fetchUser()
            if opUser == nil{
                print("nil")
            }else{
                streakCountLabel.text = String(opUser!.total_streaks)
                energyPointLabel.text = String(opUser!.energy_points)
            }
            
        }
       
        
        energyStreakView.layer.cornerRadius = 5
        energyStreakView.layer.masksToBounds = true
        energyStreakView.backgroundColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.00)
       
        //MARK: BIG START BUTTON
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        startWorkoutButton.layer.cornerRadius = startWorkoutButton.frame.size.width/2
        startWorkoutButton.addGestureRecognizer(tapGestureRecognizer)
        
        //MARK: OTHERS
        baseView.backgroundColor = UIColor(red: 0.18, green: 0.17, blue: 0.17, alpha: 1.00)
        
        mainWorkoutLabel.textColor = UIColor(red: 0.66, green: 0.87, blue: 0.30, alpha: 1.00)
    
        //MARK: PROGRESS BAR
        progressBarBase.layer.cornerRadius = 5
        progressBarFill.layer.cornerRadius = 5
        
        //MARK: BOTTOM CARD
        configBottomCard()
        var hasDoneWorkouts : Bool// check apakah user pernah ngelakuin workout
        do{
            hasDoneWorkouts = try context.fetch(Workout.fetchRequest()).count > 0
            if hasDoneWorkouts == true{
                
                lastWorkout = try  context.fetch(Workout.fetchRequest()).last as! Workout
                timeCardView.cardValueLabel.text = String(lastWorkout.totalTime/60)
            }
          
           
            }
        catch{
            
        }
       
      
      //ubah menjadi lingkaran
    
    }
    func configBottomCard(){
        timeCardView.cardTitleLabel.text = "Time"
        timeCardView.cardIcon.image = UIImage(systemName: "stopwatch")
        timeCardView.cardValueLabel.text = "0"
        
        timeCardView.cardUnitLabel.text = "min"
        
        timeCardView.layer.cornerRadius = 10
        timeCardView.clipsToBounds = true
  
        
        calorieCardView.cardTitleLabel.text = "Calories"
        calorieCardView.cardIcon.image = UIImage(systemName: "flame")
        calorieCardView.cardIcon.tintColor = UIColor(red: 1.00, green: 0.66, blue: 0.00, alpha: 1.00)

        calorieCardView.cardUnitLabel.text = "kcal"
        calorieCardView.cardValueLabel.text = "720"
        calorieCardView.layer.cornerRadius = 10
        calorieCardView.clipsToBounds = true
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.tabBarController?.tabBar.isHidden = false
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
