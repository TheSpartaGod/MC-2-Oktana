//
//  WorkoutModeViewController.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 09/06/21.
//

import UIKit
import AVKit
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
    @IBOutlet weak var skipForwardButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var playPauseImage: UIImageView!//gangerti gw cara add image ke button biar gede, jadi image gw overlay button
    @IBOutlet weak var reverseBackButton: UIButton!
    @IBOutlet weak var reverseBackImage: UIImageView!
   
    //MARK: - other vars
    var workoutTimeLeft : Int = 15 //EDIT THIS BASED ON WORKOUT TIMER, USUALLY 30SECS BUT CAN BE MORE
    var skip : Bool = false
    var currentWorkoutList : [Int] = []
    var currentWorkoutID : Int = 0
    var workoutTime : Timer!
    var totalTime : Timer!
    var currentSet : Int = 0
    var desiredSet : Int = 0
    var session : WCSession!
    var player : AVPlayerLooper?
    var avPlayer = AVPlayerViewController()
  
    var isTest = MovementQueue.isTest
    
    //MARK: - Actions
    
    @IBAction func onExitWorkoutButtonClicked(_ sender: Any) {
        AlertStandardViewController.showAlert(from: self, title:"Confirm Exit" , message: "Are you sure you want to abort workout and exit to the home page?" , positiveMessage: "Yes") {
            self.workoutTime.invalidate()
            self.totalTime.invalidate()
            self.session.sendMessage(["finishWorkout" : "finishWorkout"], replyHandler: nil) { (error) in
                print(error.localizedDescription)
            }
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
       
      
        if MovementQueue.currentWorkoutPosition == 0{
            reverseBackButton.isHidden = true
            reverseBackImage.isHidden = true
        }
        if MovementQueue.isBreak == true && isTest == true{
            let movementList = Movements()
            let imageMovement = UIImage(named: movementList.data[MovementQueue.selectedMovesList[MovementQueue.currentWorkoutPosition]-1].iconMovementGenerate)
            AlertTestViewController.showAlert(from: self, movementTitle: "Performance Check", image: imageMovement) { inputMsg in
                
                MovementQueue.testRecord.append(Int(inputMsg) ?? 0)
                
            }
           
        }
        
        connectWatch() //MARK: CREATE APPLE WATCH SESSION / CONNECT WATCH
    
        if session.isReachable{
            print("sending Message to watch")
            if MovementQueue.workoutHasStarted == false{
                MovementQueue.workoutHasStarted = true
                session.sendMessage(["startWorkout": "startWorkout"], replyHandler: nil) { (error) in
                    print(error.localizedDescription)
                }
                
            }
            
            session.sendMessage(["workoutTitle": activityTitleLabel.text], replyHandler: nil) { (error) in
                print(error.localizedDescription)
            }
        }
    
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //set tab bar and navigation bar as hidden
       
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        workoutTimer()
       
        
    }
    override func viewDidAppear(_ animated: Bool) {
        guard let url = Bundle.main.path(forResource: MovementQueue.MovementList.data[currentWorkoutID-1].animationMovementGenerate, ofType: "mov") else {
            return
            
        }
        
        let player = AVQueuePlayer()
        self.player = AVPlayerLooper(player: player, templateItem: AVPlayerItem(asset: AVAsset(url: URL(fileURLWithPath: url))))
        avPlayer.player = player
        avPlayer.videoGravity = .resizeAspectFill
        avPlayer.showsPlaybackControls = false
        avPlayer.view.frame = guideBackground.bounds
        guideBackground.contentMode = .scaleToFill
        self.addChild(avPlayer)
        self.guideBackground.addSubview(avPlayer.view)
        self.guideBackground.addSubview(UIImageView(image: UIImage(named: "frameBulet")))
        avPlayer.player?.play()
        avPlayer.player?.isMuted = true
        
        setCircleProgressBar()
    }
   // func untuk membuat progress bar lingkaran
    func setCircleProgressBar(){
        circleBar = CircularProgressBarView(frame: .zero, radius: Int(guideBackground.frame.size.width)/2) //initializes progress bar with radius a bit smaller than container
        
        circleBar.center = CGPoint(x: guideBackground.frame.size.width/2, y: guideBackground.frame.size.height/2)
        
        circleBar.progressAnimation(duration: TimeInterval(workoutTimeLeft))
        
        guideBackground.addSubview(circleBar)
        
    }
    // func utk initialize workout timer
    func workoutTimer(){
        workoutTime = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){
            (Timer) in
            
            if self.workoutTimeLeft >= 0 && self.skip != true{
                self.activityTimeLabel.text = "\(self.workoutTimeLeft)s"
                self.workoutTimeLeft -= 1
            }
            else{
                //TIMER GEDENYA UDAH ABIS WAKTUNYA
               
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
                    
                    //send message to watch bahwa workout telah selesai
                    self.checkFinalStatus()
                
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
    // func untuk mendapatkan workout list dari MovementQueue
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
            if isTest == false{
                activityStatusLabel.text = "Next Up: \(MovementQueue.MovementList.data[nextWorkoutID-1].namaMovementGenerate)"
            }
            
        }
        
    }
    //func untuk menghandle skip move
    func skipForwardWorkout(){
        workoutTime.invalidate()
        totalTime.invalidate()
        if MovementQueue.currentWorkoutPosition < MovementQueue.selectedMovesList.count-1 && MovementQueue.isBreak == true{
            MovementQueue.isBreak = false
            MovementQueue.currentWorkoutPosition += 1
            self.currentWorkoutID = MovementQueue.selectedMovesList[MovementQueue.currentWorkoutPosition]
            performSegue(withIdentifier: "toNextMove", sender: nil)
        }
        else if MovementQueue.isBreak == false &&  MovementQueue.currentWorkoutPosition != MovementQueue.selectedMovesList.count-1{
            
            MovementQueue.isBreak = true
            performSegue(withIdentifier: "toNextMove", sender: nil)
        }
        else if MovementQueue.currentWorkoutPosition == MovementQueue.selectedMovesList.count-1 {
            //send message to watch bahwa workout telah selesai
            self.checkFinalStatus()
        }
    }
    func checkFinalStatus(){
        if isTest == false && MovementQueue.isBreak == false{
            if !session.isReachable{
                self.performSegue(withIdentifier: "toWorkoutComplete", sender: self)
            }else{
                self.session.sendMessage(["finishWorkout": "finishWorkout"], replyHandler: nil) { (error) in
                    print(error.localizedDescription)
            }
            }
        }else if isTest == true && MovementQueue.isBreak == false{
            MovementQueue.isBreak = true
            performSegue(withIdentifier: "toNextMove", sender: nil)
        }else if isTest == true && MovementQueue.isBreak == true{
            if !session.isReachable{
                self.performSegue(withIdentifier: "toTestComplete", sender: self)
            }else{
                self.session.sendMessage(["finishWorkout": "finishWorkout"], replyHandler: nil) { (error) in
                    print(error.localizedDescription)
            }
           
                
            
        }
       
    }
    }
    // func untuk menghandle previous move
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
    //func untuk menghandle play/pause workout
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
    //func untuk membuat connection ke apple watch
    func connectWatch(){
        if WCSession.isSupported(){
            session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    //MARK: req func untuk handle WCSession
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    //MARK: function untuk handle message antara phone dengan watch
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            //ketika button apple watch di click, ubah status workout
            if let option = message["Message"] as? String{
            switch option{
            case "paused": self.playPauseWorkout()
            case "played": self.playPauseWorkout()
            case "skipforward": self.skipForwardWorkout()
            case "reverseback": self.reverseBackWorkout()
            default: self.activityStatusLabel.text = option
                }
            }
            //ketika mendapatkan data heart rate dan kcal dari apple watch, berarti workout udah kelar dan move ke view selanjutnya
            if let avgHeart = message["avgHeartRate"] as? Double{
                let kcal = message["totalKcal"] as? Double
                MovementQueue.heartRate = Int(avgHeart)
                MovementQueue.totalKcal = Int(kcal ?? 420)
                if self.isTest == false{
                    self.performSegue(withIdentifier: "toWorkoutComplete", sender: self)
                } else{
                    
                    self.performSegue(withIdentifier: "toTestComplete", sender: self)
                }
                
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
