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
        navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        configElements()
        // Do any additional setup after loading the view.
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
        heartCardView.cardValueLabel.text = "102"
        heartCardView.cardUnitLabel.text = "bpm"
        heartCardView.layer.cornerRadius = 8
        heartCardView.clipsToBounds = true

        caloriesCardView.cardTitleLabel.text = "Calories"
        caloriesCardView.cardIcon.image = UIImage(systemName: "flame")
        caloriesCardView.cardValueLabel.text = "48"
        caloriesCardView.cardUnitLabel.text = "kcal"
        caloriesCardView.layer.cornerRadius = 8
        caloriesCardView.clipsToBounds = true

        energyCardView.cardTitleLabel.text = "Energy Point"
        energyCardView.cardIcon.image = UIImage(systemName: "bolt")
        energyCardView.cardValueLabel.text = "+30"
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
