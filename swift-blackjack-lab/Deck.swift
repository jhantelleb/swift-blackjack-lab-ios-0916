//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Jhantelle Belleza on 9/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck{
    private var holdCardArray: [Card] = []
    private var undealtCardArray: [Card] {
        get { return generateDeck() }
        set { newValue }}
    
    var description: String {
        return setDescription() }
    
    private func generateDeck()->[Card] {
        var generateDeck: [Card] = []
        
        if !Card.validRanks().isEmpty &&
            !Card.validSuits().isEmpty {
            for suits in Card.validSuits() {
                for rank in Card.validRanks() {
                    generateDeck.append(Card(suit: suits, rank: rank))
                }}
        }
        return generateDeck
    }
    
    private func setDescription() -> String {
        
        let describeUndealt: String = descriptionFor(cardArray: undealtCardArray)
        let describeDealt: String = descriptionFor(cardArray: holdCardArray)
        
        let description: String = "Cards Remaining: \(describeUndealt)\nCards Dealt: \(describeDealt)"
        
        return description
    }
    
    func drawCard() -> Card {
        var dealCard = Card(suit: "", rank: "")
        var counter = 0
        let shuffledCards = shuffle()
        
        if shuffledCards.count > 0 {
            for (index, undealt) in shuffledCards.enumerated() {
                if counter <= 2 {
                    holdCardArray.append(undealt)
                    dealCard = undealt
                    undealtCardArray.remove(at: index)
                    counter += 1
                }}
        }
        return dealCard
    }
    
    func shuffle() -> [Card] {
        var shuffleCards = [Card]()
        
        for value in undealtCardArray {
            shuffleCards.append(value)
        }
        
        shuffleCards.shuffle()
        return shuffleCards
    }
}

extension Array {
    mutating func shuffle()
    {
        for _ in 0..<52
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
