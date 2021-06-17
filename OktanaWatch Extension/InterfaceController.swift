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

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    var workoutManager = HealthKitWatchStore()
   
    
    let healthStore = HKHealthStore()
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        
        if let playPauseOpt = (message["playPause"] as? String) {
            switch playPauseOpt{
            case "play" : playPauseBtn.setBackgroundImage(UIImage(systemName: "play.fill"))
            case "pause": playPauseBtn.setBackgroundImage(UIImage(systemName: "pause.fill"))
            default: print("error")
            
            }
           
        }
        if let titleOpt = (message["workoutTitle"] as? String){
            workoutTitleLabel.setText(titleOpt)
        }
       
    }
    

    @IBOutlet weak var playPauseBtn: WKInterfaceButton!
    @IBOutlet weak var reverseBackBtn: WKInterfaceButton!
    @IBOutlet weak var forwardSkipButton: WKInterfaceButton!
    @IBOutlet weak var workoutTitleLabel: WKInterfaceLabel!
    @IBOutlet weak var heartRateLabel: WKInterfaceLabel!
    @IBOutlet weak var finishBtn: WKInterfaceButton!
    var isPaused : Bool = false
    var session : WCSession!
   
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
    }
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        
        session = WCSession.default
        session.delegate = self
        session.activate()
        
        workoutManager.authorizeHealthKit()
        workoutManager.startWorkoutSession()
        heartRateLabel.setText("\(workoutManager.heartRate)")
        
        
    }
   
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
