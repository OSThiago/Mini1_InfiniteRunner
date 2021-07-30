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

class GameViewController: UIViewController, CHBRewardedDelegate, CHBInterstitialDelegate{

    
    var gameCenterEnabled: Bool = false
    
    //Total de doces coletados em todos os jogos
    var totalCandyCollectedScore = Int()
    //Total de doces coletados em uma partida
    var candyCollectedInOneGame = Int()
    //Total de distancia percorrida em uma partida
    var distanceReachedInOneGame = Float()

    static var teste = CGSize()
    
    static var shared = GameScene(size: teste)
    
    var ads: CHBRewarded?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            let menu = MainMenuScene(size: view.frame.size)
            GameViewController.teste = view.frame.size
            print("testando a frame", GameViewController.teste)
            //print(view.frame.size)
            menu.scaleMode = .resizeFill
            view.presentScene(menu)
            
            ads = CHBRewarded(location: CBLocationDefault, delegate: self)
            ads?.cache()
            
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
    
    func showAds(){
        if ((ads?.isCached) != nil){
           ads?.show(from: self)
        }
    }
    
    func didDismissAd(_ event: CHBDismissEvent) {
        //colocar para continuar o jogo
        event.ad.cache()
        //GameViewController.shared.scene?.view?.isPaused = false
        //GameViewController.shared.hud.playGame()
        //GameViewController.shared.endMenu.revive(hud: GameViewController.shared.hud, player: GameViewController.shared.player)
        
       
    }
    
    
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
        //allCandiesCollected(number: totalCandyCollectedScore)
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
    /*
    //MARK: - FUNÇÃO PARA SALVAR O TOTAL DE DOCES COLETADOS
    func allCandiesCollected(number: Int){
        if GKLocalPlayer.local.isAuthenticated{
            UserDefaults.standard.integer(forKey: "highCandyCollectedScore")

            //let defaults = UserDefaults.standard
            defaults.set(number, forKey: "highCandyCollectedScore")
            defaults.synchronize()
            
            print("testando", defaults.object(forKey: "highCandyCollectedScore"))

        
            let a = GKLeaderboard.loadLeaderboards(IDs: ["com.team10.Mini1.TotalCandies"]){error,void  in
                if let error = error{
                    print("nada")
                }else{}
            }
            print("teste do a", a)
                
            GKLeaderboard.submitScore(number, context: 0, player: GKLocalPlayer.local, leaderboardIDs: ["com.team10.Mini1.TotalCandies"]){error in
                if let error = error{
                    print(error.localizedDescription)
                }else{}
            }
             
        }
    }*/
    
    
    //MARK: - FUNÇÃO PARA CHAMAR OS LEADERBOARDS
    func transitionToGameCenter(){
        print("Opening Game Center")
        let viewController = GKGameCenterViewController(state: .leaderboards)
        viewController.gameCenterDelegate = self
        present(viewController, animated: true, completion: nil)
    }

    
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
