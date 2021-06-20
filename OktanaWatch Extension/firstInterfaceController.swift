//
//  firstInterfaceController.swift
//  OktanaWatch Extension
//
//  Created by Aqshal Wibisono on 17/06/21.
//

import WatchKit
import WatchConnectivity

class firstInterfaceController: WKInterfaceController, WCSessionDelegate {
    var session : WCSession!
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if WCSession.isSupported(){
            session = WCSession.default
            session.delegate = self
            session.activate()
            
        }
        }
       
    

}
