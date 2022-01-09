//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Joe Burdge on 12/28/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚂","🚀","🚁","🏍","🚗","🚐","🚚","🚜","🚔","🚟","🚘","🛬","🛵","🚲","🛴","🏄🏼","🏎","🚅"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8 ) { pairIndex in
            emojis[pairIndex]
        }
    }
        
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
        
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    //Mark: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
