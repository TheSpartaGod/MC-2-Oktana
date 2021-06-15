//
//  CircularProgressBarView.swift
//  Oktana
//
//  Created by Aqshal Wibisono on 09/06/21.
//

import UIKit

class CircularProgressBarView: UIView {
    
    init(frame: CGRect, radius: Int) {
        super.init(frame: frame)
        createCirclePath(radius:radius)
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
  
    }
    //circle properties
    private var circleLayer = CAShapeLayer()// base layer of circle
    private var progressLayer = CAShapeLayer()// progress layer of progressing bar
    private var startPoint = CGFloat(-Double.pi/2)
    private var endPoint = CGFloat(3*Double.pi/2)

    func createCirclePath(radius: Int){
        //initialize circle progress bar
        
        //set the path for drawing the progress bar
        //TODO: Change radius to adapt with phone settings
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius:CGFloat(radius), startAngle: startPoint, endAngle: endPoint, clockwise: true)
        
        //set the layer path to follow circle path
        circleLayer.path = circlePath.cgPath
        //progressLayer.path = circlePath.cgPath

        //config the layers
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 20
        circleLayer.strokeEnd = 0

        circleLayer.strokeColor = UIColor(red: 0.66, green: 0.87, blue: 0.30, alpha: 1.00).cgColor
        layer.addSublayer(circleLayer)
        
        /*
        progressLayer.fillColor = UIColor.green.cgColor
        circleLayer.lineWidth = 10
        progressLayer.strokeEnd = 0
        layer.addSublayer(progressLayer)*/
    
    }
    func progressAnimation(duration: TimeInterval){
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        circleLayer.add(circularProgressAnimation, forKey: "progressAnim")
        
    }
    func pauseAnimation() {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0
        layer.timeOffset = pausedTime
    }

    func resumeAnimation() {
        let pausedTime = layer.timeOffset
        layer.speed = 1
        layer.timeOffset = 0
        layer.beginTime = 0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
