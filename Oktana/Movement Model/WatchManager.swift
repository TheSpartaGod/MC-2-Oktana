//
//  WatchManager.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 20/06/21.
//

import Foundation
import WatchConnectivity
class WatchManager : NSObject, WCSessionDelegate{
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    static let shared = WatchManager()
    private override init(){
        super.init()
    }
    
    
    private let session = WCSession.default
    static var sessionIsActivated = false
    func startSession(){
        session.delegate = self
        session.activate()
    }
}
