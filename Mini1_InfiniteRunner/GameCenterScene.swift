//
//  GameCenterScene.swift
//  Mini1_InfiniteRunner
//
//  Created by Douglas Figueirôa on 26/07/21.
//

import SpriteKit
import GameplayKit
import GameKit
import UIKit


class GameCenterScene: UIViewController{
    
    var Label: UILabel! //APENAS PARA TESTE DOCE
    var label2: UILabel! //APENAS PARA TESTE DISTANCIA
    
    //Total de doces coletados em todos os jogos
    var totalCandyCollectedScore = Int()
    //Total de doces coletados em uma partida
    var candyCollectedInOneGame = Int()

    //Total de distancia percorrida em uma partida
    var distanceReachedInOneGame = Float()
    
    static let sharedGC = GameViewController()


    
    //FUNÇÃO PARA MOSTRAR AS CONQUISTAS
    func showAchievements(_ sender: Any) {
        let viewControler = GKGameCenterViewController()
        viewControler.gameCenterDelegate = self
        viewControler.viewState = .achievements
        present(viewControler, animated: true, completion: nil)


    }


    //FUNÇÃO PARA MOSTRAR OS PLACARES
    func showLeaderboards(_ sender: Any) {
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
    func scoreButton() {
        candyCollectedInOneGame += 1
        totalCandyCollectedScore += 1
//        Label.text = "\(candyCollectedScore)"
    }
    
    
    func DistanceButton(_ sender: Any) {
        //totalDistanceReachedScore += 10
       // label2.text = "\(distanceReached)"
        
    }
    
    /*
    func scoreDistance(_ sender: Any){
        //IMPLEMENTAR AINDA
        //COLOCAR LABEL NA TELA
    }
    */
    
    
    
    //FUNÇÃO PARA MANDAR O PLACAR PARA O GAMECENTER
    func CallGameCenter(_ sender: Any){
        highCandyScore(number: candyCollectedInOneGame)
        allCandiesCollected(number: totalCandyCollectedScore)
        highDistanceScore(number: distanceReachedInOneGame)
        showScores()
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
    
    func allCandiesCollected(number: Int){
        if GKLocalPlayer.local.isAuthenticated{
            let scoreDistanceReporter = GKScore(leaderboardIdentifier: "com.team10.Mini1.TotalCandies")
            scoreDistanceReporter.value = Int64(number)
            let scoreCandiesArray: [GKScore] = [scoreDistanceReporter]
            GKScore.report(scoreCandiesArray, withCompletionHandler: nil)
        }
    }
    

    
    
    func transitionToGameCenter(){
        print("Opening Game Center")
        let vc = self.view?.window?.rootViewController
        let gc = GKGameCenterViewController()
        gc.gameCenterDelegate = self
        vc?.present(gc, animated: true, completion: nil)

    }
/*
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    */
    
    /*
    override func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    */
    
    func showScores(){
        print("Candies in one game: \(candyCollectedInOneGame)")
        print("Total candies:  \(totalCandyCollectedScore)")
        print("Total Distance: \(distanceReachedInOneGame)")
    }
   
    
}

extension UIViewController:
    GKGameCenterControllerDelegate {
    public func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
            gameCenterViewController.dismiss(animated: true, completion: nil)
        }
}
