//
//  GameScene+EnemyGenerator.swift
//  Mini1_InfiniteRunner
//
//  Created by Team 10 on 16/07/21.
//

import SpriteKit

extension GameScene{
    
    
    func generatEnemys(time: TimeInterval){
        
        
        
        let creatEnemy = SKAction.run {
            let randomHeight: CGFloat = self.randomPosition()
            
            let initialPosition = CGPoint(x: self.size.width*1.5, y: self.size.height*randomHeight)
            
            // Escolher uma imagem aleatoria a partir do lado da tela
            
            let imageNumber = self.randomImageEnemyBySide(side: randomHeight)
            
            let enemy = Enemy(image: "obstacle\(imageNumber)", position: initialPosition)
            
            enemy.position.y = initialPosition.y * self.adjustHeight(imageNumber: imageNumber)
            
            
            if enemy.position.y < self.size.height*0.5 {
                enemy.yScale = enemy.yScale*(-1)
            }
            
            
            self.addChild(enemy)
            self.moveEnemy(node: enemy, time: time)
            
            // Gambiarra para ajustar a altura
            // Perguntar para o vini como reajusta o centro do node
            
            
        }
        
        let waitInBetween = SKAction.wait(forDuration: time)
        let sequence = SKAction.sequence([creatEnemy,waitInBetween])
        let repeatForever = SKAction.repeatForever(sequence)
        self.run(repeatForever)
    }
    
    func randomPosition()->CGFloat{
        let random = Int.random(in: 1...3)
        //print(random)
        switch random {
        case 1:
            return 0.43
        case 2:
            return 0.56
        default:
            return 0.56
        }
    }
    
    
    func moveEnemy(node: SKSpriteNode, time: TimeInterval){
        let multiplier = 4.0
        let moveAction = SKAction.moveBy(x: size.width*(-2.8), y: 0, duration: time*multiplier)
        
        let remove = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction,remove])
        node.run(sequence)
    }
    
    
    func randomImageEnemyBySide(side: CGFloat) -> Int{
        var imageNumber: Int
        // caso esteja em cima
        if side == 0.56 {
             imageNumber = Int.random(in: 1...3)
            return imageNumber
        } else {
            // caso esteja em baixo
            imageNumber = Int.random(in: 5...7)
            return imageNumber
        }
    }
    
    func adjustHeight(imageNumber image: Int) -> CGFloat{
        switch image {
        case 1:
            return 1.2
        case 2:
            return 1.15
        case 3:
            return 1.4
        case 5:
            return 0.85
        case 6:
            return 0.75
        case 7:
            return 0.45
        default:
            return 1.0
        }
    }
    
    
}
