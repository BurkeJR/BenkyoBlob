//
//  Unlockable.swift
//  BenkyoBlob
//
//  Created by Daniel Li on 11/14/22.
//

import Foundation

struct AllUnlockables : Decodable {
    var treasure : [Unlockable] =
    [
        Unlockable(id: 0, name: "Takoyaki", sprite: "Takoyaki", description: "Takoyaki is a delicious Japanese dish that is basically described as deep-fried octopus pieces drizzled with a savory sauce and often topped with seaweed flakes and dried fish flakes.", isUnlocked: false),
        Unlockable(id: 1, name: "Sushi", sprite: "Sushi", description: "Sushi, while a great dish, isn't for everyone.  People either love or hate sushi, but it depends on what kind you try.", isUnlocked: false),
        Unlockable(id: 2, name: "Egg", sprite: "Egg", description: "You can never go wrong with eggs.  Eggs can be cooked in so many different ways!", isUnlocked: false),
        Unlockable(id: 3, name: "Konpeito", sprite: "konpeito", description: "A Japanese candy, also known as Star Candy!  It's quite similar to rock candy, but bite-sized.", isUnlocked: false),
        Unlockable(id: 4, name: "Marshmallow", sprite: "marshmallow", description: "Great for roasting, gr4eat for putting in hot chocolate, great for making desserts with, great for snacking on, the list goes on!!", isUnlocked: false),
        Unlockable(id: 5, name: "Treasure Coin", sprite: "treasure-coin", description: "Is this a real gold coin?  Or is it chocolate?", isUnlocked: false),
        Unlockable(id: 6, name: "Mini Bedroom", sprite: "micro-bedroom", description: "Is this a real gold coin?  Or is it chocolate?", isUnlocked: false)
    ]
}

struct Unlockable : Identifiable, Decodable {
    var id : Int
    var name: String
    var sprite : String
    var description : String
    var isUnlocked : Bool
}
