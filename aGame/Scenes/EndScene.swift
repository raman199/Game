//file name: EndScene.swift,
//Author’s name: Ramandeep Kaur,
//Student Number: 301088232,
//Date last Modified: 16 Feb 2019,
//Program description: End Scene
// Revision History:

import UIKit
import AVFoundation
import SpriteKit
import GameplayKit


class EndScene: SKScene {
    
    
    var backgroundSprite1: background?
    var backgroundSprite2: background?
    
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height

        self.name = "END"
        
        // add background
        self.backgroundSprite1 = background()
        self.backgroundSprite1?.position = CGPoint(x: 0, y: 1864.67)
        self.addChild(backgroundSprite1!)
        
        self.backgroundSprite2 = background()
        self.backgroundSprite2?.position = CGPoint(x: 0, y: 177)
        self.addChild(backgroundSprite2!)
        
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self))}
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self))}
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self))}
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self))}
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        self.backgroundSprite1?.Update()
        self.backgroundSprite2?.Update()
    
    }
}

