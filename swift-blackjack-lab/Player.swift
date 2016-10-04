
//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Jhantelle Belleza on 9/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var cards: [Card] = []
    var handscore: UInt { return getHandScore() }
    var blackjack: Bool { return isBlackJack() }
    var busted: Bool { return isBusted() }
    var stayed: Bool = false
    var mayHit: Bool { return canHit() }
    var tokens: UInt = 100
    var description: String { return getDescription() }
    
    init(name: String) {
        self.name = name
    }
    
    private func getDescription() -> String {
        return "player \n cards \n handscore \n blackjack \n busted \n stayed \n tokens"
    }
    
    private func getHandScore() -> UInt{
        var handscore: UInt = 0
        var aceFlag = 0
        var counter = 0
        
        if cards.count > 0 {
            
            for card in cards {
                counter += 1
                //another ace appears and hand scre is busted
                if handscore <= 21 {
                    if card.rank == "A" {
                        aceFlag += 1
                        handscore += 11
                    } else {
                        handscore += card.cardValue }
                }
            }
            
            if aceFlag > 0 &&
             ( handscore > 21 ||
             ( counter == cards.count && handscore != 21))
            {  handscore -= UInt( 10 * aceFlag )
                aceFlag = 0 }
        }
        
        return handscore
    }
    
    private func isBlackJack() -> Bool{
        if cards.count == 2 && handscore == 21
        { return true }
        return false
    }
    
    private func isBusted() -> Bool {
        if handscore > 21 { return true }
        return false
    }
    
    private func canHit() -> Bool {
        if !busted && !blackjack && !stayed { return true }
        return false
    }
    
    func canPlace(bet: UInt) -> Bool {
        if bet <= tokens { return true }
        return false
    }
    
    func didWin(bet: UInt) { tokens += bet }
    
    func didLose(bet: UInt) { tokens -= bet }
    
    
}
