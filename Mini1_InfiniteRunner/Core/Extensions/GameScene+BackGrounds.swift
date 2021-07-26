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
        
        
        //generationBackGrounds(time: 0, imageName: "plx-3", deph: -7)
        
        
        generationBackGrounds(time: 80, imageName: "prlx2", deph: -7)
        generationBackGrounds(time: 30, imageName: "prlx3", deph: -6)
        generationBackGrounds(time: 30, imageName: "prlx4", deph: -5)
        generationBackGrounds(time: 10, imageName: "prlx5", deph: -4)
        generationBackGrounds(time: 8, imageName: "prlx6", deph: -3)
        generationBackGrounds(time: 120, imageName: "prlx7", deph: -2)
        generationBackGrounds(time: 7, imageName: "prlx8", deph: -1)
        

    }
    
   // Gambiarra para iniciar os primeiros backGrounds no meio da tela
    func initialsBackGrounds() {
        let initialPosition = CGPoint(x: size.width*0.5, y: size.height*0.5)
        
        
        let background = createBackGround(imageName: "prlx1", position: initialPosition, deph: -9)
        self.addChild(background)
    
        
        let backGround2 = createBackGround(imageName: "prlx2", position: initialPosition, deph: -7)
        moveBackGround(node: backGround2, timeSpeed: 80)
        self.addChild(backGround2)
        
        let backGround3 = createBackGround(imageName: "prlx3", position: initialPosition, deph: -6)
        moveBackGround(node: backGround3, timeSpeed: 30)
        self.addChild(backGround3)
        
        let backGround4 = createBackGround(imageName: "prlx4", position: initialPosition, deph: -5)
        moveBackGround(node: backGround4, timeSpeed: 30)
        self.addChild(backGround4)

        let backGround5 = createBackGround(imageName: "prlx5", position: initialPosition, deph: -4)
        moveBackGround(node: backGround5, timeSpeed: 10)
        self.addChild(backGround5)

        let backGround6 = createBackGround(imageName: "prlx6", position: initialPosition, deph: -3)
        moveBackGround(node: backGround6, timeSpeed: 8)
        self.addChild(backGround6)
        
        let backGround7 = createBackGround(imageName: "prlx7", position: initialPosition, deph: -2)
        moveBackGround(node: backGround7, timeSpeed: 120)
        self.addChild(backGround7)
        
        let backGround8 = createBackGround(imageName: "prlx8", position: initialPosition, deph: -1)
        moveBackGround(node: backGround8, timeSpeed: 7)
        self.addChild(backGround8)
        
        


        
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
        //background.scale(to: CGSize(width: frame.size.width, height: frame.size.height*2))
        
        //teste escala
        background.setScale(2.15)
        background.texture?.filteringMode = .nearest
        
        return background
    }
    

    
}
