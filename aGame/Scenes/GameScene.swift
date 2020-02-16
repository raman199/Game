
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
   // var cloudSprites: [Cloud] = []
    
    //var config: Config?
    
    
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
        //self.sceneState = .GAME
        //self.config?.sceneState = .GAME
        self.name = "GAME"
        
        // add background
        self.backgroundSprite1 = background()
        self.backgroundSprite1?.position = CGPoint(x: 0, y: 1864.67)
        self.addChild(backgroundSprite1!)
        
        self.backgroundSprite2 = background()
        self.backgroundSprite2?.position = CGPoint(x: 0, y: 177)
        self.addChild(backgroundSprite2!)
        
        // add plane
        self.humanSprite = human()
        self.humanSprite?.position = CGPoint(x: 0, y: -575)
        self.addChild(humanSprite!)
        
        // add island
        self.flowerSprite = flower()
        self.addChild(flowerSprite!)
        
        // add clouds
        for index in 0...3
        {
           // let cloud: Cloud = Cloud()
          //  cloudSprites.append(cloud)
            //self.addChild(cloudSprites[index])
        }
        
     //   let engineSound = SKAudioNode(fileNamed: "engine.mp3")
      //  self.addChild(engineSound)
     //   engineSound.autoplayLooped = true
        
        // preload sounds
//        do {
//            let sounds:[String] = ["thunder", "yay"]
//            for sound in sounds
//            {
//                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
//                let url: URL = URL(fileURLWithPath: path)
//                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
//                player.prepareToPlay()
//            }
//        } catch {
//        }
        
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
        
//        for cloud in cloudSprites
//        {
//            cloud.Update()
//            CollisionManager.squaredRadiusCheck(scene: self, object1: planeSprite!, object2: cloud)
//        }
        
        if(ScoreManager.Lives < 1)
        {
            self.gameManager?.PresentEndScene()
        }
    }
}

