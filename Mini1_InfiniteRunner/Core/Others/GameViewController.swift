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
    @IBOutlet var Label: UILabel! //APENAS PARA TESTE DOCE
    @IBOutlet var label2: UILabel! //APENAS PARA TESTE DISTANCIA
    
    var candyCollectedScore = Int()
    var distanceReached = Float()

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
    
            authenticatePlayer()
            
        }
    }
    
    //FUNÇÃO PARA MOSTRAR AS CONQUISTAS
    @IBAction func showAchievements(_ sender: Any) {
        let viewControler = GKGameCenterViewController()
        viewControler.gameCenterDelegate = self
        viewControler.viewState = .achievements
        present(viewControler, animated: true, completion: nil)
    }
    
    
    //FUNÇÃO PARA MOSTRAR OS PLACARES
    @IBAction func showLeaderboards(_ sender: Any) {
        let viewControler = GKGameCenterViewController()
        viewControler.gameCenterDelegate = self
        viewControler.viewState = .leaderboards
        viewControler.leaderboardIdentifier = "Candies Collected"
        present(viewControler, animated: true, completion: nil)
        
        viewControler.leaderboardIdentifier = "Distance Reached"
        present(viewControler, animated: true, completion: nil)
        
        
    }
    
    //FUNÇÃO PARA AUTENTICAR O JOGADOR
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
    
    
    //FUNÇÃO PARA SER CHAMADA TODA VEZ QUE COLETAR UM DOCE
    @IBAction func scoreButton(_ sender: Any) {
        candyCollectedScore += 1
        Label.text = "\(candyCollectedScore)"
    }
    
    
    @IBAction func DistanceButton(_ sender: Any) {
        distanceReached += 10
        label2.text = "\(distanceReached)"
        
    }
    
    /*
    func scoreDistance(_ sender: Any){
        //IMPLEMENTAR AINDA
        //COLOCAR LABEL NA TELA
    }
    */
    
    
    
    //FUNÇÃO PARA MANDAR O PLACAR PARA O GAMECENTER
    @IBAction func CallGameCenter(_ sender: Any){
        highCandyScore(number: candyCollectedScore)
        highDistanceScore(number: distanceReached)
        //prox função pra distancia
    }
    
    //FUNÇÃO PARA SALVAR O PLACAR MAIS ALTO
    func highCandyScore(number: Int){
        if GKLocalPlayer.local.isAuthenticated{
            let scoreCandyReporter = GKScore(leaderboardIdentifier: "com.team10.Mini1.CandiesCollected")
            scoreCandyReporter.value = Int64(number)
            let scoreCandyArray: [GKScore] = [scoreCandyReporter]
            GKScore.report(scoreCandyArray, withCompletionHandler: nil)
        }
    }
    
    //FUNÇÃO PARA SALVAR A DISTANCIA MAIS ALTA
    func highDistanceScore(number: Float){
        if GKLocalPlayer.local.isAuthenticated{
            let scoreDistanceReporter = GKScore(leaderboardIdentifier: "com.team10.Mini1.DistanceReached")
            scoreDistanceReporter.value = Int64(number)
            let scoreDistanceArray: [GKScore] = [scoreDistanceReporter]
            GKScore.report(scoreDistanceArray, withCompletionHandler: nil)
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


extension UIViewController:
    GKGameCenterControllerDelegate {
    public func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
            gameCenterViewController.dismiss(animated: true, completion: nil)
        }
}

