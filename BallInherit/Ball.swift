//
//  Ball.swift
//  BallInherit
//
//  Created by Robert Bailey on 8/15/14.
//  Copyright (c) 2014 Robert Bailey. All rights reserved.
//

import Foundation
import SpriteKit

class Ball : SKShapeNode {
    
    // variables for bobbing action
    var bobbing = false
    var bobAngle = 0.0
    var bobCenterY = 0.0
    var bobRange = 50.0
    var bobSpeed = 0.05
    
    // variables for pulsing action
    var pulsing = true
    var pulseAngle = 0.0
    var pulseCenterScale = 1.0
    var pulseRange = 0.1
    var pulseSpeed = 0.1
    
    // this is needed in case you declare something like:
    //   var myBall = Ball()
    override init() {
        // this is the ONLY place you can call super.init()
        // any uninitialized variables that you have added will need to be updated here.
        super.init()
    }
    
    // here's the convenience initializer that we will use most of the time.
    convenience init(size:CGSize, color:SKColor) {
        // you need to call self.init() to get the self pointers and intrinsic SKShapeNode values 
        //    set up correctly.
        self.init()
        
        // now this should be familiar
        let circle = CGRectMake(0-size.width/2,0-size.height/2, size.width, size.height)
        self.init(ellipseInRect: circle)
        self.fillColor = color
        self.strokeColor = nil
        
    }
  
    func toggleBobbing() {
        bobbing = !bobbing
    }
    
    // notice this is not an override...  the SKShapeNode hierarchy does not have update()
    //   as a function...
    func update() {
        if pulsing {
            self.setScale(CGFloat(pulseCenterScale + sin(pulseAngle) * pulseRange))
            pulseAngle += pulseSpeed
        }
        if bobbing {
            self.position.y = CGFloat( bobCenterY + sin(bobAngle) * bobRange)
            bobAngle += bobSpeed
    
        }
    }
    
    // this is required to satisfy the NSCoder requirements to make this object encodable.
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
}