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
        Unlockable(id: 0, name: "Takoyaki", sprite: "Takoyaki", description: "Takoyaki is a delicious Japanese dish that is basically described as deep-fried octopus pieces drizzled with a savory sauce and often topped with seaweed flakes and dried fish flakes.", isUnlocked: true, clickPrompt: "Learn how to make this delicious dish!", urlInfo: "https://www.youtube.com/watch?v=yjyddfwijPM&ab_channel=JustOneCookbook"),
        Unlockable(id: 1, name: "Sushi", sprite: "Sushi", description: "Sushi, while a great dish, isn't for everyone.  People either love or hate sushi, but it depends on what kind you try.", isUnlocked: false, clickPrompt: "Find out what types of sushi you like!", urlInfo: "https://www.youtube.com/watch?v=ZzLPUoetSHw&ab_channel=Epicurious"),
        Unlockable(id: 2, name: "Egg", sprite: "Egg", description: "You can never go wrong with eggs.  Eggs can be cooked in so many different ways!", isUnlocked: false, clickPrompt: "See all the ways to cook an egg!", urlInfo: "https://www.youtube.com/watch?v=qWAagS_MANg&ab_channel=BonApp%C3%A9tit"),
        Unlockable(id: 3, name: "Konpeito", sprite: "konpeito", description: "A Japanese candy, also known as Star Candy!  It's quite similar to rock candy, but bite-sized.", isUnlocked: false, clickPrompt: "Learn how to create these colorful star candies!", urlInfo: "https://www.youtube.com/watch?v=E_ErUVdcyzs&ab_channel=CakeDecorist"),
        Unlockable(id: 4, name: "Marshmallow", sprite: "marshmallow", description: "Great for roasting, gr4eat for putting in hot chocolate, great for making desserts with, great for snacking on, the list goes on!!", isUnlocked: false, clickPrompt: "Yes, you can make these yourself", urlInfo: "https://www.youtube.com/watch?v=t-Th6VeP77o&ab_channel=JoshuaWeissman"),
        Unlockable(id: 5, name: "Treasure Coin", sprite: "treasure-coin", description: "Is this a real gold coin?  Or is it chocolate?", isUnlocked: false, clickPrompt: "Learn how to make your own treasure!", urlInfo: "https://www.youtube.com/watch?v=VTJtJBMMjCM&ab_channel=ASMRwithKia"),
        Unlockable(id: 6, name: "Mini Bedroom", sprite: "micro-bedroom", description: "You can't relax in this, but it's sure fun to make and neat to have!", isUnlocked: false, clickPrompt: "And here's how you can make one!", urlInfo: "https://www.youtube.com/watch?v=-oAN42rSSEI&ab_channel=fun_and_craft")
    ]
}

struct Unlockable : Identifiable, Decodable {
    var id : Int
    var name: String
    var sprite : String
    var description : String
    var isUnlocked : Bool
    var clickPrompt : String
    var urlInfo : String
}
