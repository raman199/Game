//file name: GameScene.swift,
//Author’s name: Ramandeep Kaur,
//Student Number: 301088232,
//Date last Modified: 16 Feb 2019,
//Program description: Game Scene
// Revision History:
import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?


class GameScene: SKScene {
    
    var gameManager: GameManager?
    
    var backgroundSprite1: background?
    var backgroundSprite2: background?
    var humanSprite: human?
    var flowerSprite: flower?
  
    
    
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
      
        self.name = "GAME"
        
        // add background
        self.backgroundSprite1 = background()
        self.backgroundSprite1?.position = CGPoint(x: 0, y: 1864.67)
        self.addChild(backgroundSprite1!)
        
        self.backgroundSprite2 = background()
        self.backgroundSprite2?.position = CGPoint(x: 0, y: 177)
        self.addChild(backgroundSprite2!)
        
        // add human
        self.humanSprite = human()
        self.humanSprite?.position = CGPoint(x: 0, y: -575)
        self.addChild(humanSprite!)
        
        // add flower
        self.flowerSprite = flower()
        self.addChild(flowerSprite!)
        
      
        
   
        
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        self.humanSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: -575))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        self.humanSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: -575))
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        self.humanSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: -575))
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
        
        self.humanSprite?.Update()
        self.flowerSprite?.Update()
        
        CollisionManager.squaredRadiusCheck(scene: self, object1: humanSprite!, object2: flowerSprite!)
        

        
        if(ScoreManager.Lives < 1)
        {
            self.gameManager?.PresentEndScene()
        }
    }
}

