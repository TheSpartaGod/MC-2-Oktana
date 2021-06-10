//
//  WorkoutViewController.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 08/06/21.
//

import UIKit

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
    @objc func didTapView(_ sender: UITapGestureRecognizer){//add gesture recognizer untuk button biar move ke workout detail
        performSegue(withIdentifier: "homeToDetail", sender: nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        configElements()
        

        // Do any additional setup after loading the view.
    }
    func configElements(){
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
      //ubah menjadi lingkaran
    
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
