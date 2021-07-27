//
//  GameScene+HUD.swift
//  Mini1_InfiniteRunner
//
//  Created by Thiago de Oliveira Sousa on 27/07/21.
//

import SpriteKit

extension GameScene {
    
    func HUDScoreLabel() {
        self.countLabel.text = "\(self.countCandy)"
        cameraNode.addChild(countLabel)
        countLabel.fontColor = .white
    }
    
    func HUDCameraPosition() {
        countLabel.fontName = "Early GameBoy"
        countLabel.position = CGPoint(x: frame.size.width*(0.4), y: frame.size.height*(0.34))
        countLabel.zPosition = 10
        countLabel.horizontalAlignmentMode = .left
        
        pumpkinHUD.position = CGPoint(x: frame.size.width*(0.35), y: frame.size.height*(0.38))
        
        metersLabel.position = CGPoint(x: frame.size.width*(0.25), y: frame.size.height*(0.35))
        
    }
    
    func HUDMetersCount() {
        metersLabel.fontName = "Early Gameboy"
        metersLabel.setScale(0.5)
        metersLabel.text = "0m"
        metersLabel.zPosition = 10
        cameraNode.addChild(metersLabel)
        countMeters()
    }
    
    
    func HUDPumpkin() {
        pumpkinHUD.zPosition = 4
        //pumpkinHUD.setScale(2.5)
        pumpkinHUD.size = CGSize(width: 50, height: 50)
        pumpkinHUD.texture?.filteringMode = .nearest
        pumpkinHUD.zPosition = 10
        cameraNode.addChild(pumpkinHUD)
        
    }
    
    func pauseButton(){
        let pauseButton = SKSpriteNode(imageNamed: "pause_button")
        pauseButton.name = "pauseButton"
//        pauseButton.position = CGPoint(x: frame.size.width*0.1, y: frame.size.height*1.3)
        pauseButton.position = CGPoint(x: -350, y: 148)//x -350
        pauseButton.size = CGSize(width: 50, height: 50)
        pauseButton.zPosition = 10
        pauseButton.texture?.filteringMode = .nearest
        cameraNode.addChild(pauseButton)
    }
    
    
    
    
}
