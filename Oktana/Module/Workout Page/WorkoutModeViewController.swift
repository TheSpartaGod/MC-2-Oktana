//
//  WorkoutModeViewController.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 09/06/21.
//

import UIKit
import WatchConnectivity
class WorkoutModeViewController: UIViewController, WCSessionDelegate{
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
    var session : WCSession = WCSession.default
    //MARK: - other vars
    var workoutTimeLeft : Int = 15 //EDIT THIS BASED ON WORKOUT TIMER, USUALLY 30SECS BUT CAN BE MORE
    var focusedView : FocusedView!
    var skip : Bool = false
    var currentWorkoutList : [Int] = []
    var currentWorkoutID : Int = 0
    var workoutTime : Timer!
    var totalTime : Timer!
    var currentSet : Int = 0
    var desiredSet : Int = 0
    
    
    //MARK: - Actions
    
    @IBAction func onFocusedBtnClick(_ sender: Any) {
        focusedView = FocusedView(frame: .zero, viewMode: "TestEntry", activityTitleText: "Push Up", focusMessageText: "How many Push Ups did you do?", activityImage: UIImage(systemName: "hexagon.fill") ?? UIImage())
    }
    @IBAction func onExitWorkoutButtonClicked(_ sender: Any) {
        workoutTime.invalidate()
        totalTime.invalidate()
        //dismiss(animated: true, completion: nil)
        //performSegue(withIdentifier: "toHome", sender: nil)
        AlertStandardViewController.showAlert(from: self, title:"Confirm Exit" , message: "Are you sure you want to abort workout and exit to the home page?" , positiveMessage: "Yes") {
            self.workoutTime.invalidate()
            self.totalTime.invalidate()
            MovementQueue.dequeueMovementList()
            self.navigationController?.popToRootViewController(animated: true)
            
        }
        
        
    }
    
    @IBAction func onPlayPauseButtonClicked(_ sender: Any) {
        playPauseWorkout()
    }
    
    
    @IBAction func onSkipForwardButtonClicked(_ sender: Any) {
        skipForwardWorkout()
    }
    
