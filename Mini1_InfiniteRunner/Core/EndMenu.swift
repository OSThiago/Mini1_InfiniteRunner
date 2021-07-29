//
//  EndMenu.swift
//  Mini1_InfiniteRunner
//
//  Created by Thiago de Oliveira Sousa on 28/07/21.
//

import SpriteKit

class EndMenu {
    // GAMESCENE
    let Gameview: SKScene
    let cameraNode: SKCameraNode
    // IMAGENS
    let backGroundGameover: SKSpriteNode
    let returnButton: SKSpriteNode
    let homeButton: SKSpriteNode
    // TEXTOS
    let countCandyLabel: SKLabelNode
    let metersLabel: SKLabelNode
    
    
    init(view: SKScene, camera: SKCameraNode) {
        // Propriedades da gameScene
        self.Gameview = view
        self.cameraNode = camera
        
        // Imagens
        self.backGroundGameover = SKSpriteNode(imageNamed: "Gameover")
        self.returnButton = SKSpriteNode(imageNamed: "returnButton")
        self.homeButton = SKSpriteNode(imageNamed: "homeButton")
        
        // Textos
        self.countCandyLabel = SKLabelNode(fontNamed: "HelveticaNeue-CondensedBold")
        self.metersLabel = SKLabelNode(fontNamed: "HelveticaNeue-CondensedBold")
        
    }
    
    func createBackGround() {
        backGroundGameover.name = "Gameover"
        backGroundGameover.zPosition = 12
        backGroundGameover.setScale(2.5)
        backGroundGameover.texture?.filteringMode = .nearest
        self.cameraNode.addChild(backGroundGameover)
    }
    
    func createReturnButton() {
        returnButton.name = "returnButton"
        returnButton.zPosition = 13
        returnButton.setScale(2.5)
        returnButton.texture?.filteringMode = .nearest
        self.cameraNode.addChild(returnButton)
    }
    
    func createhomeButton() {
        homeButton.name = "homeButton"
        homeButton.zPosition = 13
        homeButton.setScale(2.5)
        homeButton.texture?.filteringMode = .nearest
        self.cameraNode.addChild(homeButton)
    }
    
    
    func pauseGame() {
        let playAction = SKAction.run {
            // Colocando na tela antes de parar o jogo
            self.createBackGround()
            self.createReturnButton()
            self.createhomeButton()
            
        }
        let pauseAction = SKAction.run {
            self.Gameview.scene?.view?.isPaused = true
        }
        let sequence = SKAction.sequence([playAction,pauseAction])
        Gameview.run(sequence)
    }
    
    
    
}
