//file name: GameViewController.swift,
//Author’s name: Ramandeep Kaur,
//Student Number: 301088232,
//Date last Modified: 16 Feb 2019,
//Program description: View controller of game
// Revision History:

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, GameManager {
    
     // button outlets
    @IBOutlet weak var BackButtonOutlet: UIButton!
    @IBOutlet weak var StartButtonOutlet: UIButton!
   
    
    // label outlets
      
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var StartLabel: UIImageView!
   
   // @IBOutlet weak var LivesLabel: UILabel!
    
    
    var currentScene: SKScene?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        BackButtonOutlet.isHidden = true
        ScoreLabel.isHidden = true
        
        CollisionManager.gameViewController = self
        
        SetScene(sceneName: "StartScene")
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScoreLabel() -> Void
    {
        ScoreLabel.text  = "Score: \(ScoreManager.Score)"
    }
    
   // func updateLivesLabel() -> Void
   // {
      //  LivesLabel.text = "Lives: \(ScoreManager.Lives)"
   // }
    
    
    func SetScene(sceneName: String)
    {
        if let view = self.view as! SKView?
        {
            // Load the SKScene from 'GameScene.sks'
            currentScene = SKScene(fileNamed: sceneName)
            
            if let gameScene = currentScene as? GameScene
            {
                gameScene.gameManager = self
            }
            
            // Set the scale mode to scale to fit the window
            currentScene?.scaleMode = .aspectFill
                
            // Present the scene
            view.presentScene(currentScene)
            
            
            view.ignoresSiblingOrder = true
        
        }
    }
    
    func PresentStartScene() {
        StartButtonOutlet.isHidden = false
       // LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        StartLabel.isHidden = false
    }
    
    func PresentEndScene() {
        BackButtonOutlet.isHidden = false
       // LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        SetScene(sceneName: "EndScene")
    }
    
    
    @IBAction func StartButton_Press(_ sender: Any)
    {
        StartButtonOutlet.isHidden = true
        StartLabel.isHidden = true
       // LivesLabel.isHidden = false
        ScoreLabel.isHidden = false
       // updateLivesLabel()
        updateScoreLabel()
        SetScene(sceneName: "GameScene")
        
    }
    
    @IBAction func BackButton_Press(_ sender: Any)
    {
        BackButtonOutlet.isHidden = true
       // LivesLabel.isHidden = false
        ScoreLabel.isHidden = false
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
       // updateLivesLabel()
        updateScoreLabel()
        SetScene(sceneName: "GameScene")
    }
    
    
}

