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
        
        self.hud.playButtom.position = CGPoint(x: frame.size.width*(0.0), y: frame.size.height*(0.0))
        
        self.hud.pauseButtom.position = CGPoint(x: frame.size.width*(-0.42), y: frame.size.height*(0.38))
        
    }
    
    
}
