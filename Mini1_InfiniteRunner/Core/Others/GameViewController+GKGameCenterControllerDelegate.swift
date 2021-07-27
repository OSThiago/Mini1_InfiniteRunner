//
//  GameViewController+GKGameCenterControllerDelegate.swift
//  GameViewController+GKGameCenterControllerDelegate
//
//  Created by Marcos Morais on 27/07/21.
//

import GameKit

extension GameViewController: GKGameCenterControllerDelegate {
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
}
