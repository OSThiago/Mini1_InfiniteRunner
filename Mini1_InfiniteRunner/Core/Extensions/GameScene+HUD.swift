//
//  GameScene+HUD.swift
//  Mini1_InfiniteRunner
//
//  Created by Thiago de Oliveira Sousa on 27/07/21.
//

import SpriteKit

extension GameScene {
    
    func HUDCameraPosition() {
        
        // Colocar os elementos do HUD par seguir a tela
        self.hud.countCandyLabel.position = CGPoint(x: frame.size.width*(0.4), y: frame.size.height*(0.35))
        
        self.hud.pumpkin.position = CGPoint(x: frame.size.width*(0.35), y: frame.size.height*(0.39))
        
        self.hud.metersLabel.position = CGPoint(x: frame.size.width*(-0.02), y: frame.size.height*(0.355))
        
        self.hud.playButtom.position = CGPoint(x: frame.size.width*(0.0), y: frame.size.height*(-0.15))
        
        self.hud.mainButton.position = CGPoint(x: frame.size.width*(-0.080), y: frame.size.height*(-0.19))
        
        self.hud.soundButton.position = CGPoint(x: frame.size.width*(0.080), y: frame.size.height*(-0.19))
        
        self.hud.pauseButtom.position = CGPoint(x: frame.size.width*(-0.42), y: frame.size.height*(0.38))
        
    }
    
    func endCameraPosition() {
        
        self.endMenu.backGroundGameover.position = CGPoint(x: frame.size.width*(0.0), y: frame.size.height*(0.0))
        
        self.endMenu.homeButton.position = CGPoint(x: frame.size.width*(-0.065), y: frame.size.height*(-0.3))
        
        self.endMenu.returnButton.position = CGPoint(x: frame.size.width*(0.065), y: frame.size.height*(-0.3))
        
        self.endMenu.candyLabel.position = CGPoint(x: frame.size.width*(0.0), y: frame.size.height*(-0.05))
        
        self.endMenu.metersLabel.position = CGPoint(x: frame.size.width*(0.0), y: frame.size.height*(-0.12))
        
        self.endMenu.candy.position = CGPoint(x: frame.size.width*(-0.03), y: frame.size.height*(-0.03))
        
        self.endMenu.distance.position = CGPoint(x: frame.size.width*(-0.03), y: frame.size.height*(-0.10))
        
    }
    
    
}
