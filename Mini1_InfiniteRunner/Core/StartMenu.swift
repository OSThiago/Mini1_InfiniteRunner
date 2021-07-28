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
    let logo: SKSpriteNode
    let playButton: SKSpriteNode
    let scoreButton: SKSpriteNode
    
    
    init(view: SKScene) {
        // Propriedades da gameScene
        self.GameView = view
        
        // Imagens
        self.backGround = SKSpriteNode(imageNamed: "BG_menu")
        self.logo = SKSpriteNode(imageNamed: "name")
        self.playButton = SKSpriteNode(imageNamed: "button_play")
        self.scoreButton = SKSpriteNode(imageNamed: "button_score")
        
    }
    
    // MARK:- BACKGROUND
    
    func createbackGroundHUD() {
        backGround.name = "backGround"
        backGround.zPosition = -3
        backGround.position = CGPoint(x: GameView.frame.width*0.0, y: GameView.frame.height*0.0)
        // Escala do backGround funciona diferente. Ele pega o tamanho em relacao ao fra
        backGround.size = CGSize(width: GameView.frame.width, height: GameView.frame.height)
        backGround.texture?.filteringMode = .nearest
        GameView.addChild(backGround)
    }
    
    // MARK: - TITULO LOGO
    
    func createLogo() {
        logo.name = "logo"
        logo.zPosition = 1
        logo.position = CGPoint(x: GameView.frame.width*0.0, y: GameView.frame.height*0.1)
        logo.setScale(2.0)
        logo.texture?.filteringMode = .nearest
        GameView.addChild(logo)
        
    }
    
    
    func createPlayButtom() {
        playButton.name = "playButton"
        playButton.zPosition = 1
        playButton.position = CGPoint(x: GameView.frame.width*0.0, y: GameView.frame.height*(-0.2))
        playButton.setScale(1.5)
        playButton.texture?.filteringMode = .nearest
        GameView.addChild(playButton)
    }
    
    func createGameCenterButtom() {
        
    }
    
    
    
}



extension StartMenu {
    
    
    
    
}
