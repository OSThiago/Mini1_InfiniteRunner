//
//  MainMenuScene.swift
//  Mini1_InfiniteRunner
//
//  Created by Douglas Figueirôa on 16/07/21.
//

import SpriteKit

class MainMenuScene: SKScene{
    
    override func didMove(to view: SKView) {
        print("Dentro do Menu")
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        configButton()
        playButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            if touch == touches.first{
                print("Indo para o jogo")
                enumerateChildNodes(withName: "//*", using: {(node,stop) in
                    if node.name == "playButton"{
                        if node.contains(touch.location(in: self)){
                            ActionManage.shared.sceneTransition(self, toScene: .GameScene, transition: SKTransition.moveIn(with: .right, duration: 0.5))
                        }
                    }else if node.name == "configButton"{
                        if node.contains(touch.location(in: self)){
                            print("ainda nn faz nada o botao de config")
                        }
                    }
                })
            }
        }
    }
    
    func playButton(){
        let playButton = SKSpriteNode(imageNamed: "playButton")
        playButton.name = "playButton"
        playButton.position = CGPoint.zero
        playButton.size = CGSize(width: 100, height: 100)
        addChild(playButton)
    }
    
    func configButton(){
        let configButton = SKSpriteNode(imageNamed: "configButton")
        configButton.name = "configButton"
        configButton.position = CGPoint.init(x: 379, y: 160)
        configButton.size = CGSize(width: 35, height: 35)
        addChild(configButton)
    }
    

    
    
    
    
}