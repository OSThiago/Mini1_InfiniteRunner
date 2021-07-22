
//
//  Player.swift
//  Mini1_InfiniteRunner
//
//  Created by Team 10 on 12/07/21.
//

import SpriteKit

class Player: SKSpriteNode {
    // Propriedades
    var imageNamed: String
    private var playerSide: PlayerSide
    
    // Inicializadores
    init(imageName: String) {
        
        self.imageNamed = imageName
        let texture = SKTexture(imageNamed: imageName)
        
        self.playerSide = .TOP
        
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
       
        self.name = "player"
        self.zPosition = 1
        self.physicsBody = createBody()
        
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
        self.position = position
    }
    
    func getPosition() -> CGPoint {
        self.position
    }

    
    // MARK:- playerState
    
    func getPlayerSide() -> PlayerSide {
        return self.playerSide
    }
    
    func reversePlayerSide() {
        switch self.playerSide {
        case .TOP:
            self.playerSide = .BOTTOM
        case .BOTTOM:
            self.playerSide = .TOP
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK:- Extensions

extension Player {
    
    // Função para adicionar o corpo fisico ao node player
    func createBody() ->SKPhysicsBody{
        let body = SKPhysicsBody(texture: SKTexture(imageNamed: self.imageNamed), size: CGSize(width: self.size.width, height: self.size.height*(0.6)))//0.6
        
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
