//
//  GameScene+Physics.swift
//  Mini1_InfiniteRunner
//
//  Created by Team 10 on 16/07/21.
//

import SpriteKit
import UIKit

enum mask: Int {
    case player = 1, ground , enemy, candy
    
}
extension GameScene: SKPhysicsContactDelegate{
    
    static let sharedGVC = GameViewController()
    static let sharedMMS = MainMenuScene(size: CGSize(width: 844.0, height: 390.0))
    
    func didBegin(_ contact: SKPhysicsContact) {
            if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "enemy"){
                contact.bodyA.node?.removeFromParent()
                print("you loser my brother")
                
                let generator = UIImpactFeedbackGenerator()
                generator.impactOccurred()
                
                //Enviar as pontuações de doces para o gameCenter
                GameScene.sharedGVC.callGameCenter(self)
                ActionManage.shared.sceneTransition(self, toScene: .MainMenuScene, transition: SKTransition.moveIn(with: .right, duration: 0.5))
                self.countCandy = 0
                GameScene.sharedGVC.candyCollectedInOneGame = 0
            }
            
            if (contact.bodyA.node?.name == "enemy" && contact.bodyB.node?.name == "player"){
                contact.bodyB.node?.removeFromParent()
                print("you loser my brother")
                let generator = UIImpactFeedbackGenerator()
                generator.impactOccurred()
                
                //Enviar as pontuações de doces para o gameCenter
                GameScene.sharedGVC.callGameCenter(self)
                ActionManage.shared.sceneTransition(self, toScene: .MainMenuScene, transition: SKTransition.moveIn(with: .right, duration: 0.5))
                self.countCandy = 0
                GameScene.sharedGVC.candyCollectedInOneGame = 0
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
            
            // HUD
            self.countCandy += 1
            self.hud.incrementCandyLabel(count: self.countCandy)
            
            //Contador de doces
            if !MainMenuScene.flag{
                playSoundCandieCollected()
            }
            GameScene.sharedGVC.candyCollectedInOneGame += 1
            GameScene.sharedGVC.totalCandyCollectedScore += 1
            
            // Vibração
            
            self.generator.impactOccurred()
            
        }
        
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "candy") {
            contact.bodyB.node?.removeFromParent()
            
            // HUD
            self.countCandy += 1
            //self.countLabel.text = "\(self.countCandy)"
            self.hud.incrementCandyLabel(count: self.countCandy)
            
            //Contador de doces
            if !MainMenuScene.flag{
                playSoundCandieCollected()
            }
            GameScene.sharedGVC.candyCollectedInOneGame += 1
            GameScene.sharedGVC.totalCandyCollectedScore += 1
            
            // Vibração
            self.generator.impactOccurred()
            
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
