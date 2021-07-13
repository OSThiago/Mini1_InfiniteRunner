//
//  GameScene.swift
//  Mini1_InfiniteRunner
//
//  Created by Team 10 on 12/07/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    // Propriedades globais
    
    override init(size: CGSize) {
        super.init(size: size)
        
        //Criando a geração de chão(criação e movimentação)
        generateGrounds(time: 2)
    }

    
    
    
    override func didMove(to view: SKView) {
        
        addSwipeGestureRecognizers()
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
