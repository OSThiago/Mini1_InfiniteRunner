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
    var candyCollectedScore = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            let menu = MainMenuScene(size: view.frame.size)
            print(view.frame.size)
            menu.scaleMode = .resizeFill
            view.presentScene(menu)
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            
          //authenticateUser()
            authenticatePlayer()
            
        }
    }
    /*
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
    */
    @IBAction func showAchievements(_ sender: Any) {
        let viewControler = GKGameCenterViewController()
        viewControler.gameCenterDelegate = self
        viewControler.viewState = .achievements
        present(viewControler, animated: true, completion: nil)
    }
    
    
    @IBAction func showLeaderboards(_ sender: Any) {
        let viewControler = GKGameCenterViewController()
        viewControler.gameCenterDelegate = self
        viewControler.viewState = .leaderboards
        viewControler.leaderboardIdentifier = "Coletaveis"
        present(viewControler, animated: true, completion: nil)
    }
    
    func authenticatePlayer(){
        let localPlayer = GKLocalPlayer.local
        
        localPlayer.authenticateHandler = {
            (view, Error) in
            
            if view != nil{
                self.present(view!, animated: true, completion: nil)
            }else{
                print(GKLocalPlayer.local.isAuthenticated)
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
        candyCollectedScore += 1
    }
    
    func highScore(number: Int){
        if GKLocalPlayer.local.isAuthenticated{
            
        }
    }
    
    
    
    
    
}


extension UIViewController:
    GKGameCenterControllerDelegate {
    public func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
            gameCenterViewController.dismiss(animated: true, completion: nil)
        }
}
