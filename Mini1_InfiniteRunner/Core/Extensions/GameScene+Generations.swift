//
//  GameScene+Generations.swift
//  Mini1_InfiniteRunner
//
//  Created by Team 10 on 13/07/21.
//

import SpriteKit

extension GameScene{
    
     //tiago lindo
     //Função para criar o chão, com posição inicial
     func createGround(position: CGPoint)->SKSpriteNode{
          //Criação do chão com base em um arquivo
          let ground = SKSpriteNode(imageNamed: "Ground2")
          
          //Definindo as escalas de acordo com o tamnho da tela
          ground.setScale(2.5)
          
          //Definindo o nome para a variável
          ground.name = "Ground2"
          
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
     
     
 
    
     //Função para fazer a movimentação do chão
     func initialGround(time: TimeInterval) {
         
            // Criar blocos que preenche a tela ao iniciar
            for i in 0...29 {
                let initialPosition = CGPoint(x: size.width*(CGFloat(i)*0.05), y: size.height*0.5)
                    //Criando o chão
                    let ground = self.createGround(position: initialPosition)
                           
                    //Adicionando o chão na tela
                    self.addChild(ground)
                           
                    //Colocando o chão para se mover
                 self.start(ground: ground)
         }
     }
     
    
     
     func start(ground: SKSpriteNode){
          
          // defini movimento do ground
         let moveLef = SKAction.moveBy(x: -frame.size.width/2, y: 0.0, duration: seconds)
          //retorna o ground para a posicao inicial
         let reset = SKAction.moveBy(x: frame.size.width/2, y: 0.0, duration: 0.0)
          // sequencia de acoes
         let sequence = SKAction.sequence([moveLef,reset])
          
          // chamada "recursiva para atualizar a velocidade do grround"
         ground.run(sequence) {
             self.start(ground: ground)
             print(ground)
         }
     }
}
