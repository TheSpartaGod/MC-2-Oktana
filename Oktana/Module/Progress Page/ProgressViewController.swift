//
//  ProgressViewController.swift
//  Oktana
//
//  Created by Deven Nathanael on 11/06/21.
//

import UIKit

class ProgressViewController: UIViewController {
    
    
    
    @IBOutlet weak var progressTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TitleTableViewCell", bundle: nil)
        let nibContentProgress = UINib(nibName: "ProgressContentTableViewCell", bundle: nil)
        let nibFitness = UINib(nibName: "FitnessTableViewCell", bundle: nil)
        self.progressTableView.register(nib, forCellReuseIdentifier: "titleCell")
        self.progressTableView.register(nibContentProgress, forCellReuseIdentifier: "progressCell")
        self.progressTableView.register(nibFitness, forCellReuseIdentifier: "fitnessView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        progressTableView.reloadData()
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.tabBarController?.tabBar.isHidden = false
    }
}

extension ProgressViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let workouts = CoreDataManager.shared.fetchAllWorkoutData()
        let currentFitness = CoreDataManager.shared.fetchCurrentFitnessData()
        let previousFitness = CoreDataManager.shared.fetchPreviousFitnessData()
        
    
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell") as! TitleTableViewCell
            cell.title = "Progress"
            cell.isTestButtonExist = true
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell") as! ProgressContentTableViewCell
            
                cell.workoutData = workouts
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell") as! TitleTableViewCell
            cell.title = "Your Fitness"
            cell.isTestButtonExist = false
            cell.delegate = self
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fitnessView") as! FitnessTableViewCell
            
            
            cell.fitnessData = fitnessProgressGenerate(title: "Cardiovascular", benchmark: 100, currentTestData: Int(currentFitness?.cardio ?? 0), previousTestData: Int(previousFitness?.cardio ?? 0))
            
            return cell
        case 4:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "fitnessView") as! FitnessTableViewCell
        
            cell.fitnessData = fitnessProgressGenerate(title: "Upper body strength", benchmark: 24, currentTestData: Int(currentFitness?.upperStrength ?? 0), previousTestData: Int(previousFitness?.upperStrength ?? 0))
            
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fitnessView") as! FitnessTableViewCell
            
            cell.fitnessData = fitnessProgressGenerate(title: "Core body strength", benchmark: 42, currentTestData: Int(currentFitness?.coreStrength ?? 0), previousTestData: Int(previousFitness?.coreStrength ?? 0))
            
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fitnessView") as! FitnessTableViewCell
            
            cell.fitnessData = fitnessProgressGenerate(title: "Lower body strength", benchmark: 100, currentTestData: Int(currentFitness?.lowerStrength ?? 0), previousTestData: Int(previousFitness?.lowerStrength ?? 0))
            
            return cell
        
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell") as! ProgressContentTableViewCell
            
            
            return cell
        }
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 1 {
            return 285
        } else if indexPath.row > 2 {
            return 150
        } else {
            return 70
        }
    }
    
    
    
}
extension ProgressViewController : TitleTableViewCellDelegate{
    func takeTestButtonAction() {
        AlertStandardViewController.showAlert(from: self, title: "Start Fitness Test", message: "The test will test your whole body's fitness level.\nAre you sure you are ready?", positiveMessage: "I'm Ready") {
            MovementQueue.isTest = true
            self.performSegue(withIdentifier: "startFitness", sender: self)
        }
        
    }
    
    
}
