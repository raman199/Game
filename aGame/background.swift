//file name: background.swift,
//Author’s name: Ramandeep Kaur,
//Student Number: 301088232,
//Date last Modified: 16 Feb 2019,
//Program description: background
// Revision History:

import SpriteKit
import GameplayKit

class background : GameObject
{
    //constructor
    init()
    {
        super.init(imageString: "background", initialScale: 1.172)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //GameObject Life Cycle Functions
    override func CheckBounds()
    {
           
        // check top boundary
        if(self.position.y <= -1505) // note maybe reset earlier
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        self.position.y = 1864.67
    }
    
    override func Start()
    {
        self.zPosition = 0
        //self.Reset()
        self.dy = 5.0
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        self.position.y -= self.dy!
    }

}

