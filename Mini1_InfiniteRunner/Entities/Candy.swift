//
//  Candy.swift
//  Mini1_InfiniteRunner
//
//  Created by Thiago de Oliveira Sousa on 25/07/21.
//

import SpriteKit

class Candy: SKSpriteNode {
    // Propriedades
    let imageNamed: String
    
    // Inicializadores
    init(image: String, position: CGPoint){
        // Colo aqui as propriedades
        self.imageNamed = image
        let texture = SKTexture(imageNamed: image)
        
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        // Coloco aqui os acesso herdados do SKSpriteNode
        self.position = position
        self.zPosition = 1
        self.name = "candy"
        self.setScale(2.0)
        self.physicsBody = createBody(imageNamed: image)
        
    }
    
    // Metodos
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK:- Extensao do coletavel Candy

extension Candy {
    
    private func createBody(imageNamed image: String) -> SKPhysicsBody {
        let body = SKPhysicsBody(texture: SKTexture(imageNamed: image), size: self.size)
        body.affectedByGravity = false
        body.allowsRotation = false
        body.isDynamic = true
        body.categoryBitMask = UInt32(mask.candy.rawValue)
        body.contactTestBitMask = UInt32(mask.player.rawValue) | UInt32(mask.enemy.rawValue)
        return body
    }
    
    
}

