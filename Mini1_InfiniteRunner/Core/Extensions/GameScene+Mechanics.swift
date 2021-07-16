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
        switch gesture.direction {
        
        case .up:
            print("SwipeUP")
            // Olha o lado atual do player: em cima ou em baixo
            switch player.getPlayerSide() {
            case .TOP:
                // Pula para cima
                jumpPlayer(heightJump: 0.22)
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
                jumpPlayer(heightJump: -0.22)
            }
            
        default:
            print("No Direction")
        }
    }
    
    // Troca a posicao do player e a gravidade do mundo
    func reversePlayer(heightPosition: CGFloat) {
        player.getNode().position = CGPoint(x: size.width*(0.5), y: size.height*(heightPosition))
        player.getNode().yScale = player.getNode().yScale*(-1)
         physicsWorld.gravity.dy = physicsWorld.gravity.dy*(-1)
        changePlayerSide(atualSide: player.getPlayerSide())
        //print(player.getPlayerSide())
    }
    
    // Aplica impulso no player, pode ser para cima ou para baixo
    func jumpPlayer(heightJump: CGFloat) {
        player.getNode().physicsBody?.applyImpulse(CGVector(dx: 0, dy: CGFloat(player.getNode().size.height*(heightJump))))
    }
    
    // Verifica a posição atual do player e troca para o inverso
    func changePlayerSide(atualSide: PlayerSide) {
        switch atualSide {
        case .TOP:
            player.setPlayerSide(side: .BOTTOM)
        case .BOTTOM:
            player.setPlayerSide(side: .TOP)
        }
    }
    
    
}
