//file name: flower.swift,
//Author’s name: Ramandeep Kaur,
//Student Number: 301088232,
//Date last Modified: 16 Feb 2019,
//Program description: flower
// Revision History:

import SpriteKit
import GameplayKit

class flower: GameObject
{
    
    
    //constructor
    init()
    {
        super.init(imageString: "flower", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Life Cycle Functions
    override func CheckBounds()
    {
        // bottom boundary
        if(self.position.y < -715)
        {
            self.Reset()
        }
        
        // right boundary
        if(self.position.x >= 307 - self.halfWidth!)
        {
            self.position.x = 307 - self.halfWidth!
        }
        
        // left boundary
        if(self.position.x <= -307 + self.halfWidth!)
        {
            self.position.x = -307 + self.halfWidth!
        }
    }
    
    func Move()
    {
        self.position.y -= self.dy!
    }
    
    override func Reset()
    {
        self.position.y = 715
        let randomX:Int = (randomSource?.nextInt(upperBound: 614))! - 307
        self.position.x = CGFloat(randomX)
        self.isColliding = false
    }
    
    override func Start()
    {
        self.zPosition = 1
        self.Reset()
        self.dy = 5.0
    }
    
    override func Update()
    {
        self.Move()
        self.CheckBounds()
    }
}

