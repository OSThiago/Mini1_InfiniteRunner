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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            let menu = MainMenuScene(size: view.frame.size)
            print(view.frame.size)
            menu.scaleMode = .resizeFill
            view.presentScene(menu)
            
            self.authenticatePlayer()
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            
        }
    }
    
    //Total de doces coletados em todos os jogos
    var totalCandyCollectedScore = Int()
    //Total de doces coletados em uma partida
    var candyCollectedInOneGame = Int()
    //Total de distancia percorrida em uma partida
    var distanceReachedInOneGame = Float()
    
    //FUNÇÃO PARA MOSTRAR AS CONQUISTAS
    func showAchievements() {
        let viewControler = GKGameCenterViewController(state: .achievements)
        viewControler.gameCenterDelegate = self
        present(viewControler, animated: true, completion: nil)
    }
    
    /*
    func reportAchievements(/*achievements: [GKAchievement]*/ _ x: Int){
        /*if !gameCenterEnabled{
            print("Jogador não autenticado")
            return
        }
        GKAchievement.report(achievements, withCompletionHandler: {(error: Error?)-> Void in
            if error != nil{
                print("erro")
            }else{
                print("achievements reported")
            }
        })*/
        /*
        GKAchievement.loadAchievements(completionHandler: { (achievements: [GKAchievement]?, error: Error?) in
            let achievementID = "101"
            var achievement: GKAchievement? = nil
            
            //Checa se existe esse achievement
            achievement = achievements?.first(where: { $0.identifier == achievementID})
            GKLeaderboard
            //Caso não exista, ele cria
            if achievement == nil {
                achievement = GKAchievement(identifier: achievementID)
            }
            
            // Insert code to report the percentage.
            
            if error != nil {
                // Handle the error that occurs.
                print("Error: \(String(describing: error))")
            }
        })*/
        
       /* if let achievement = GKAchievement(identifier: "10DocesColetados", player: GKLocalPlayer.local){
            achievement.percentComplete = Double(x)
            GKAchievement.report([achievement]){ error in
                if let error = error{
                    print("deu erro")
                }
            }
        }*/
        
    }*/
    /*
    func testeSubmitScoreDistance(_ score: Int){
        GKLeaderboard.submitScore(score, context: 0, player: GKLocalPlayer.local, leaderboardIDs: ["com.team10.Mini1.DistanceReached"]){error in
            if let error = error{
                print(error.localizedDescription)
            }else{
                //nada ainda
            }
        }
    }*/


    //FUNÇÃO PARA MOSTRAR OS PLACARES
    func showLeaderboards() {
        let viewControler = GKGameCenterViewController(state: .leaderboards)
        viewControler.gameCenterDelegate = self
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
                self.gameCenterEnabled = true
            }
        }
    }
    
    //FUNÇÃO PARA MANDAR O PLACAR PARA O GAMECENTER
    func callGameCenter(_ sender: Any){
        highCandyScore(number: candyCollectedInOneGame)
        allCandiesCollected(number: totalCandyCollectedScore)
        highDistanceScore(number: distanceReachedInOneGame)
        showScores()
    }
    
    //FUNÇÃO PARA SALVAR O PLACAR MAIS ALTO
    func highCandyScore(number: Int){
        if GKLocalPlayer.local.isAuthenticated{
            GKLeaderboard.submitScore(number, context: 0, player: GKLocalPlayer.local, leaderboardIDs: ["com.team10.Mini1.CandiesCollected"]){error in
                if let error = error{
                    print(error.localizedDescription)
                }else{
                    //nada ainda
                }
            }
        }
    }
    
    //FUNÇÃO PARA SALVAR A DISTANCIA MAIS ALTA
    func highDistanceScore(number: Float){
        if GKLocalPlayer.local.isAuthenticated{
            GKLeaderboard.submitScore(Int(number), context: 0, player: GKLocalPlayer.local, leaderboardIDs: ["com.team10.Mini1.DistanceReached"]){error in
                if let error = error{
                    print(error.localizedDescription)
                }else{
                    //nada ainda
                }
            }
            
        }
    }
    
    //FUNÇÃO PARA SALVAR O TOTAL DE DOCES COLETADOS
    func allCandiesCollected(number: Int){
        if GKLocalPlayer.local.isAuthenticated{
            GKLeaderboard.submitScore(number, context: 0, player: GKLocalPlayer.local, leaderboardIDs: ["com.team10.Mini1.TotalCandies"]){error in
                if let error = error{
                    print(error.localizedDescription)
                }else{
                    //nada ainda
                }
            }
             
        }
    }
    
    //FUNÇÃO PARA CHAMAR OS LEADERBOARDS
    func transitionToGameCenter(){
        print("Opening Game Center")
        let viewController = GKGameCenterViewController(state: .leaderboards)
        viewController.gameCenterDelegate = self
        present(viewController, animated: true, completion: nil)
    }

    
    //FUNÇÃO APENAS PARA TESTE VALIDAÇÃO
    func showScores(){
        print("Candies in one game: \(candyCollectedInOneGame)")
        print("Total candies:  \(totalCandyCollectedScore)")
        print("Total Distance: \(distanceReachedInOneGame)")
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
