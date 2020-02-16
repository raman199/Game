//file name: human.swift,
//Author’s name: Ramandeep Kaur,
//Student Number: 301088232,
//Date last Modified: 16 Feb 2019,
//Program description: human
// Revision History:

import SpriteKit

class human: GameObject
{
    // constructor
    init()
    {
        super.init(imageString: "human", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func CheckBounds()
    {
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
    
    override func Reset()
    {
        
    }
    
    override func Start()
    {
        self.zPosition = 2
    }
    
    override func Update()
    {
        self.CheckBounds()
    }
    
    func TouchMove(newPos: CGPoint)
    {
        self.position = newPos
    }
}

