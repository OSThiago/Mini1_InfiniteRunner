//
//  GameScene+Candy.swift
//  Mini1_InfiniteRunner
//
//  Created by Thiago de Oliveira Sousa on 25/07/21.
//

import SpriteKit

extension GameScene {
    
    func generateCandy(speed: TimeInterval, time: TimeInterval) {
        // Posicao em cima
        let topPosition = CGPoint(x: self.size.width*1.5, y: self.size.height*0.63)
        
        // Posicao em baixo
        let bottomPosition = CGPoint(x: self.size.width*1.5, y: self.size.height*0.39)
        
        // Gerando doce em cima
        generateRandomCandy(speed: speed, time: time, position: topPosition)
        
        // Gerando doce em baixo
        generateRandomCandy(speed: speed, time: time, position: bottomPosition)

        
    }
    
    
    // Adiciona movimento ao node
    func moveCandy(node: SKSpriteNode, time: TimeInterval) {
        let multiplier = 4.0
        let moveAction = SKAction.moveBy(x: size.width*(-2.8), y: 0, duration: time*multiplier)
        
        let remove = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction,remove])
        node.run(sequence)
    }
    
    
    // Gera doces em apenas uma lado, para gerar nos 2 precis chamar duas vezes e passar qual o lado
    func generateRandomCandy(speed: TimeInterval, time: TimeInterval, position: CGPoint) {
        
        // Acao para gerar nodes dos doces
        let createCandy = SKAction.run {
            
            let random = Int.random(in: 1...4)
            let candy = Candy(image: "coletavel-\(random)", position: position)
            
            self.addChild(candy)
            self.moveCandy(node: candy, time: speed)
            
            //candy.removeAllActions()
            
        }
        
        // Acao de intervalo entra cada geracao de node
        let waitInBetween = SKAction.wait(forDuration: time+1, withRange: time+5)
        let sequence = SKAction.sequence([createCandy,waitInBetween])
        self.run(sequence) {
            self.generateRandomCandy(speed: self.enemySpeed, time: self.candyTiminig, position: position)
        }
    }
    
}
