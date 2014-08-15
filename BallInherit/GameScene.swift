//
//  GameScene.swift
//  BallInherit
//
//  Created by Robert Bailey on 8/15/14.
//  Copyright (c) 2014 Robert Bailey. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var myBall:Ball!
    
    override func didMoveToView(view: SKView) {
        
        myBall = Ball(size: CGSizeMake(100,100),color: SKColor.purpleColor())
        self.addChild(myBall)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // touch the screen and it starts bobbing up and down.
        myBall.toggleBobbing()
      }
    
    override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {
     }
   
    override func update(currentTime: CFTimeInterval) {
        // notice that the code is located in the Ball class so this is much more simple.
        myBall.update()

    }
}
