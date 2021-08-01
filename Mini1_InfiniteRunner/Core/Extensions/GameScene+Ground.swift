//
//  GameScene+Generations.swift
//  Mini1_InfiniteRunner
//
//  Created by Team 10 on 13/07/21.
//

import SpriteKit

extension GameScene{
    
     //Função para fazer a movimentação do chão
     func initialGround(time: TimeInterval) {
         
            // Criar blocos que preenche a tela ao iniciar
            for i in 0...29 {
                let initialPosition = CGPoint(x: size.width*(CGFloat(i)*0.05), y: size.height*0.5)
                    //Criando o chão
                    //let ground = createGround(position: initialPosition)
                    let ground = Ground(position: initialPosition)
                    ground.texture?.filteringMode = .nearest
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
         }
     }
    
    func startGround(ground: SKSpriteNode, speed: TimeInterval){
            let moveLeft = SKAction.moveBy(x: -frame.size.width/2, y: 0.0, duration: speed)
            let reset = SKAction.moveBy(x: frame.size.width/2, y: 0.0, duration: 0.0)
            let sequence = SKAction.sequence([moveLeft,reset])
            //ground.run(SKAction.repeatForever(sequence))
        ground.run(sequence) {
            self.startGround(ground: ground, speed: speed)
        }
        
        
        func moveGroundLeft(speed: TimeInterval) -> SKAction{
            return SKAction.moveBy(x: -frame.size.width/2, y: 0.0, duration: speed)
        }
        
        func resetGroundPosition() ->SKAction{
            return  SKAction.moveBy(x: frame.size.width/2, y: 0.0, duration: 0.0)
        }
        
    }
    
    
    
    
}
