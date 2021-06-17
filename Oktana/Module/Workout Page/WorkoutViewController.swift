//
//  WorkoutViewController.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 08/06/21.
//

import UIKit
import HealthKit
import WatchConnectivity
class WorkoutViewController: UIViewController, WCSessionDelegate {
  
    
    
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
    var session : WCSession!
    @objc func didTapView(_ sender: UITapGestureRecognizer){//add gesture recognizer untuk button biar move ke workout detail
        session.sendMessage(["Message" : "bruh"], replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
        performSegue(withIdentifier: "homeToDetail", sender: nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        if CoreDataManager.shared.fetchUser() == nil{
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
       
    
            let opUser = CoreDataManager.shared.fetchUser()
            if opUser == nil{
                print("nil")
            }else{
                streakCountLabel.text = String(opUser!.total_streaks)
                energyPointLabel.text = String(opUser!.energy_points)
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
        checkWorkout()
        // check apakah user pernah ngelakuin workout
               
      
      //ubah menjadi lingkaran
    
    }
    func checkWorkout(){
        var hasDoneWorkouts : Bool
        if let workouts = CoreDataManager.shared.fetchAllWorkoutData(){
            timeCardView.cardValueLabel.text = String(workouts[workouts.count-1].totalTime)
            calorieCardView.cardValueLabel.text = String(workouts[workouts.count-1].totalCalories)
        }
        
    }
    func configBottomCard(){
        timeCardView.cardTitleLabel.text = "Time"
        timeCardView.cardIcon.image = UIImage(systemName: "stopwatch")
        
        timeCardView.cardUnitLabel.text = "min"
        timeCardView.cardValueLabel.text = "105"
        timeCardView.layer.cornerRadius = 10
        timeCardView.clipsToBounds = true
        
        calorieCardView.cardTitleLabel.text = "Calories"
        calorieCardView.cardIcon.image = UIImage(systemName: "flame")
        calorieCardView.cardIcon.tintColor = UIColor(red: 1.00, green: 0.66, blue: 0.00, alpha: 1.00)
        
        calorieCardView.cardUnitLabel.text = "kcal"
        calorieCardView.cardValueLabel.text = "720"
        calorieCardView.layer.cornerRadius = 10
        calorieCardView.clipsToBounds = true
        //set color, corner radius, etc
        
        baseView.backgroundColor = UIColor(red: 0.18, green: 0.17, blue: 0.17, alpha: 1.00)
        
        mainWorkoutLabel.textColor = UIColor(red: 0.66, green: 0.87, blue: 0.30, alpha: 1.00)
        energyStreakView.backgroundColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.00)
        
        energyStreakView.layer.cornerRadius = 5
        energyStreakView.layer.masksToBounds = true
        
        progressBarBase.layer.cornerRadius = 5
        progressBarFill.layer.cornerRadius = 5
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        
        startWorkoutButton.layer.cornerRadius = startWorkoutButton.frame.size.width/2
        startWorkoutButton.addGestureRecognizer(tapGestureRecognizer)
        showWatchApp()
      //ubah menjadi lingkaran
    
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.tabBarController?.tabBar.isHidden = false
    }
    func showWatchApp(){
        
        if WCSession.isSupported() {
            session = WCSession.default
            session.delegate = self
            session.activate()
            print(session.isReachable)
         
        }
      
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.mainWorkoutLabel.text = message["pog"] as? String
        }
        
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
