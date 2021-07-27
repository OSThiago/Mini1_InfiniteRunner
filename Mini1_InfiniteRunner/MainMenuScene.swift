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
        
        playSoundMainMenu()
        createBackground()
        soundButton()
        gameCenterButton()
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
                    }else if node.name == "soundButton"{
                        if node.contains(touch.location(in: self)){
                            print("ainda nn faz nada o botao de sound")
                        }
                    }else if node.name == "gameCenterButton"{
                        if node.contains(touch.location(in: self)){
                            //implementar o game center ao tocar ak
                            print("Game center")
                            
                            guard let gameViewController = self.view?.window?.rootViewController as? GameViewController else {
                                return
                            }
                            gameViewController.transitionToGameCenter()
                        }
                    }
                })
            }
        }
    }
    
    
    
    func createBackground(){
        let menuBackground = SKSpriteNode(imageNamed: "MenuBackGround")
        menuBackground.name = "menuBackground"
        menuBackground.position = CGPoint.zero
        menuBackground.size = CGSize(width: 844.0, height: 390.0)
        menuBackground.zPosition = -1
        addChild(menuBackground)
    }
    
    func playButton(){
        let playButton = SKSpriteNode(imageNamed: "playButton")
        playButton.name = "playButton"
        playButton.position = CGPoint.zero
        playButton.zPosition = 1
        playButton.size = CGSize(width: 100, height: 100)
        addChild(playButton)
    }
    
    
    func soundButton(){
        let configButton = SKSpriteNode(imageNamed: "soundButton")
        configButton.name = "soundButton"
        configButton.position = CGPoint.init(x: 290, y: 120)
        configButton.size = CGSize(width: 80, height: 60)
        addChild(configButton)
    }
    
    func gameCenterButton(){
        //GameScene.sharedGC.showLeaderboards(self)
        let gameCenterButton = SKSpriteNode(imageNamed: "gameCenterButton")
        gameCenterButton.name = "gameCenterButton"
        gameCenterButton.position = CGPoint.init(x: -300, y: -125)
        gameCenterButton.size = CGSize.init(width: 40, height: 40)
        self.addChild(gameCenterButton)
    }
       
    func playSoundMainMenu(){
        let audioNode = SKAudioNode(fileNamed: "SoundMainMenu.wav")
        audioNode.autoplayLooped = true
        audioNode.name = "AudioMainMenu"
        self.addChild(audioNode)
    }
    
    

    

    
    
    
    
}
