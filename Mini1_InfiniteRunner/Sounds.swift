//
//  Sounds.swift
//  Mini1_InfiniteRunner
//
//  Created by Douglas Figueirôa on 28/07/21.
//

import Foundation
import SpriteKit
import AVFoundation

class Sounds {
 
    static var shared = Sounds()
    var audioPlayer: AVAudioPlayer?
//    var VolumeSom: Bool = UserDefaults.standard.stateSom()
    var VolumeSom: Bool!

    var numberOfContinuesBeforeStartOver = 0
    var readyToDisplayAds = false
        
    func playSoundMenu(){
        if UserDefaults.standard.stateMusic() == true{
            let path = Bundle.main.path(forResource: "Sound8bitMainMenu.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            print(path)

            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                self.audioPlayer!.play()
                audioPlayer?.numberOfLoops = -1
            } catch {
                print("deu certo não")// couldn't load file
            }
        }
    }
    
    func playSoundGameStarted(){
        if UserDefaults.standard.stateMusic() == true{
            let path = Bundle.main.path(forResource: "Sound8bitGameStarted.wav", ofType:nil)!
            let url = URL(fileURLWithPath: path)
            print(path)

            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                self.audioPlayer!.play()
                audioPlayer?.numberOfLoops = -1
            } catch {
                print("deu certo não")// couldn't load file
            }
        }
        
    }
        
    func pause(){
        self.audioPlayer?.pause()
        
    }
    
    
//
//    func tocando() -> AVAudioPlayer{
//            audioPlayer?.isPlaying
//        return audioPlayer
//    }
}

extension UserDefaults {

//    Som
    func stateMusic() -> Bool {  // se nao existe sera true
        return self.object(forKey: "song") != nil ? self.bool(forKey: "song") : true
    }

    func changeStateMusic(_ newState: Bool) { // verifica ser é true ou false
        UserDefaults.standard.set(newState, forKey: "song")
    }
}
