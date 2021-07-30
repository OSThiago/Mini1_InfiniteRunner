//
//  EndMenu.swift
//  Mini1_InfiniteRunner
//
//  Created by Thiago de Oliveira Sousa on 28/07/21.
//

import SpriteKit

class EndMenu {
    var adsView = true
    
    // GAMESCENE
    let Gameview: SKScene
    let cameraNode: SKCameraNode
    
    // BUTTONS
    let returnButton: SKSpriteNode
    let homeButton: SKSpriteNode
    let adsButton: SKSpriteNode
    
    // IMAGENS
    let backGroundGameover: SKSpriteNode
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
        self.adsButton = SKSpriteNode(imageNamed: "adsButton")
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
            self.createDistance()
            self.createCandy()
            self.createBackGround()
            self.createhomeButton()
            self.createReturnButton()
            self.createAdsButton()
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
    
    func revive(hud: HUD, player: Player) {
        
        
        // Voltar o player na tela
        let revivePlaye = SKAction.run {
            self.Gameview.addChild(player)
        }
        
        // voltar o HUD da tela
        let HUDGame = SKAction.run {
            hud.pumpkinHUD()
            hud.pauseButtonHUD()
            hud.metersLabelHUD()
            hud.countCandyLabelHUD()
        }
        
        // tirar o HUD da morte
        let removeHUD = SKAction.run {
            self.removeAll()
        }
        
        let sequence = SKAction.sequence([removeHUD,HUDGame, revivePlaye])
        
        Gameview.run(sequence)
    }
    
    
    func removeAll() {
        self.backGroundGameover.removeFromParent()
        self.homeButton.removeFromParent()
        self.returnButton.removeFromParent()
        self.candyLabel.removeFromParent()
        self.metersLabel.removeFromParent()
        self.distance.removeFromParent()
        self.candy.removeFromParent()
        self.adsButton.removeFromParent()
    }
    
    
    
    private func createBackGround() {
        backGroundGameover.name = "Gameover"
        backGroundGameover.zPosition = 20
        backGroundGameover.setScale(2.0)
        backGroundGameover.texture?.filteringMode = .nearest
        self.cameraNode.addChild(backGroundGameover)
    }
    
    private func createReturnButton() {
        returnButton.name = "returnButton"
        returnButton.zPosition = 21
        returnButton.setScale(1.4)
        returnButton.texture?.filteringMode = .nearest
        self.cameraNode.addChild(returnButton)
    }
    
    private func createhomeButton() {
        homeButton.name = "homeButton"
        homeButton.zPosition = 22
        homeButton.setScale(1.5)
        homeButton.texture?.filteringMode = .nearest
        self.cameraNode.addChild(homeButton)
    }
    
    private func createAdsButton() {
        if adsView {
            adsButton.name = "adsButton"
            adsButton.zPosition = 22
            adsButton.setScale(2.0)
            adsButton.texture?.filteringMode = .nearest
            self.cameraNode.addChild(adsButton)
        }
    }
    
    private func createDistance() {
        distance.name = "distancia"
        distance.zPosition = 1000
        distance.setScale(1.7)
        distance.texture?.filteringMode = .nearest
        self.cameraNode.addChild(distance)
        
    }
    
    
    private func createCandy() {
        candy.name = "candy"
        candy.zPosition = 22
        candy.setScale(1.5)
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
