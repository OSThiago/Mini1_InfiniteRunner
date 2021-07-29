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
    let distance: SKSpriteNode
    let candy: SKSpriteNode
    
    // TEXTOS
    let candyLabel: SKLabelNode
    let metersLabel: SKLabelNode
    
    
    init(view: SKScene, camera: SKCameraNode) {
        // Propriedades da gameScene
        self.Gameview = view
        self.cameraNode = camera
        
        // Imagens
        self.backGroundGameover = SKSpriteNode(imageNamed: "Gameover")
        self.returnButton = SKSpriteNode(imageNamed: "returnButton")
        self.homeButton = SKSpriteNode(imageNamed: "homeButton")
        self.distance = SKSpriteNode(imageNamed: "distancia")
        self.candy = SKSpriteNode(imageNamed: "doces")
        
        // Textos
        self.candyLabel = SKLabelNode(fontNamed: "HelveticaNeue-CondensedBold")
        self.metersLabel = SKLabelNode(fontNamed: "HelveticaNeue-CondensedBold")
        
    }
    
    
    // MARK:- Colocando o HUD da tela final
    
    func gameOverHud(candy: Int, meters: Int) {
        
        
        let addElements = SKAction.run {
            // Imagens
            self.removeAll()
            self.createBackGround()
            self.createhomeButton()
            self.createReturnButton()
            self.createCandy()
            self.createDistance()
            // Textos
            self.createCandyLabel(candy: candy)
            self.createMetersLabel(meters: meters)
        }
        
        let pauseAction = SKAction.run {
            self.Gameview.scene?.view?.isPaused = true
        }
        let sequence = SKAction.sequence([addElements,pauseAction])
        Gameview.run(sequence)
        
    }
    
    
    func removeAll() {
        self.backGroundGameover.removeFromParent()
        self.homeButton.removeFromParent()
        self.returnButton.removeFromParent()
        self.candyLabel.removeFromParent()
        self.metersLabel.removeFromParent()
        self.candy.removeFromParent()
        self.distance.removeFromParent()
    }
    
    
    
    private func createBackGround() {
        backGroundGameover.name = "Gameover"
        backGroundGameover.zPosition = 20
        backGroundGameover.setScale(2.5)
        backGroundGameover.texture?.filteringMode = .nearest
        self.cameraNode.addChild(backGroundGameover)
    }
    
    private func createReturnButton() {
        returnButton.name = "returnButton"
        returnButton.zPosition = 21
        returnButton.setScale(2.3)
        returnButton.texture?.filteringMode = .nearest
        self.cameraNode.addChild(returnButton)
    }
    
    private func createhomeButton() {
        homeButton.name = "homeButton"
        homeButton.zPosition = 22
        homeButton.setScale(2.5)
        homeButton.texture?.filteringMode = .nearest
        self.cameraNode.addChild(homeButton)
    }
    
    
    private func createDistance() {
        distance.name = "distance"
        distance.zPosition = 22
        distance.setScale(2.0)
        distance.texture?.filteringMode = .nearest
        self.cameraNode.addChild(distance)
        
    }
    
    private func createCandy() {
        candy.name = "candy"
        candy.zPosition = 22
        candy.setScale(2.0)
        candy.texture?.filteringMode = .nearest
        self.cameraNode.addChild(candy)
    }
    
    private func createCandyLabel(candy: Int) {
        candyLabel.fontName = "Early GameBoy"
        candyLabel.zPosition = 25
        candyLabel.fontColor = .white
        candyLabel.setScale(0.5)
        candyLabel.name = "candyLabel"
        candyLabel.horizontalAlignmentMode = .left
        candyLabel.text = "\(candy)"
        cameraNode.addChild(candyLabel)
    }
    
    private func createMetersLabel(meters: Int) {
        metersLabel.fontName = "Early Gameboy"
        metersLabel.zPosition = 25
        metersLabel.fontColor = .white
        metersLabel.setScale(0.5)
        metersLabel.name = "metersLabel"
        metersLabel.horizontalAlignmentMode = .left
        metersLabel.text = "\(meters)"
        cameraNode.addChild(metersLabel)
    }
    
}
