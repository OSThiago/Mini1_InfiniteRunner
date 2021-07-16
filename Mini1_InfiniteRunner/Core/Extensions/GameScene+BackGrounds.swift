//
//  GameScene+BackGrounds.swift
//  Mini1_InfiniteRunner
//
//  Created by Team 10 on 14/07/21.
//

import SpriteKit

extension GameScene {
    
    // Efeito parallax no backGround
    func parallax() {
        
        initialsBackGrounds()
        
        
       // generationBackGrounds(time: 0, imageName: "plx-3", deph: -7)
        generationBackGrounds(time: 70, imageName: "plx-2", deph: -6)
        generationBackGrounds(time: 45, imageName: "plx-4", deph: -5)
        generationBackGrounds(time: 27, imageName: "plx-5", deph: -4)
        generationBackGrounds(time: 17, imageName: "plx-6", deph: -3)
        generationBackGrounds(time: 3, imageName: "plx-7", deph: -2)
       
        
    }
    
   // Gambiarra para iniciar os primeiros backGrounds no meio da tela
    func initialsBackGrounds() {
        let initialPosition = CGPoint(x: size.width*0.5, y: size.height*0.5)
        
        
        let background = createBackGround(imageName: "plx-1", position: initialPosition, deph: -9)
        let backGround1 = createBackGround(imageName: "plx-3", position: initialPosition, deph: -7)
        self.addChild(background)
        self.addChild(backGround1)
//        let backGround1 = createBackGround(imageName: "plx-3", position: initialPosition, deph: -7)
//
//        moveBackGround(node: backGround1, timeSpeed: 70)
//
        let backGround2 = createBackGround(imageName: "plx-2", position: initialPosition, deph: -6)
        moveBackGround(node: backGround2, timeSpeed: 70)
        self.addChild(backGround2)
        
        let backGround3 = createBackGround(imageName: "plx-4", position: initialPosition, deph: -5)
        moveBackGround(node: backGround3, timeSpeed: 45)
        self.addChild(backGround3)
        
        let backGround4 = createBackGround(imageName: "plx-5", position: initialPosition, deph: -4)
        moveBackGround(node: backGround4, timeSpeed: 27)
        self.addChild(backGround4)

        let backGround5 = createBackGround(imageName: "plx-6", position: initialPosition, deph: -3)
        moveBackGround(node: backGround5, timeSpeed: 17)
        self.addChild(backGround5)

        let backGround6 = createBackGround(imageName: "plx-7", position: initialPosition, deph: -2)
        moveBackGround(node: backGround6, timeSpeed: 3)
        self.addChild(backGround6)
        
        


        
    }
    
    
    
    
    
    // funcao para reaproveitar a geracao do loop do BackGround
    func generationBackGrounds(time: TimeInterval, imageName: String , deph: CGFloat) {
        let initialPosition = CGPoint(x: size.width*1.5, y: size.height*0.50)
        
        // Acao de criar background
        let createBackGround = SKAction.run {
            let _backGround = self.createBackGround(imageName: imageName, position: initialPosition, deph: deph)
            
            self.addChild(_backGround)
            self.moveBackGround(node: _backGround, timeSpeed: time)
            
        }
        
        // Acão de espera
        let waitInBetween = SKAction.wait(forDuration: time)
        
        let sequence = SKAction.sequence([createBackGround, waitInBetween])
        
        let repeatForever = SKAction.repeatForever(sequence)
        
        self.run(repeatForever)
    }
    
    
    // função para criar a movimentacão do BackGround node
    func moveBackGround(node: SKSpriteNode, timeSpeed: TimeInterval) {
        
        // Criando uma ação de movimentacão
        let moveAction = SKAction.moveBy(x: size.width*(-2.5), y: 0, duration: timeSpeed*2.6)
    
        let removeAction = SKAction.removeFromParent()
        
        let sequence = SKAction.sequence([moveAction, removeAction])
        
        node.run(sequence)
    }
    
    // funcao reaproveitavel para todos os backgrounds
    func createBackGround(imageName: String, position: CGPoint, deph: CGFloat) -> SKSpriteNode{
        
        // Criando um node a partir de uma imagem
        let background = SKSpriteNode(imageNamed: imageName)
        
        // Definindo a posicao inicial
        background.position = position
        
        // Definindo a profundidade
        background.zPosition = deph
        
        // Alterando a escola para encaixar ao tamanho da tela
        background.scale(to: CGSize(width: frame.size.width, height: frame.size.height))
        
        return background
    }
}
