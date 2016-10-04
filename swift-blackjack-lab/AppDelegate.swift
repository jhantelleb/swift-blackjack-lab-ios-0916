//
//  AppDelegate.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var dealer = Dealer()
    
    func playBlackjack(withBet: UInt) {
        
        
        while dealer.house.cards.count <= 5 ||
           dealer.player.cards.count <= 5 {
            if dealer.place(bet: withBet) {
                dealer.turn(house: dealer.house)
                dealer.turn(house: dealer.player)
                print(dealer.house.description)
            }
        }
        
        print(dealer.winner())
        
    }
    
    /**
     
     * Declare any custom properties here.
     
     */
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        /*
         
         * Call your custom classes here when running the scheme.
         
         */
        
        // Do not alter
        return true  //
    }   ///////////////
    
    /*
     
     * Write your playBlackjack method in here
     
     */
    
}

