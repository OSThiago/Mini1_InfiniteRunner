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
    var musicButton: SKSpriteNode
    let coruja: SKSpriteNode
    
    init(view: SKScene) {
        // Propriedades da gameScene
        self.GameView = view
        
        // Imagens
        self.backGround = SKSpriteNode(imageNamed: "BG_menu")
        self.logo = SKSpriteNode(imageNamed: "name_1")
        self.playButton = SKSpriteNode(imageNamed: "playButton")
        self.scoreButton = SKSpriteNode(imageNamed: "gameCenterButton")
        self.musicButton = SKSpriteNode(imageNamed: "button_sound_on")
        self.coruja = SKSpriteNode(imageNamed: "coruja_1")
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
        var textures = [SKTexture]()
        for i in 1...4 {
            let texture = SKTexture(imageNamed: "name_\(i)")
            texture.filteringMode = .nearest
            textures.append(texture)
        }
        logo.name = "logo"
        logo.zPosition = 1
        logo.position = CGPoint(x: GameView.frame.width*0.0, y: GameView.frame.height*0.1)
        logo.setScale(2.0)
        logo.run(.repeatForever(.animate(with: textures, timePerFrame: 0.1)))
        logo.texture?.filteringMode = .nearest
        GameView.addChild(logo)
        
     
    }
    
    // MARK: - Coruja
    func createCoruja() {
        var textures = [SKTexture]()
        for i in 1...4 {
            let texture = SKTexture(imageNamed: "coruja_\(i)")
            texture.filteringMode = .nearest
            textures.append(texture)
        }
        coruja.name = "coruja"
        coruja.zPosition = 1
        coruja.position = CGPoint(x: GameView.frame.width*(-0.4), y: GameView.frame.height*0.09)
        coruja.setScale(1.7)
        let tempo = SKAction.wait(forDuration: 2.0)
        let animacao = SKAction.animate(with: textures, timePerFrame: 0.1)
        let sequence = SKAction.sequence([animacao,tempo])
        coruja.run(.repeatForever(sequence))
        coruja.texture?.filteringMode = .nearest
        GameView.addChild(coruja)
        
     
    }
    
    // MARK: - Play BUTTON
    func createPlayButtom() {
        playButton.name = "playButton"
        playButton.zPosition = 1
        playButton.position = CGPoint(x: GameView.frame.width*0.0, y: GameView.frame.height*(-0.25))//-2
        playButton.setScale(1.5)
        playButton.texture?.filteringMode = .nearest
        GameView.addChild(playButton)
    }
    
    // MARK: - MUSIC BUTTON
    func createMusicButtom() {
        musicButton.name = "soundButton"
        musicButton.zPosition = 1
        musicButton.position = CGPoint(x: GameView.frame.width*(0.4), y: GameView.frame.height*(0.35))
        musicButton.setScale(2.0)
        musicButton.texture?.filteringMode = .nearest
        GameView.addChild(musicButton)
    }
    
    // MARK: - GAMECENTER BUTTON
    func createGameCenterButtom() {
        scoreButton.name = "gameCenterButton"
        scoreButton.zPosition = 1
        scoreButton.position = CGPoint(x: GameView.frame.width*(0.33), y: GameView.frame.height*(0.35))
        scoreButton.setScale(2.0)
        scoreButton.texture?.filteringMode = .nearest
        GameView.addChild(scoreButton)
    }
    
    
    
}


