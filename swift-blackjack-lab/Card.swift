//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Jhantelle Belleza on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

public class Card {
    
    var suit: String
    var rank: String
    var cardLabel: String{
        return "\(suit)\(rank)"
    }
    var cardValue: UInt {
        return determineCardValue(rank)
    }
    var description: String {
        return cardLabel
    }
    
    init(suit: String, rank: String){
        self.suit = suit
        self.rank = rank
    }
    
    class func validSuits()->[String]{
       let validSuits = ["♠︎", "♥︎", "♦︎", "♣︎"]
       return validSuits
    }
    
    class func validRanks()->[String]{
        let validRanks = ["A","2","3","4","5", "6", "7", "8", "9", "10", "J","Q","K"]
        return validRanks
    }
    
    func determineCardValue(_ rank: String)->UInt{
    
            switch rank{
                case "A":
                return 1
                case "J", "Q", "K":
                return 10
                default:
                return UInt(rank)!
            }
        
    
    }
}

public func descriptionFor(cardArray: [Card])->String{
    var cardLabels = String()
    
    for card in cardArray {
        cardLabels =
        ("\(card.suit)\(card.rank) \n")}
    
    return cardLabels
}










