//
//  CoreDataTestViewController.swift
//  Oktana
//
//  Created by Gratianus Martin on 09/06/21.
//

import UIKit

class CoreDataTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func adduser(_ sender: UIButton) {
        _ = CoreDataManager.shared.saveUser()
    }
    @IBAction func fetchuser(_ sender: Any) {
        let user = CoreDataManager.shared.fetchUser()
        print("PRINT USER \(user?.energy_points) \(user?.total_streaks) \(user?.weekly_goals)")
    }
    @IBAction func addmovement(_ sender: Any) {
        guard let user = CoreDataManager.shared.fetchUser() else {
            return
        }
        CoreDataManager.shared.addMovementtoUser(user: user, movementID: "01")
    }
    
    @IBAction func addworkout(_ sender: Any) {
        guard let user = CoreDataManager.shared.fetchUser() else {
            return
        }
        CoreDataManager.shared.addWorkouttoUser(user: user, time: 60, heart_rate: 123, calories: 99, date: Date(timeIntervalSinceReferenceDate: -123456789.0))
    }
    
    @IBAction func fetchMove(_ sender: Any) {
        guard let movementList = CoreDataManager.shared.fetchAvailableMovement() else {
            return
        }
        for move in movementList {
            print("\(move.movementId)")
        }
    }
    @IBAction func fetchwork(_ sender: Any) {
        guard let workoutList = CoreDataManager.shared.fetchAllWorkoutData() else {
            return
        }
        for work in workoutList {
            print("\(work.totalCalories)")
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
