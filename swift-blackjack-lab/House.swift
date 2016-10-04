//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Jhantelle Belleza on 10/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House: Player {
    var mustHit: Bool {
        if super.handscore < 17 { return true } else { return false }
    }
    
    convenience init(){
        self.init(name: "House")
        tokens = 1000
    }
}
