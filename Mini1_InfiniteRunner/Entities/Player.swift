
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
    var isJuping: Bool = false
    var isAlive = true
    private var playerSide: PlayerSide
    static let sharedMMS = MainMenuScene(size: CGSize(width: 844.0, height: 390.0))
    
    // Inicializadores
    init(imageName: String) {
        
        self.imageNamed = imageName
        let texture = SKTexture(imageNamed: imageName)
        
        self.playerSide = .TOP
        
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
       
        self.name = "player"
        self.zPosition = 1
        self.xScale = self.xScale*1.5
        self.physicsBody = createBody()
        
        
        
    }
    
    func runner(){
        self.run(.repeatForever(.animate(with: .init(format: "Running_character%@", frameCount: 1...4), timePerFrame: 0.1)))
    }
    
    // MARK: - Position
//    func setPosition(position: CGPoint) {
//        self.position = position
//    }
//    
//    func getPosition() -> CGPoint {
//        self.position
//    }

    
    // MARK:- playerState
    
    func getPlayerSide() -> PlayerSide {
        return self.playerSide
    }
    
    func reversePlayerSide() {
        switch self.playerSide {
        case .TOP:
            self.playerSide = .BOTTOM
            if !MainMenuScene.flag{
                self.playReverseSoundDown()
            }
        case .BOTTOM:
            self.playerSide = .TOP
            if !MainMenuScene.flag{
                self.playReverseSoundUp()
            }
            
        }
    }
    
    func playReverseSoundUp(){
        let reverseSoundUp: SKAction = {
            return SKAction.playSoundFileNamed("SoundReverseUp.wav", waitForCompletion: false)
        }()
        self.run(reverseSoundUp)
        self.run(.changeVolume(to: 2, duration: 0))
    }
    
    func playReverseSoundDown(){
        let reverseSoundDown: SKAction = {
            return SKAction.playSoundFileNamed("SoundReverseDown.wav", waitForCompletion: false)
        }()
        self.run(reverseSoundDown)
        self.run(.changeVolume(to: 2, duration: 0))
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


extension Array where Element == SKTexture{
    init(format: String, frameCount: ClosedRange<Int>){
        self = frameCount.map({ (index) in
            let imageName = String(format: format, "\(index)")
            return SKTexture(imageNamed: imageName)
        })
        
    }
}
