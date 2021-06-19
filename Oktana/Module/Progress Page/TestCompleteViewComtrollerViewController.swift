//
//  TestCompleteViewComtrollerViewController.swift
//  Oktana
//
//  Created by Deven Nathanael on 10/06/21.
//

import UIKit

class TestCompleteViewComtrollerViewController: UIViewController {
    
    
    @IBOutlet weak var jumpJackView: MediumInfoCardView!
    @IBOutlet weak var pushUpView: MediumInfoCardView!
    @IBOutlet weak var sitUpView: MediumInfoCardView!
    @IBOutlet weak var squatView: MediumInfoCardView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configElements()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onDoneButtonClick(_ sender: Any) {
        saveFitness()
        MovementQueue.dequeueMovementList()
        navigationController?.popToRootViewController(animated: true)
        
    }
    func configElements(){
        jumpJackView.cardTitleLabel.text = "Jumping Jacks"
        jumpJackView.cardIcon.image = UIImage(named: "Jumping Jacks")
        jumpJackView.cardValueLabel.text = "\(MovementQueue.testRecord[0])"
        
        jumpJackView.layer.cornerRadius = 8
        jumpJackView.clipsToBounds = true
        jumpJackView.cardIcon.tintColor = #colorLiteral(red: 0.6517582536, green: 0.8813420534, blue: 0.1163280979, alpha: 1)
        
        pushUpView.cardTitleLabel.text = "Push Ups"
        pushUpView.cardIcon.image = UIImage(named: "Push Up")
        pushUpView.cardValueLabel.text = "\(MovementQueue.testRecord[1])"
        pushUpView.layer.cornerRadius = 8
        pushUpView.clipsToBounds = true
        pushUpView.cardIcon.tintColor = #colorLiteral(red: 0.6517582536, green: 0.8813420534, blue: 0.1163280979, alpha: 1)
        
        sitUpView.cardTitleLabel.text = "Sit Ups"
        sitUpView.cardIcon.image = UIImage(named: "sit up jab straight")
        sitUpView.cardValueLabel.text = "\(MovementQueue.testRecord[2])"
        sitUpView.layer.cornerRadius = 8
        sitUpView.clipsToBounds = true
        sitUpView.cardIcon.tintColor = #colorLiteral(red: 0.6517582536, green: 0.8813420534, blue: 0.1163280979, alpha: 1)
        
        //pushUpView.cardIcon.image = UIImage(systemName: "stopwatch")
        squatView.cardTitleLabel.text = "Squats"
        squatView.cardValueLabel.text = "\(MovementQueue.testRecord[3])"
        squatView.cardIcon.image = UIImage(named: "Squat")
        squatView.layer.cornerRadius = 8
        squatView.clipsToBounds = true
        squatView.cardIcon.tintColor = #colorLiteral(red: 0.6517582536, green: 0.8813420534, blue: 0.1163280979, alpha: 1)
      
        doneButton.layer.cornerRadius = 15
        
    }
    func saveFitness(){
        if let user = CoreDataManager.shared.fetchUser(){
            let cardio = MovementQueue.testRecord[0]
            let upper = MovementQueue.testRecord[1]
            let core = MovementQueue.testRecord[2]
            let lower = MovementQueue.testRecord[3]
            
            CoreDataManager.shared.addFitnesstoUser(user: user, cardio: cardio, upperStrength: upper, coreStrength: core, lowerStrength: lower)
        }
        
    }
    
}
