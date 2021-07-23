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
    var seconds: TimeInterval = 2
    //--------------------------------------------------------
    
    let player = Player(imageName: "Personagem_lado")
   
    
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.physicsWorld.contactDelegate = self
        
        //Criando a geração de chão(criação e movimentação)
        initialGround(time: seconds)
        
        // Adicionando o Player a cena
        let initalPosition = CGPoint(x: size.width*0.5, y: size.height*0.8)
        
        self.addChild(player)
        player.setPosition(position: initalPosition)
        
        parallax()
        // Adicionando inimigos a cena
        generatEnemys(time: 2.0)
        
        
        
        pauseButton()
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
                    seconds -= 0.01
                }
            }
                renderTiming = currentTime+1
        }
        // Called before each frame is rendered
        
        
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
