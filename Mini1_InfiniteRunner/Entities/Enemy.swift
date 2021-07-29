//
//  Enemy.swift
//  Mini1_InfiniteRunner
//
//  Created by Thiago de Oliveira Sousa on 23/07/21.
//

import SpriteKit

class Enemy: SKSpriteNode {
    
    var imageNamed: String
    
    init(image: String, position: CGPoint) {
        self.imageNamed = image
        let texture = SKTexture(imageNamed: imageNamed)
        
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        self.setScale(2.0)
        self.position = position
        self.zPosition = 1
        self.name = "enemy"
        self.physicsBody = createEnemyBody(imageNamed: image)
        self.zPosition = 8
        
        // Alterar o anchorPoint só altera a imagem, nao alteraa a posicao do node
        //self.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension Enemy {
    
    private func createEnemyBody(imageNamed: String) -> SKPhysicsBody{
        //let body = SKPhysicsBody(texture: SKTexture(imageNamed: imageNamed), size: CGSize(width: self.size.width, height: self.size.height*0.8))
     
        let body = SKPhysicsBody(texture: SKTexture(imageNamed: imageNamed), size: self.size)
 
        
        body.affectedByGravity = true
        body.allowsRotation = false
        body.isDynamic = false
        body.categoryBitMask = UInt32(mask.enemy.rawValue)
        body.contactTestBitMask = UInt32(mask.player.rawValue) | UInt32(mask.candy.rawValue)
        
        return body
    }
    
    
}
