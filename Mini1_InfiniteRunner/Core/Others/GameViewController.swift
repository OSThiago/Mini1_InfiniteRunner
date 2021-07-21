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

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            let menu = MainMenuScene(size: view.frame.size)
            print(view.frame.size)
            menu.scaleMode = .aspectFill
            view.presentScene(menu)
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            
          //  authenticateUser()
            
        }
    }
    
    private func authenticateUser(){
        let playerGamer = GKLocalPlayer.local
        
        playerGamer.authenticateHandler = { viewControler, error in
            
            guard error == nil else{
                print(error?.localizedDescription ?? "")
                return
            }
            if let viewControler = viewControler{
                self.present(viewControler, animated: true, completion: nil)
            }
        }
    }
    
    
    // Methodos para suportar a rotação na tela no sentido horizontal
    override var shouldAutorotate: Bool {
        return true
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
    
    
    @IBAction func scoreButton(_ sender: Any) {
        
        
    }
    
    
    
    
    
}