    @IBAction func onReverseBackButtonClicked(_ sender: Any) {
        reverseBackWorkout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guideBackground.layer.cornerRadius = guideBackground.frame.size.width/2
        initializeWorkoutList()
        setCircleProgressBar()
        
        if MovementQueue.currentWorkoutPosition == 0{
            reverseBackButton.isHidden = true
            reverseBackImage.isHidden = true
        }
        showWatchApp()
        session.sendMessage(["workoutTitle": activityTitleLabel.text], replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
        AlertTestViewController.showAlert(from: self, movementTitle: "Push Up", image: UIImage(systemName: "pause.fill")) { listValue in
            
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //set tab bar and navigation bar as hidden
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        workoutTimer()
        
    }
    override func removeFromParent() {
        
    }
    
    func setCircleProgressBar(){
        circleBar = CircularProgressBarView(frame: .zero, radius: Int(guideBackground.frame.size.width)/2) //initializes progress bar with radius a bit smaller than container
        
        circleBar.center = CGPoint(x: guideBackground.frame.size.width/2, y: guideBackground.frame.size.height/2)
        
        circleBar.progressAnimation(duration: TimeInterval(workoutTimeLeft))
        
        guideBackground.addSubview(circleBar)
        
        
    }
    func workoutTimer(){
        workoutTime = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){
            (Timer) in
            
            if self.workoutTimeLeft >= 0 && self.skip != true{
                self.activityTimeLabel.text = "\(self.workoutTimeLeft)s"
                self.workoutTimeLeft -= 1
                print(self.activityTimeLabel.text!)
            }
            else{
                //TIMER GEDENYA UDAH ABIS WAKTUNYA
               
                print (MovementQueue.currentSet)
                Timer.invalidate()
                self.totalTime.invalidate()
                if self.skip == false && MovementQueue.currentWorkoutPosition < MovementQueue.selectedMovesList.count-1 && MovementQueue.isBreak == true {
                    MovementQueue.isBreak = false
                    //MovementQueue.currentSet += 1
                    if MovementQueue.currentSet == self.desiredSet{
                        MovementQueue.currentWorkoutPosition += 1
                        MovementQueue.currentSet = 0
                    }
                    self.currentWorkoutID = MovementQueue.selectedMovesList[MovementQueue.currentWorkoutPosition]
                    self.performSegue(withIdentifier: "toNextMove", sender: nil)
                    
                }else if MovementQueue.currentWorkoutPosition == MovementQueue.selectedMovesList.count-1{
                    self.performSegue(withIdentifier: "toWorkoutComplete", sender: nil)
                }else if MovementQueue.isBreak == false{
                    MovementQueue.isBreak = true
                    self.performSegue(withIdentifier: "toNextMove", sender: nil)
                }
                
                
            }
            
        }
        workoutTime.fire() //ngeforce timer untuk jalan langsung tanpa delay
        
        
        totalTime = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){
            (Timer) in
            let (m, s) = MovementQueue.secondsToMinutesSeconds(seconds: MovementQueue.currentTotalTime)
            
            self.totalTimerLabel.text =
                String(format: "%0.2d:%0.2d", m, s)
            MovementQueue.currentTotalTime += 1
            
            
        }
        self.totalTime.fire()
        
        
    }
    func initializeWorkoutList(){
        //class viewcontroller bakalan tektokan sama class MovementQueue buat update current movement yang ditampilin
        //currentWorkoutPosition = urutan workout yang mau dijalanin
        //currentWorkoutID = ID workout yang mau dijalanin
        currentWorkoutList = MovementQueue.selectedMovesList
        currentWorkoutID = currentWorkoutList[MovementQueue.currentWorkoutPosition]
        var nextWorkoutID = 0
        if MovementQueue.currentWorkoutPosition != MovementQueue.selectedMovesList.count-1{
             nextWorkoutID = currentWorkoutList[MovementQueue.currentWorkoutPosition+1]
        }
       
        if MovementQueue.isBreak == false{
            activityTitleLabel.text = MovementQueue.MovementList.data[currentWorkoutID-1].namaMovementGenerate
            activityStatusLabel.text = "\(MovementQueue.currentWorkoutPosition+1) of \(MovementQueue.selectedMovesList.count)"
        } else if MovementQueue.isBreak != false {
           
            activityTitleLabel.text = "Break"
            activityStatusLabel.text = "Next Up: \(MovementQueue.MovementList.data[nextWorkoutID-1].namaMovementGenerate)"
        }
        
    }
    func skipForwardWorkout(){
        workoutTime.invalidate()
        totalTime.invalidate()
        if MovementQueue.currentWorkoutPosition < MovementQueue.selectedMovesList.count-1 && MovementQueue.isBreak == true{
            MovementQueue.isBreak = false
            MovementQueue.currentWorkoutPosition += 1
            self.currentWorkoutID = MovementQueue.selectedMovesList[MovementQueue.currentWorkoutPosition]
            self.removeFromParent()
            
            performSegue(withIdentifier: "toNextMove", sender: nil)
        }
        else if MovementQueue.isBreak == false &&  MovementQueue.currentWorkoutPosition != MovementQueue.selectedMovesList.count-1{
            
            MovementQueue.isBreak = true
            performSegue(withIdentifier: "toNextMove", sender: nil)
        }
        else if MovementQueue.currentWorkoutPosition == MovementQueue.selectedMovesList.count-1{
            performSegue(withIdentifier: "toWorkoutComplete", sender: nil)
        }
    }
    func reverseBackWorkout(){
        workoutTime.invalidate()
        totalTime.invalidate()
        if  MovementQueue.isBreak == false{
            MovementQueue.isBreak = false
            MovementQueue.currentWorkoutPosition -= 1
            self.currentWorkoutID = MovementQueue.selectedMovesList[MovementQueue.currentWorkoutPosition]
            performSegue(withIdentifier: "toNextMove", sender: nil)
            skip = true
        }
        else if  MovementQueue.isBreak == true{
            MovementQueue.isBreak = false
            self.currentWorkoutID = MovementQueue.selectedMovesList[MovementQueue.currentWorkoutPosition]
            performSegue(withIdentifier: "toNextMove", sender: nil)
            skip = true
        }
    }
    func playPauseWorkout(){
        if playPauseImage.image == UIImage(systemName: "pause.fill"){
            workoutTime.invalidate()
            totalTime.invalidate()
            circleBar.pauseAnimation()
            playPauseImage.image = UIImage(systemName: "play.fill")
            session.sendMessage(["playPause": "play"], replyHandler: nil) { (error) in
                print(error.localizedDescription)
            }
            
        }
        else{
            
            circleBar.resumeAnimation()
            workoutTimer()
            playPauseImage.image = UIImage(systemName: "pause.fill")
            session.sendMessage(["playPause": "pause"], replyHandler: nil) { (error) in
                print(error.localizedDescription)
            }
        }
    }
    func showWatchApp(){
        
        if WCSession.isSupported(){
            session = WCSession.default
            session.delegate = self
            session.activate()
    
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
            //ketika button apple watch di click, ubah status workout
            let option = message["Message"] as? String
            switch option{
            case "paused": self.playPauseWorkout()
            case "played": self.playPauseWorkout()
            case "skipforward": self.skipForwardWorkout()
            case "reverseback": self.reverseBackWorkout()
            default: print("error")
            }
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
