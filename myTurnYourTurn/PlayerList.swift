//
//  PlayerList.swift
//  myTurnYourTurn
//
//  Created by Ana Freitas Sampaio on 2/16/19.
//  Copyright © 2019 Ana Caroline Freitas Sampaio. All rights reserved.
//

import Foundation
import UIKit

class PlayerList {
    
    var playerList: [Player] = []
    
    init() {
        playerList.append(Player(name:"Carol", color: UIColor.red))
        playerList.append(Player(name:"Vini", color: UIColor.blue))
        playerList.append(Player(name:"Vini", color: UIColor.blue))
    }

    func newPlayer() -> Player {
        let player = Player(name: "Laila", color: UIColor.green)
        playerList.append(player)
        return player
    }
    
}
