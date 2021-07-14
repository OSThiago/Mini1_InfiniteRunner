//
//  GameScene+Generations.swift
//  Mini1_InfiniteRunner
//
//  Created by Douglas Figueirôa on 13/07/21.
//

import SpriteKit

extension GameScene{
    
    
    //Função para criar o chão, com posição inicial
    func createGround(position: CGPoint)->SKSpriteNode{
        //Criação do chão com base em um arquivo
        let ground = SKSpriteNode(imageNamed: "ground")
        
        //Definindo as escalas de acordo com o tamnho da tela
        ground.yScale = 0.05
        ground.xScale = 0.20
        
        //Definindo o nome para a variável
        ground.name = "Ground"
        
        //Definindo a posição com base na referência
        ground.position = position
        
        //Criando a física do chão
        let physicToGround = SKPhysicsBody(rectangleOf: ground.size)
        physicToGround.affectedByGravity = true
        physicToGround.allowsRotation = false
        physicToGround.isDynamic = false
        
        //Atribuindo a física para o chão
        ground.physicsBody = physicToGround
        
        return ground
    }
    
    
    //Funcão para gerar o chão com base em um tempo
    func generateGrounds(time: TimeInterval){
        //Definindo a posição inicial na tela para gerar o chão
        let initialPosition = CGPoint(x: size.width*1.5, y: size.height*0.5)
        
        //Atribuindo uma ação ao chão
        let groundCreated = SKAction.run {
            //Criando o chão
            let ground = self.createGround(position: initialPosition)
            
            //Adicionando o chão na tela
            self.addChild(ground)
            
            //Colocando o chão para se mover
            self.moveGround(node: ground, time: time)
        }
        
        //Tempo de espera entre criação dos nodes
        let waitInBetween = SKAction.wait(forDuration: time)
        
        //Atribuindo uma sequencia de ações
        let sequence = SKAction.sequence([groundCreated, waitInBetween])
        
        //Colocando para repetição
        let repeatForever = SKAction.repeatForever(sequence)
        
        //Inicializando a repetição
        self.run(repeatForever)
        
    }
    
    
    //Função para fazer a movimentação do chão
    func moveGround(node: SKSpriteNode, time: TimeInterval){
        //Atribuindo a posição inicial até um ponto específico e o tempo para a movimentação
        
        // Esse mutiplicador server para encaixar a geração do chão ao mesmo tempo da velocidade que ele anda
        // gambiarra
        let multiplier = 3.9
        
        let moveAction = SKAction.moveBy(x: size.width*(-2.8), y: 0, duration: time*multiplier)
        
        //Criando a remoção do node(chão)
        let removeNode = SKAction.removeFromParent()
        
        //Criando a sequência, do movimento e a remoção
        let removeSequence = SKAction.sequence([moveAction, removeNode])
        
        //Inicializando a repetição para a remoção
        node.run(removeSequence)
    }
    
    func initialGround(timeSpeed: TimeInterval) {
 
        // Posição inicila no centro da tela
        let initialPosition = CGPoint(x: size.width*0.5, y: size.height*0.5)
        
        //Criando o chão
        let ground = self.createGround(position: initialPosition)
            
        //Adicionando o chão na tela
        self.addChild(ground)
            
        //Colocando o chão para se mover
        self.moveGround(node: ground, time: timeSpeed)
    
    }
}