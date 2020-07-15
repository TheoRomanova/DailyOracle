//
//  PlayerService.swift
//  DailyOracle
//
//  Created by Theodora on 7/15/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import Foundation
import AVFoundation

struct PlayerService {
    
    private static var player =  AVAudioPlayer()
    
    static func getPlayer() -> AVAudioPlayer {
        return player
    }
    
    static func playSong(song: String) {
        let url = Bundle.main.url(forResource: song, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}


