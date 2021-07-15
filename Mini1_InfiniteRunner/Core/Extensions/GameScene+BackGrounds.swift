//
//  GameScene+BackGrounds.swift
//  Mini1_InfiniteRunner
//
//  Created by Thiago de Oliveira Sousa on 14/07/21.
//

import SpriteKit

extension GameScene {
    
    // Efeito parallax no backGround
    func parallax() {
        
        let initialPosition = CGPoint(x: size.width*0.50, y: size.height*0.50)
        
        let background = createBackGround(imageName: "plx-1", position: initialPosition, deph: -4)
        
        self.addChild(background)
        
        
        initialsBackGrounds()
        
        generationBackGrounds(time: 6, imageName: "plx-2", deph: -3)
        generationBackGrounds(time: 4, imageName: "plx-3", deph: -2)
        generationBackGrounds(time: 3, imageName: "plx-4", deph: -1)
        
    }
    
   // Gambiarra para iniciar os primeiros backGrounds no meio da tela
    func initialsBackGrounds() {
        let initialPosition = CGPoint(x: size.width*0.5, y: size.height*0.5)
        
        let backGround1 = createBackGround(imageName: "plx-2", position: initialPosition, deph: -3)
        self.addChild(backGround1)
        moveBackGround(node: backGround1, timeSpeed: 6)
        
        let backGround2 = createBackGround(imageName: "plx-3", position: initialPosition, deph: -2)
        moveBackGround(node: backGround2, timeSpeed: 4)
        self.addChild(backGround2)
        
        let backGround3 = createBackGround(imageName: "plx-4", position: initialPosition, deph: -1)
        moveBackGround(node: backGround3, timeSpeed: 3)
        self.addChild(backGround3)
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
