//
//  GameScene.swift
//  Mini1_InfiniteRunner
//
//  Created by Team 10 on 12/07/21.
//

import  UIKit
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    // Propriedades globais
    let generator = UIImpactFeedbackGenerator()
    
    // propriedades que vao definir o controle de velocidade
    var renderTiming: TimeInterval = 1
    var seconds: TimeInterval = 1.9
    var enemySpeed: TimeInterval = 2.5
    var candyTiminig: TimeInterval = 3
    //--------------------------------------------------------
    
    let player = Player(imageName: "Personagem_lado")
    
    var cameraNode = SKCameraNode()
    //--------------------------------------------------------
    
    // Contador de doces
    var countCandy = 0
    
    // Contador de distancia
    var meters: Float = 0.0
    
    var hud: HUD!
    var endMenu: EndMenu!
    
    // Constantes usadas na configuração do som
    static let sharedGS = MainMenuScene(size: CGSize(width: 844, height: 390) )
    let audioNode = SKAudioNode(fileNamed: "Sound8bitGameStarted.wav")
    
    
    override init(size: CGSize) {
        
        super.init(size: size)
        //self.hud.clearMeters()
        
        
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
        
        //pauseButton()
        
        
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position.x = size.width/2
        cameraNode.position.y = size.height/2
        boundsCamera()
        
        // MARK:- TELAS DE HUD E FIM
        self.hud = HUD(view: self, camera: self.cameraNode)
        self.endMenu = EndMenu(view: self, camera: cameraNode)
        
        
        
        self.generator.prepare()
        
        if !MainMenuScene.flag {
            /*
                    audioNode.autoplayLooped = true
                    audioNode.name = "AudioGameStarted"
                    audioNode.run(.changeVolume(by: 0.10, duration: 0))
                    self.addChild(audioNode)
                } else {
                    self.removeChildren(in: [self.audioNode] )
                   // audioNode.run(.changeVolume(to: 0.0, duration: 0))*/
            Sounds.shared.playSoundGameStarted()
                }
        /*
        if UserDefaults.standard.stateMusic() == true {
            Sounds.shared.playSoundGameStarted()
                    
        }else{
            Sounds.shared.pause()
        }*/
        
        
        
    }

    
    
    
    override func didMove(to view: SKView) {
        //HUDScoreLabel()
        
        // Iniciando os elementos do HUD na tela
        self.hud.pauseButtonHUD()
        self.hud.pumpkinHUD()
        self.hud.countCandyLabelHUD()
        self.hud.metersLabelHUD()
        self.hud.startCountMeters()
        
        
        
        
        //HUDMetersCount()
        addSwipeGestureRecognizers()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            if let node = self.atPoint(location) as? SKSpriteNode{
                
                touchPaused(node: node)
                
                
            }
        }
    }
    

    
    // Ações que ocorrem ao clicar nos botoes da tela de pause
    func touchPaused(node: SKSpriteNode) {
        switch node.name {
        case "pauseButton":
            let generator = UIImpactFeedbackGenerator()
            generator.impactOccurred()
            hud.pauseGame()
        case "playButtom":
            let generator = UIImpactFeedbackGenerator()
            generator.impactOccurred()
            hud.playGame()
        case "mainButton":
            let generator = UIImpactFeedbackGenerator()
            generator.impactOccurred()
            ActionManage.shared.sceneTransition(self, toScene: .MainMenuScene)
        
        case "soundButton":
            let generator = UIImpactFeedbackGenerator()
            generator.impactOccurred()
            if MainMenuScene.flag {
                self.hud.soundButton.texture = SKTexture(imageNamed: "button_sound_on")
                
                Sounds.shared.playSoundGameStarted()
                MainMenuScene.flag = false
            } else {
               
                self.hud.soundButton.texture = SKTexture(imageNamed: "button_sound_off")
                Sounds.shared.pause()
                MainMenuScene.flag = true
            }
            
            
        case "homeButton":
            let generator = UIImpactFeedbackGenerator()
            generator.impactOccurred()
            ActionManage.shared.sceneTransition(self, toScene: .MainMenuScene)
        case "returnButton":
            let generator = UIImpactFeedbackGenerator()
            generator.impactOccurred()
            ActionManage.shared.sceneTransition(self, toScene: .GameScene)
        default:
            break
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        moveCamera()
        HUDCameraPosition()
        //endCameraPosition()
        
//        if !player.isAlive {
//            self.endMenu.createhomeButton()
//            endCameraPosition()
//        }
        
        
        
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
    
  
    
    

//    func playSoundGameStarted(){
//        let audioNode = SKAudioNode(fileNamed: "Sound8bitGameStarted.wav")
//        audioNode.autoplayLooped = true
//        audioNode.name = "AudioGameStarted"
//        self.addChild(audioNode)
//        audioNode.run(.changeVolume(by: 0.10, duration: 0))
//    }
//
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
