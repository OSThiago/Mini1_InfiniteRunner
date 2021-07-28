//
//  StartMenu.swift
//  Mini1_InfiniteRunner
//
//  Created by Thiago de Oliveira Sousa on 28/07/21.
//

import SpriteKit

class StartMenu {
    
    // Propriedades
    let GameView: SKScene
    
    let backGround: SKSpriteNode
    
    init(view: SKScene) {
        // Propriedades da gameScene
        self.GameView = view
        
        // Imagens
        self.backGround = SKSpriteNode(imageNamed: "BG_menu")
        
    }
    
    // MARK:- BACKGROUND
    
    func CreatebackGroundHUD() {
        backGround.name = "backGround"
        backGround.zPosition = -3
        backGround.position = CGPoint(x: GameView.frame.width*0.0, y: GameView.frame.height*0.0)
        // Escala do backGround funciona diferente. Ele pega o tamanho em relacao ao fra
        backGround.size = CGSize(width: GameView.frame.width, height: GameView.frame.height)
        backGround.texture?.filteringMode = .nearest
        GameView.addChild(backGround)
    }
    
    // MARK: - TITULO LOGO
    
    
    
    
}



extension StartMenu {
    
    
    
    
}
