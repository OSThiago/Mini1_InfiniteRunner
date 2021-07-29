//
//  HUD.swift
//  Mini1_InfiniteRunner
//
//  Created by Thiago de Oliveira Sousa on 28/07/21.
//

import SpriteKit

class HUD {
    
    // Propriedades
    let Gameview: SKScene
    let cameraNode: SKCameraNode
    let pauseButtom: SKSpriteNode
    let playButtom: SKSpriteNode
    let pumpkin: SKSpriteNode
    let hudPause: SKSpriteNode
    let mainButton: SKSpriteNode
    var soundButton: SKSpriteNode
    let countCandyLabel: SKLabelNode
    let metersLabel: SKLabelNode
    var meters: Int
    
    
    init(view: SKScene, camera: SKCameraNode){
        // Propriedades da gameScene
        self.Gameview = view
        self.cameraNode = camera
        
        // Imagens
        self.playButtom = SKSpriteNode(imageNamed: "button_play2")
        self.pumpkin = SKSpriteNode(imageNamed: "pontuacao")
        self.pauseButtom = SKSpriteNode(imageNamed: "button_pause")
        self.hudPause = SKSpriteNode(imageNamed: "Hud_pause")
        self.mainButton = SKSpriteNode(imageNamed: "button_menu")
        
        if !MainMenuScene.flag{
            self.soundButton = SKSpriteNode(imageNamed: "button_sound_on")
        }else{
            self.soundButton = SKSpriteNode(imageNamed: "button_sound_off")
        }
       
        
        // Textos
        self.countCandyLabel = SKLabelNode(fontNamed: "HelveticaNeue-CondensedBold")
        self.metersLabel = SKLabelNode(fontNamed: "HelveticaNeue-CondensedBold")
        
        // Contadores
        self.meters = 0
        
    }
    
    func pauseGame() {
        let playAction = SKAction.run {
            self.addHudPause()
            //self.addMainMenuButton()
            //self.addPlayButtom()
        }
        let pauseAction = SKAction.run {
            self.Gameview.scene?.view?.isPaused = true
        }
        let sequence = SKAction.sequence([playAction,pauseAction])
        Gameview.run(sequence)
    }
    
    func playGame() {
        Gameview.scene?.view?.isPaused = false
        removePauseHud()
    }
    
    //MARK:- PAUSE
    
    func pauseButtonHUD() {
        pauseButtom.name = "pauseButton"
        pauseButtom.zPosition = 10
        pauseButtom.setScale(2.5)
        pauseButtom.texture?.filteringMode = .nearest
        self.cameraNode.addChild(pauseButtom)
    }
    
    
    
    //MARK:- ABOBORA / CONTADOR
    func pumpkinHUD() {
        pumpkin.name = "pumpkin"
        pumpkin.zPosition = 10
        pumpkin.setScale(2.5)
        //pumpkin.size = CGSize(width: 50, height: 50)
        pumpkin.texture?.filteringMode = .nearest
        self.cameraNode.addChild(pumpkin)
    }
    
    
    func countCandyLabelHUD() {
        countCandyLabel.fontName = "Early GameBoy"
        countCandyLabel.zPosition = 10
        countCandyLabel.fontColor = .white
        countCandyLabel.name = "countCandyLabel"
        countCandyLabel.horizontalAlignmentMode = .left
        countCandyLabel.text = "0"
        cameraNode.addChild(countCandyLabel)
    }
    
    func incrementCandyLabel(count: Int) {
        self.countCandyLabel.text = "\(count)"
    }
    
    
    //MARK:- METROS
    func metersLabelHUD() {
        metersLabel.fontName = "Early GameBoy"
        metersLabel.fontSize = 30
        metersLabel.fontColor = .white
        metersLabel.zPosition = 10
        metersLabel.name = "metersLabel"
        //metersLabel.horizontalAlignmentMode = .left
        metersLabel.text = "0"
        cameraNode.addChild(metersLabel)
    }
    
    
    func startCountMeters() {
        let sumMeters = SKAction.run {
            self.meters += 10
            self.metersLabel.text = "\(self.meters)"
            // Mandar aqui para o GameCenter
            GameScene.sharedGVC.distanceReachedInOneGame = Float(self.meters)
        }
        let wait = SKAction.wait(forDuration: 0.2)
        let sequence = SKAction.sequence([sumMeters,wait])
        
        self.metersLabel.run(sequence) {
            self.startCountMeters()
        }
    }
    
    func getMeters() -> Int {
        self.meters
    }
    
    func clearMeters() {
        self.meters = 0
        self.metersLabel.text = "\(self.meters)"
        // mandar para a GameCenter
        // GameScene.sharedGVC.distanceReachedInOneGame = 0
    }
    
}

//MARK:- Metodos privados
extension HUD {
    
    private func addHudPause(){
        hudPause.name = "hudPause"
        hudPause.texture?.filteringMode = .nearest
        hudPause.zPosition = 11
        hudPause.setScale(2)
        
        self.addPlayButtom()
        self.addMainMenuButton()
        self.addAudioButton()
        cameraNode.addChild(hudPause)
    }
    
    
    // adcionar botao de play
    private func addPlayButtom() {
        playButtom.name = "playButtom"
        playButtom.texture?.filteringMode = .nearest
        playButtom.zPosition = 15
        playButtom.setScale(1.8)
        cameraNode.addChild(playButtom)
    }
    
    // adicionar o botao de menu
    private func addMainMenuButton(){
        mainButton.name = "mainButton"
        mainButton.texture?.filteringMode = .nearest
        mainButton.zPosition = 15
        mainButton.setScale(1.8)
        cameraNode.addChild(mainButton)
    }
    
    
    // alterar
    private func addAudioButton(){
        soundButton.name = "soundButton"
        soundButton.texture?.filteringMode = .nearest
        soundButton.zPosition = 15
        soundButton.setScale(1.8)
        cameraNode.addChild(soundButton)
    }
    
    
    // remover tpdp p hud de pause
    private func removePauseHud() {
        self.hudPause.removeFromParent()
        self.playButtom.removeFromParent()
        self.mainButton.removeFromParent()
        self.soundButton.removeFromParent()
        
    }
    
    
    
}
