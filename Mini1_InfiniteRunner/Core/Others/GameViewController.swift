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
    
    var gameCenterEnabled: Bool = false
    
    //Total de doces coletados em todos os jogos
    var totalCandyCollectedScore = Int()
    //Total de doces coletados em uma partida
    var candyCollectedInOneGame = Int()
    //Total de distancia percorrida em uma partida
    var distanceReachedInOneGame = Float()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            let menu = MainMenuScene(size: view.frame.size)
            print(view.frame.size)
            menu.scaleMode = .resizeFill
            view.presentScene(menu)
            
            self.authenticatePlayer()
        }
    }
    
    /* SERÁ IMPLEMENTADO EM OUTRA VERSÃO
    //MARK: - FUNÇÃO PARA MOSTRAR AS CONQUISTAS
    func showAchievements() {
        let viewControler = GKGameCenterViewController(state: .achievements)
        viewControler.gameCenterDelegate = self
        present(viewControler, animated: true, completion: nil)
    }*/

    /* USADO PARA TESTE ESPECÍFICO E RÁPIDO DOS PLACARES DE LÍDERES
    //MARK: - FUNÇÃO PARA MOSTRAR OS PLACARES
    func showLeaderboards() {
        let viewControler = GKGameCenterViewController(state: .leaderboards)
        viewControler.gameCenterDelegate = self
        present(viewControler, animated: true, completion: nil)
    }*/
    
    
    //MARK: - FUNÇÃO PARA AUTENTICAR O JOGADOR
    func authenticatePlayer(){
        let localPlayer = GKLocalPlayer.local
        localPlayer.authenticateHandler = {
            (view, Error) in
            
            if view != nil{
                self.present(view!, animated: true, completion: nil)
            }else{
                print(GKLocalPlayer.local.isAuthenticated)
                self.gameCenterEnabled = true
            }
        }
    }
    
    //MARK: - FUNÇÃO PARA MANDAR O PLACAR PARA O GAMECENTER
    func callGameCenter(_ sender: Any){
        highCandyScore(number: candyCollectedInOneGame)
        allCandiesCollected(number: totalCandyCollectedScore)
        highDistanceScore(number: distanceReachedInOneGame)
    }
    
    //MARK: - FUNÇÃO PARA SALVAR O PLACAR MAIS ALTO
    func highCandyScore(number: Int){
        if GKLocalPlayer.local.isAuthenticated{
            GKLeaderboard.submitScore(number, context: 0, player: GKLocalPlayer.local, leaderboardIDs: ["com.team10.Mini1.CandiesCollected"]){error in
                if let error = error{
                    print(error.localizedDescription)
                }else{}
            }
        }
    }
    
    //MARK: - FUNÇÃO PARA SALVAR A DISTANCIA MAIS ALTA
    func highDistanceScore(number: Float){
        if GKLocalPlayer.local.isAuthenticated{
            GKLeaderboard.submitScore(Int(number), context: 0, player: GKLocalPlayer.local, leaderboardIDs: ["com.team10.Mini1.DistanceReached"]){error in
                if let error = error{
                    print(error.localizedDescription)
                }else{}
            }
            
        }
    }
    
    //MARK: - FUNÇÃO PARA SALVAR O TOTAL DE DOCES COLETADOS
    func allCandiesCollected(number: Int){
        if GKLocalPlayer.local.isAuthenticated{
            GKLeaderboard.submitScore(number, context: 0, player: GKLocalPlayer.local, leaderboardIDs: ["com.team10.Mini1.TotalCandies"]){error in
                if let error = error{
                    print(error.localizedDescription)
                }else{}
            }
             
        }
    }
    
    /* FUNÇÃO PARA TESTE RÁPIDO E ESPECÍFICO
    //MARK: - FUNÇÃO PARA CHAMAR OS LEADERBOARDS
    func transitionToGameCenter(){
        print("Opening Game Center")
        let viewController = GKGameCenterViewController(state: .leaderboards)
        viewController.gameCenterDelegate = self
        present(viewController, animated: true, completion: nil)
    }*/

    
    /*
    //MARK: - FUNÇÃO APENAS PARA TESTE VALIDAÇÃO
    func showScores(){
        print("Candies in one game: \(candyCollectedInOneGame)")
        print("Total candies:  \(totalCandyCollectedScore)")
        print("Total Distance: \(distanceReachedInOneGame)")
    }*/
    
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
