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
    
    // propriedades que vao definir o controle de velocidade
    var renderTiming: TimeInterval = 1
    var seconds: TimeInterval = 1.9
    var enemySpeed: TimeInterval = 2.5
    var candyTiminig: TimeInterval = 7
    //--------------------------------------------------------
    
    let player = Player(imageName: "Personagem_lado")
    
    var cameraNode = SKCameraNode()
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.playSoundGameStarted()
        
        self.physicsWorld.contactDelegate = self
        
        //Criando a geração de chão(criação e movimentação)
        initialGround(time: 1.9)
        
        // Adicionando o Player a cena
        let initalPosition = CGPoint(x: size.width*0.5, y: size.height*0.7)
        
        self.addChild(player)
        self.player.position = initalPosition
        
        
        parallax()
        // Adicionando inimigos a cena
        generateCandy(speed: 2.5, time: candyTiminig)
        generatEnemys(time: 2.5)
        
        
        //iniciar a animacao de corrida do personagem
        player.runner()
        player.texture?.filteringMode = .nearest
        
        pauseButton()
        
        
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position.x = size.width/2
        cameraNode.position.y = size.height/2
        boundsCamera()
        
        
        
        
        
    }

    
    
    
    override func didMove(to view: SKView) {
        
        addSwipeGestureRecognizers()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            if let node = self.atPoint(location) as? SKSpriteNode{
                if (node.name == "pauseButton"){
                    self.scene?.view?.isPaused = true
                }
                if(node.name != "pauseButton"){
                    self.scene?.view?.isPaused = false
                }
            }
        }
    }
    
    func pauseButton(){
        let pauseButton = SKSpriteNode(imageNamed: "pauseButton")
        pauseButton.name = "pauseButton"
        pauseButton.position = CGPoint(x: 807, y: 356)
        pauseButton.size = CGSize(width: 35, height: 35)
        addChild(pauseButton)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if player.position.x != size.width/2{
            player.position.x = size.width/2
        }
        
        
        // atualiza o seconds a cada segundo
        if currentTime > renderTiming{
            if renderTiming > 0{
                //certifica que o tempo vai ser maior que 0.5
                if seconds > 0.5{
                    enemySpeed -= 0.01
                    seconds -= 0.01
                }
            }
                renderTiming = currentTime+1
        }
        // Called before each frame is rendered
        
        
        moveCamera()
        
    }
    
    
    func playSoundGameStarted(){
        let audioNode = SKAudioNode(fileNamed: "SoundGameStarted.wav")
        audioNode.autoplayLooped = true
        audioNode.name = "AudioGameStarted"
        self.addChild(audioNode)
        audioNode.run(.changeVolume(by: 0.25, duration: 0))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
