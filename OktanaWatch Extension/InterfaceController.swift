//
//  InterfaceController.swift
//  OktanaWatch Extension
//
//  Created by Aqshal Wibisono on 16/06/21.
//

import WatchKit
import Foundation
import WatchConnectivity
import HealthKit

class InterfaceController: WKInterfaceController, WCSessionDelegate, ObservableObject{
    
    @IBOutlet weak var playPauseBtn: WKInterfaceButton!
    @IBOutlet weak var reverseBackBtn: WKInterfaceButton!
    @IBOutlet weak var forwardSkipButton: WKInterfaceButton!
    @IBOutlet weak var workoutTitleLabel: WKInterfaceLabel!
    @IBOutlet weak var heartRateLabel: WKInterfaceLabel!
    @IBOutlet weak var finishBtn: WKInterfaceButton!
    @IBOutlet weak var kcalLabel: WKInterfaceLabel!
    var isPaused : Bool = false
    var session : WCSession!
    var workoutManager = HealthKitWatchStore()
    let healthStore = HKHealthStore()
    var heartRate : Double!
    var kcal : Double!
    var avgHeartRate : Double!
    @IBAction func onPlayPauseBtnClick() {
        if isPaused == false{
            isPaused = true
            playPauseBtn.setBackgroundImage(UIImage(systemName: "play.fill"))
            session.sendMessage(["Message": "paused"], replyHandler: nil) { (error) in
                print(error.localizedDescription)
                  self.workoutManager.session.pause()
            }
            
        }else{
            isPaused = false
            playPauseBtn.setBackgroundImage(UIImage(systemName: "pause.fill"))
            session.sendMessage(["Message": "played"], replyHandler: nil) { (error) in
                print(error.localizedDescription)
                  self.workoutManager.session.resume()
            }
            
        }
        
    }
    @IBAction func onReverseBackBtnClick() {
        session.sendMessage(["Message" : "reverseback"], replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
    }
    @IBAction func onForwardSkipBtnClick() {
        session.sendMessage(["Message" : "skipforward"], replyHandler: nil) { (error) in
            print(error.localizedDescription)
            
        }
    }
    @IBAction func onFinishBtnClick() {
         workoutManager.session.end()
        session.sendMessage(["Message": workoutManager.averageHeartRate], replyHandler: nil) { (error) in
            print(error)
        }
    }
    override func awake(withContext context: Any?) {
        
        // Configure interface objects here.
        if WCSession.isSupported(){
            session = WCSession.default
            session.delegate = self
            session.activate()
            print("Session is reachable: \(session.isReachable)")
            self.workoutManager.authorizeHealthKit()
        }
        //start timer yang ngeupdate data heart rate dan calorie
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { (Timer) in
            self.heartRate = self.workoutManager.heartRate
            self.kcal = self.workoutManager.activeEnergy
            self.avgHeartRate = self.workoutManager.averageHeartRate ?? 0
            
            var heartRateString = String(format: "%.0f", self.heartRate)
            var kcalString = String(format: "%.0f", self.kcal)
            
            self.heartRateLabel.setText("\(heartRateString) BPM")
            self.kcalLabel.setText("\(kcalString) KCAL")
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        DispatchQueue.main.async {
            if let playPauseOpt = (message["playPause"] as? String) {
                switch playPauseOpt{
                case "play" : self.playPauseBtn.setBackgroundImage(UIImage(systemName: "play.fill"))
                    self.workoutManager.session.resume()
                case "pause": self.playPauseBtn.setBackgroundImage(UIImage(systemName: "pause.fill"))
                    self.workoutManager.session.pause()
                default: print("error")
                    
                }
                
            }
            if let titleOpt = (message["workoutTitle"] as? String){
                self.workoutTitleLabel.setText(titleOpt)
                print(titleOpt)
                
            }
            if let startMessage = (message["startWorkout"] as? String){
                DispatchQueue.main.async {
                  
                    self.workoutManager.startWorkoutSession()
                   
                    self.heartRateLabel.setText("\(self.workoutManager.heartRate) BPM")
                }
                
            }
            if let finishMessage = (message["finishWorkout"] as? String){
                let avgHeart = self.avgHeartRate ?? 0
                let totalKcal = self.kcal ?? 0
                session.sendMessage(["avgHeartRate": avgHeart, "totalKcal" : totalKcal ], replyHandler: nil) { (error) in
                    print(error.localizedDescription)
                }
                print("session ended, sent \(avgHeart) BPM and \(totalKcal) KCAL")
               
                self.workoutManager.session.end()
                self.pushController(withName: "firstInterfaceController", context: self)            }
            
        }
        
    }
  
    
}
