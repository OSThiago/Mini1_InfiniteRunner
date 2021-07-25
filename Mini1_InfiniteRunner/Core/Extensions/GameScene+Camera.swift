//
//  GameScene+Camera.swift
//  Mini1_InfiniteRunner
//
//  Created by Leticia Costa de Aquino on 25/07/21.
//

import SpriteKit



extension GameScene {
    
    // Funçao para delimitar o movimento da camera
    func boundsCamera() {

    let boundsY = self.calculateAccumulatedFrame().height/2
    let boundsX = self.calculateAccumulatedFrame().width/2


    let cameraConstraintsY = SKConstraint.positionY(.init(lowerLimit: -80, upperLimit: boundsY))
    let cameraConstraintsX = SKConstraint.positionX(.init(lowerLimit: -boundsX, upperLimit: boundsX))


        self.cameraNode.constraints = [cameraConstraintsY, cameraConstraintsX]

    }
    
    //Função da camera seguindo o personagem
    func moveCamera(){
        
        switch player.getPlayerSide() {
        case .TOP:
            //cameraNode.position = CGPoint(x: player.getNode().position.x, y: player.getNode().position.y*1.35)
            self.cameraNode.run(.moveTo(y: player.position.y*1.35, duration: 0.15))

        case .BOTTOM:
            //cameraNode.position = CGPoint(x: player.getNode().position.x, y: player.getNode().position.y*0.35)
            self.cameraNode.run(.moveTo(y: player.position.y*0.35, duration: 0.15))

        }
        
    }
    
    // Função da camera shake
    func cameraShake(inicialPosition: CGPoint, duration: Float, amplitudeX: Float, amplitudeY: Float) -> SKAction {

           let inicialX = inicialPosition.x
           let inicialY = inicialPosition.y
           let numShake = duration / 0.2
           var actionsArray:[SKAction] = []
           for _ in 1...Int(numShake){
               let newPositionX = inicialX + CGFloat(arc4random_uniform(UInt32(amplitudeX)))
               let newPositionY = inicialY + CGFloat(arc4random_uniform(UInt32(amplitudeY)))
               actionsArray.append(SKAction.move(to: CGPoint(x: newPositionX, y: newPositionY), duration: 0.1))
           }
           actionsArray.append(SKAction.move(to: inicialPosition, duration: 0.1))


           return SKAction.sequence(actionsArray)
       }

    
    
    
    
}


