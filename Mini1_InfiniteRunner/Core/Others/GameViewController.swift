//
//  GameViewController.swift
//  Mini1_InfiniteRunner
//
//  Created by Team 10 on 12/07/21.
//

import UIKit
import SpriteKit
import GameplayKit
import GameKit

class GameViewController: UIViewController{
    
    static let sharedGC = GameCenterScene()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            
            let menu = MainMenuScene(size: view.frame.size)
            print(view.frame.size)
            menu.scaleMode = .resizeFill
            view.presentScene(menu)
            
            GameViewController.sharedGC.authenticatePlayer()
            GameViewController.sharedGC.transitionToGameCenter()
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
    
            
        }
    }

    

    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    // Methodos para suportar a rotação na tela no sentido horizontal
    override var shouldAutorotate: Bool {
        return true
    }


    
}

/*
extension UIViewController:
    GKGameCenterControllerDelegate {
    public func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
            gameCenterViewController.dismiss(animated: true, completion: nil)
        }
} */

 

