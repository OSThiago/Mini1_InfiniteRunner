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
    let generator = UIImpactFeedbackGenerator()
    
    // propriedades que vao definir o controle de velocidade
    var renderTiming: TimeInterval = 1
    var seconds: TimeInterval = 1.9
    var enemySpeed: TimeInterval = 2.5
    var candyTiminig: TimeInterval = 7
    //--------------------------------------------------------
    
    let player = Player(imageName: "Personagem_lado")
    
    var cameraNode = SKCameraNode()
    //--------------------------------------------------------
    
    // Contador de doces
    var countCandy = 0
    var countLabel = SKLabelNode(fontNamed: "HelveticaNeue-CondensedBold")
    let pumpkinHUD = SKSpriteNode(imageNamed: "punctuation")
    
    //Contador de distancia
    var meters: Float = 0.0
    var metersLabel = SKLabelNode(fontNamed: "HelveticaNeue-CondensedBold")
    
    
    override init(size: CGSize) {
        super.init(size: size)
        clearMeters()
        
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
        
        
        
        
        self.generator.prepare()
    }

    
    
    
    override func didMove(to view: SKView) {
        HUDScoreLabel()
        HUDPumpkin()
        HUDMetersCount()
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
    
   
    
    
    override func update(_ currentTime: TimeInterval) {
        
        moveCamera()
        HUDCameraPosition()
        
        
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
        
        
    }
    
    
    //FUNÇÃO PARA LIMPAR A QUANTIDADE DE METROS E INICIAR A CONTAGEM
    func clearMeters(){
        self.meters = 0
        GameScene.sharedGVC.distanceReachedInOneGame = 0
        //countMeters()
    }
    
    //FUNÇÃO PARA LIMPAR O LABEL DA CONTAGEM
    func clearLabelCount(){
        self.metersLabel.removeAllActions()
    }
    
    //FUNÇÃO PARA FAZER A SOMA DE METROS E DE ALTERAR O LABEL
    func countMeters(){
        let sequence = SKAction.sequence([SKAction.run {
            self.meters += 10
            self.metersLabel.text = "\(self.meters)"
            GameScene.sharedGVC.distanceReachedInOneGame = self.meters
        },
        SKAction.wait(forDuration: 0.2)
        ])
        self.metersLabel.run(SKAction.repeatForever(sequence))
    }
    
    
    func metersCountLabel(){
        self.metersLabel = SKLabelNode(text: "0m")
        self.metersLabel.fontSize = 40
        self.metersLabel.position = CGPoint(x: 300, y: 150)
        self.addChild(metersLabel)
        countMeters()
    }
    
    
    
    
    func playSoundGameStarted(){
        let audioNode = SKAudioNode(fileNamed: "Sound8bitGameStarted.wav")
        audioNode.autoplayLooped = true
        audioNode.name = "AudioGameStarted"
        self.addChild(audioNode)
        audioNode.run(.changeVolume(by: 0.25, duration: 0))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
