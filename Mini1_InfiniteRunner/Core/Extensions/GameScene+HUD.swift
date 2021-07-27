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
        countLabel.position = CGPoint(x: frame.size.width*(0.4), y: frame.size.height*(0.33))
        countLabel.zPosition = 4
        
        pumpkinHUD.position = CGPoint(x: frame.size.width*(0.35), y: frame.size.height*(0.38))
    }
    
    
    func HUDPumpkin() {
        pumpkinHUD.zPosition = 4
        pumpkinHUD.setScale(2.5)
        pumpkinHUD.texture?.filteringMode = .nearest
        cameraNode.addChild(pumpkinHUD)
        
    }
    
}
