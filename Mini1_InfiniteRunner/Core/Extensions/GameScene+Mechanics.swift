//
//  GameScene+Mechanics.swift
//  Mini1_InfiniteRunner
//
//  Created by Team 10 on 13/07/21.
//

import SpriteKit

extension GameScene {
    func addSwipeGestureRecognizers() {
        // definindo as direções de gesto
        let gesturesDirections: [UISwipeGestureRecognizer.Direction] = [.up, .down]
        
        for gestureDirection in gesturesDirections {
            // Pegando a direcao
            let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
            // Atribuindo a direcao
            gestureRecognizer.direction = gestureDirection
            self.view?.addGestureRecognizer(gestureRecognizer)
        }
        
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer){
        // Faz um ação de acordo com a direcao do gesto
        if !player.isJuping{
            
            switch gesture.direction {
            
            case .up:
                print("SwipeUP")
                // Olha o lado atual do player: em cima ou em baixo
                switch player.getPlayerSide() {
                case .TOP:
                    // Pula para cima
                    jumpPlayer(heightJump: 0.25)
                case .BOTTOM:
                    // Passa para o mundo invertido
                    reversePlayer(heightPosition: 0.63)
                }
                
            case .down:
                print("SwipeDown")
                // Olha o lado atual do player: em cima ou em baixo
                switch player.getPlayerSide() {
                case .TOP:
                    // Volta para o mundo normal
                    reversePlayer(heightPosition: 0.39)
                case .BOTTOM:
                    // Pula para baixo
                    jumpPlayer(heightJump: -0.25)
                }
                
            default:
                print("No Direction")
            }
            player.isJuping = true
        }
       
    }
    
    // Troca a posicao do player e a gravidade do mundo
    func reversePlayer(heightPosition: CGFloat) {
        // Tira o corpo fisico do player
        let removePhysics = SKAction.run {
            self.player.physicsBody = nil
        }
        
        
        // Movendo o player de posicao
        let move = SKAction.moveTo(y: size.height*(heightPosition), duration: 0.3)
        
        // Recolocando a fisica de volta para o player
        let replacePhysics = SKAction.run {
            self.player.physicsBody = self.player.createBody()
        }
        
        // Colocando a sequencia de acoes
        let sequence = SKAction.sequence([removePhysics,move,replacePhysics])
        player.run(sequence)
        
        // Colocando o player de cabeça para baixo
        player.yScale = player.yScale*(-1)
        
        // Colocando a fisica ao contrario
        physicsWorld.gravity.dy = physicsWorld.gravity.dy*(-1)
        
        // Trocando a posicao do player
        player.reversePlayerSide()
        
    }
    
    // Aplica impulso no player, pode ser para cima ou para baixo
    func jumpPlayer(heightJump: CGFloat) {
        player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: CGFloat(player.size.height*(heightJump))))
    }
    
}
