//
//  ActionManage.swift
//  Mini1_InfiniteRunner
//
//  Created by Douglas Figueirôa on 16/07/21.
//

import Foundation
import SpriteKit

class ActionManage {
    
    enum SceneType{
        case MainMenuScene, GameScene
    }
    
    
    init(){
        
    }
    
    static let shared = ActionManage()
    static let sharedV = GameViewController()
    
    public func launch(){
        firstLaunch()
    }
    
    private func firstLaunch(){
        if !UserDefaults.standard.bool(forKey: "isFirstLaunch"){
            
            print("primeira entrada")
            
            UserDefaults.standard.set(true, forKey: "isFirstLaunch")
            UserDefaults.standard.synchronize()
            
        }
    }
    
    func sceneTransition(_ fromScene: SKScene, toScene: SceneType, transition: SKTransition? = nil){
        
        guard let scene = getScene(toScene) else{ return }
        if let transition = transition{
            scene.scaleMode = .aspectFit
            fromScene.view?.presentScene(scene, transition: transition)
        }else{
            scene.scaleMode = .aspectFit
            fromScene.view?.presentScene(scene)
        }
    }
    
    func getScene(_ sceneType: SceneType) -> SKScene?{
        switch sceneType {
        case SceneType.MainMenuScene:
            return MainMenuScene(size: GameViewController.teste) //693.0   320.0
        case SceneType.GameScene:
            return GameScene(size: GameViewController.teste)

        }
        
    }
    
}
