//
//  WorkoutModeViewController.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 09/06/21.
//

import UIKit

class WorkoutModeViewController: UIViewController {
    //MARK: - Labels
    @IBOutlet weak var totalTimerLabel: UILabel!
    @IBOutlet weak var activityTitleLabel: UILabel!
    @IBOutlet weak var activityTimeLabel: UILabel!
    @IBOutlet weak var activityStatusLabel: UILabel!

    //MARK: - anims and loading bar
    @IBOutlet weak var workoutImage: UIImageView!//set image dulu buat sementara
    @IBOutlet weak var guideBackground: UIView!//background for loading bar and animation
    var circleBar: CircularProgressBarView!

    //MARK: - buttons
    @IBOutlet weak var exitWorkoutImage: UIImageView!
    @IBOutlet weak var exitWorkoutButton: UIButton!
    @IBOutlet weak var focusedViewBtn: UIButton!
    @IBOutlet weak var skipForwardButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var playPauseImage: UIImageView!//gangerti gw cara add image ke button biar gede, jadi image gw overlay button
    @IBOutlet weak var reverseBackButton: UIButton!
    @IBOutlet weak var reverseBackImage: UIImageView!
    
    //MARK: - other vars
    var workoutTimeLeft : Int = 40 //EDIT THIS BASED ON WORKOUT TIMER, USUALLY 30SECS BUT CAN BE MORE
    var focusedView : FocusedView!
    var skip : Bool!

    //MARK: - Actions
    
    @IBAction func onFocusedBtnClick(_ sender: Any) {
        focusedView = FocusedView(frame: .zero, viewMode: "TestEntry", activityTitleText: "Push Up", focusMessageText: "How many Push Ups did you do?", activityImage: UIImage(systemName: "hexagon.fill") ?? UIImage())
    }
    @IBAction func onExitWorkoutButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func onPlayPauseButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func onSkipForwardButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toNextMove", sender: nil)
        skip = true
       
    }
    @IBAction func onReverseBackButtonClicked(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guideBackground.layer.cornerRadius = guideBackground.frame.size.width/2
        setCircleProgressBar()
        workoutTimer()
   
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //set tab bar and navigation bar as hidden
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
   
    func setCircleProgressBar(){
        circleBar = CircularProgressBarView(frame: .zero, radius: Int(guideBackground.frame.size.width)/2) //initializes progress bar with radius a bit smaller than container
        
        circleBar.center = CGPoint(x: guideBackground.frame.size.width/2, y: guideBackground.frame.size.height/2)
        
        circleBar.progressAnimation(duration: TimeInterval(workoutTimeLeft))
        
        guideBackground.addSubview(circleBar)
        
        
    }
    func workoutTimer(){
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){
            (Timer) in
            if self.workoutTimeLeft >= 0 && self.skip != true{
            self.activityTimeLabel.text = "\(self.workoutTimeLeft)s"
            self.workoutTimeLeft -= 1
            print(self.activityTimeLabel.text!)
            }
            else{
                Timer.invalidate()
                
            }
            
            
            
            
        }
       // activityTimeLabel.text = "bruh"
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
