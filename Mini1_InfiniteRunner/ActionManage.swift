//
//  ActionManage.swift
//  Mini1_InfiniteRunner
//
//  Created by Douglas Figueirôa on 16/07/21.
//

import Foundation
import SpriteKit

class ActionManage{
    
    enum SceneType{
        case MainMenuScene, GameScene
    }
    
    private init(){}
    
    static let shared = ActionManage()
    
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
            scene.scaleMode = .resizeFill
            fromScene.view?.presentScene(scene, transition: transition)
        }else{
            scene.scaleMode = .resizeFill
            fromScene.view?.presentScene(scene)
        }
    }
    
    func getScene(_ sceneType: SceneType) -> SKScene?{
        switch sceneType {
        case SceneType.MainMenuScene:
            return MainMenuScene(size: CGSize(width: 500, height: 500))
        case SceneType.GameScene:
            return GameScene(size: CGSize(width: 844.0, height: 390.0))

        }
        
    }
    
}
