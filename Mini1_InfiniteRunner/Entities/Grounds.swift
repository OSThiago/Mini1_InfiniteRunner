//
//  Grounds.swift
//  Mini1_InfiniteRunner
//
//  Created by Thiago de Oliveira Sousa on 25/07/21.
//

import SpriteKit

class Ground: SKSpriteNode {

  
    init(position: CGPoint) {
        let texture = SKTexture(imageNamed: "tilefloor4")
        
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        self.position = position
        self.name = "Ground"
        self.physicsBody = createBody()
        self.setScale(2.5)
        self.zPosition = 2
    }
    
    // Criando um corpo fisico para o chao
    func createBody() -> SKPhysicsBody{
        let body = SKPhysicsBody(rectangleOf: self.size)
        body.affectedByGravity = true
        body.allowsRotation = false
        body.isDynamic = false
        body.categoryBitMask = UInt32(mask.ground.rawValue)
        body.contactTestBitMask = UInt32(mask.player.rawValue)
        return body
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
