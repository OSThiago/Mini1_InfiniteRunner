//
//  GameScene+Physics.swift
//  Mini1_InfiniteRunner
//
//  Created by Team 10 on 16/07/21.
//

import SpriteKit


enum mask: Int {
    case player = 1, ground , enemy, candy
    
}
extension GameScene: SKPhysicsContactDelegate{
    
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "enemy"){
            contact.bodyA.node?.removeFromParent()
            print("you loser my brother")
            ActionManage.shared.sceneTransition(self, toScene: .MainMenuScene, transition: SKTransition.moveIn(with: .right, duration: 0.5))
        }
        if (contact.bodyA.node?.name == "enemy" && contact.bodyB.node?.name == "player"){
            contact.bodyB.node?.removeFromParent()
            print("you loser my brother")
            ActionManage.shared.sceneTransition(self, toScene: .MainMenuScene, transition: SKTransition.moveIn(with: .right, duration: 0.5))
            
        }
        
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "Ground"){
            self.player.isJuping = false
        }
        if (contact.bodyA.node?.name == "Ground" && contact.bodyB.node?.name == "player"){
            self.player.isJuping = false
        }
        
        // Contato entre o player o os coletaveis
        if (contact.bodyA.node?.name == "candy" && contact.bodyB.node?.name == "player") {
            contact.bodyA.node?.removeFromParent()
            
            // Colocar aqui para somar o contador
            
        }
        
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "candy") {
            contact.bodyB.node?.removeFromParent()
            
            
            // Colocar aqui para somar o contador
        }
        
        
        // Contato entre doce e inimigo
        if (contact.bodyA.node?.name == "candy" && contact.bodyB.node?.name == "enemy"){
            contact.bodyA.node?.removeFromParent()
        }
        
        if (contact.bodyA.node?.name == "enemy" && contact.bodyB.node?.name == "candy"){
            contact.bodyB.node?.removeFromParent()
        }
        
        
        
        
        
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
      //  print("perdeu o contato")
    }
}
