//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Jhantelle Belleza on 10/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    var deck: Deck = Deck()
    var house: House = House()
    var player: House = House()
    var bet: UInt = 0

    func place(bet: UInt) -> Bool {
         if house.canPlace(bet: bet) ||
            player.canPlace(bet: bet) {
            self.bet = bet
            return true }
        
        return false
    }
    
    func deal() {
        var counter = 0
        
        if !house.cards.isEmpty &&
           !player.cards.isEmpty {
           house.cards = []
           player.cards = []
        }
        
        while counter < 2 {
        house.cards.append(deck.drawCard())
        player.cards.append(deck.drawCard())
        counter += 1
        self.house.stayed = false
        self.player.stayed = false
        }
        
        
    }
    
    func turn(house: House){
        if house.mustHit { //If the house object is allowed to take a card
            if house.mayHit {
            if house.cards.isEmpty { //house can take a new card
              deal()
            } else {
              house.cards.append(deck.drawCard())
            }
        } else if !house.mayHit || house.stayed {
            house.cards = []
            player.cards = []
        }
        }
    }
    
    func winner() -> String {
        if player.busted ||
           house.blackjack ||
            ( house.stayed && player.stayed &&
            ( (house.handscore > player.handscore) ||
              (player.handscore <= house.handscore) )) &&
              (!player.mayHit && !house.mayHit)  {
            return "house wins"
        } else if ( player.cards.count == 5 && player.busted == false ) ||
                  ( house.busted || player.blackjack ) ||
                  ( house.stayed && player.stayed &&
                    player.handscore > house.handscore ) &&
                    !player.mayHit && !house.mayHit { //Player wins!
            return "player wins"
        } else if ( player.blackjack && house.blackjack ) ||
                  ( player.handscore == house.handscore ) { //Tie!
            return "no winner"
        }
        
        return "no winner"
    }
    
    func award() -> String{
       
        let winner = self.winner()
        switch winner {
            
        case "player wins":
            player.didWin(bet: bet)
            house.didLose(bet: bet)
        case "house wins":
            house.didWin(bet: bet)
            player.didLose(bet: bet)
        default:
           return winner
        }
        
        return winner
    }
    

}
