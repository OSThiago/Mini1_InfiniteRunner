
//
//  Player.swift
//  Mini1_InfiniteRunner
//
//  Created by Team 10 on 12/07/21.
//

import SpriteKit

let score = "Score"
let bestScore = "BestScore"

class Player {
    // Propriedades
    private let player: SKSpriteNode
    private let imageName: String
    private var playerSide: PlayerSide
    
    // Inicializadores
    init(imageName: String) {
        self.player = SKSpriteNode(imageNamed: imageName)
        self.imageName = imageName
        self.player.name = "player"
        self.playerSide = .TOP
        self.player.physicsBody = self.intialBody()
        
    }
    
    static let shared = Player(imageName: "Personagem_lado")
    
    func setScore(_ value: Int){
        if value > getBestScore(){
            setBestScore(value)
        }
        UserDefaults.standard.set(value, forKey: score)
        UserDefaults.standard.synchronize()
    }
    
    func getScore() -> Int{
        return UserDefaults.standard.integer(forKey: score)
    }
   
    func setBestScore(_ value: Int){
        UserDefaults.standard.set(value, forKey: bestScore)
        UserDefaults.standard.synchronize()
    }
    
    func getBestScore() -> Int{
        return UserDefaults.standard.integer(forKey: bestScore)
    }

    
    // Metodos
  
    // MARK: - Position
    func setPosition(position: CGPoint) {
        player.position = position
    }
    
    func getPosition() -> CGPoint {
        self.player.position
    }
    
    
    
    
    // MARK: - BODY
    
    func setPhysicsBody(body: SKPhysicsBody) {
        self.player.physicsBody = body
    }
    
    func getNode() -> SKSpriteNode{
        return self.player
    }
    
    // MARK:- playerState
    
    func getPlayerSide() -> PlayerSide {
        return self.playerSide
    }
    
    func setPlayerSide(side: PlayerSide) {
        self.playerSide = side
    }
    
    
}

// MARK:- Extensions

extension Player {
    
    // Função para adicionar o corpo fisico ao node player
    func intialBody() ->SKPhysicsBody{
        let body = SKPhysicsBody(texture: SKTexture(imageNamed: self.imageName), size: CGSize(width: player.size.width, height: player.size.height*(0.6)))//0.6
        
        body.affectedByGravity = true
        body.allowsRotation = false
        body.categoryBitMask = UInt32(mask.player.rawValue)
        body.contactTestBitMask = UInt32(mask.ground.rawValue) | UInt32(mask.enemy.rawValue)
        return body
    }
    
}


enum PlayerSide {
    case TOP, BOTTOM
    
}
