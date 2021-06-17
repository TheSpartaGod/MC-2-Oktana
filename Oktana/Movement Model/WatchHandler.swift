//
//  WatchHandler.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 16/06/21.
//

import Foundation
import WatchConnectivity
class WatchHandler : NSObject, WCSessionDelegate{
    static var messageText : String = ""
    var session : WCSession
    
    init(session: WCSession = .default){
           self.session = session
           super.init()
           self.session.delegate = self
           session.activate()
       }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
     
        
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        WatchHandler.messageText = message["Message"] as? String ?? "UnknownMessage"
    }
    
    
    
}
