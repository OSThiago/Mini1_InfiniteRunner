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
    
    static let sharedGC = GameCenterScene()
    
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "enemy"){
            contact.bodyA.node?.removeFromParent()
            print("you loser my brother")
            //Enviar as pontuações de doces para o gameCenter
            GameScene.sharedGC.CallGameCenter(self)
            ActionManage.shared.sceneTransition(self, toScene: .MainMenuScene, transition: SKTransition.moveIn(with: .right, duration: 0.5))
            GameScene.sharedGC.candyCollectedInOneGame = 0
        }
        if (contact.bodyA.node?.name == "enemy" && contact.bodyB.node?.name == "player"){
            contact.bodyB.node?.removeFromParent()
            print("you loser my brother")
            //Enviar as pontuações de doces para o gameCenter
            GameScene.sharedGC.CallGameCenter(self)
            ActionManage.shared.sceneTransition(self, toScene: .MainMenuScene, transition: SKTransition.moveIn(with: .right, duration: 0.5))
            GameScene.sharedGC.candyCollectedInOneGame = 0
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
            
            //Contador de doces
            playSoundCandieCollected()
            GameScene.sharedGC.scoreButton()
            print(GameScene.sharedGC.candyCollectedInOneGame)
            
        }
        
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "candy") {
            contact.bodyB.node?.removeFromParent()
            
            //Contador de doces
            playSoundCandieCollected()
            GameScene.sharedGC.scoreButton()
            print(GameScene.sharedGC.candyCollectedInOneGame)
        }
        
        
        // Contato entre doce e inimigo
        if (contact.bodyA.node?.name == "candy" && contact.bodyB.node?.name == "enemy"){
            contact.bodyA.node?.removeFromParent()
        }
        
        if (contact.bodyA.node?.name == "enemy" && contact.bodyB.node?.name == "candy"){
            contact.bodyB.node?.removeFromParent()
        }
        
        
        
        
        
    }
    
    func playSoundCandieCollected(){
        let explosionSoundAction: SKAction = {
            return SKAction.playSoundFileNamed("SoundCandieCollected.wav", waitForCompletion: false)
        }()
        self.run(explosionSoundAction)
    }

    
    func didEnd(_ contact: SKPhysicsContact) {
      //  print("perdeu o contato")
    }
}
