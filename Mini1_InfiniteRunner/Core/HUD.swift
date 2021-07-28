//
//  HUD.swift
//  Mini1_InfiniteRunner
//
//  Created by Thiago de Oliveira Sousa on 28/07/21.
//

import SpriteKit

class HUD {
    
    let view: SKScene
    let playButtom: SKSpriteNode
    let cameraNode: SKCameraNode
    
    
    init(view: SKScene, camera: SKCameraNode){
        self.view = view
        self.cameraNode = camera
        
        self.playButtom = SKSpriteNode(imageNamed: "forward")
        self.playButtom.name = "playButtom"
    }
    
    private func addPlayButtom() {
        playButtom.setScale(5)
        playButtom.texture?.filteringMode = .nearest
        playButtom.zPosition = 10
        cameraNode.addChild(playButtom)
    }
    
    private func removePlayButtom() {
        self.playButtom.removeFromParent()
    }
    
    func pauseGame() {
        let playAction = SKAction.run {
            self.addPlayButtom()
        }
        let pauseAction = SKAction.run {
            self.view.scene?.view?.isPaused = true
        }
        let sequence = SKAction.sequence([playAction,pauseAction])
        view.run(sequence)
    }
    
    func playGame() {
        view.scene?.view?.isPaused = false
        removePlayButtom()
    }
    
    
}
