//
//  ContentView.swift
//  Memorize
//
//  Created by Joe Burdge on 12/26/21.
//

import SwiftUI

struct ContentView: View {
   /*
    @State var emojis=["🚂","🚀","🚁","🏍","🚗","🚐","🚚","🚜","🚔","🚟","🚘","🛬","🛵","🚲","🛴","🏄🏼","🏎","🚅"]
    @State var emojiCount = 18
    @State var themePick = 1
    */
    @ObservedObject var viewModel: EmojiMemoryGame //this is the "game" model. the syntax here is just to remind us that its generic is "view model". Load the game data.
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns:
                        [GridItem(.adaptive(minimum: 68))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
        .font(.largeTitle)
        .padding(.horizontal)
        
    }
    
    /*
    var T1: some View {
        Button {
            themePick=1
            emojis=["🚂","🚀","🚁","🏍","🚗","🚐","🚚","🚜","🚔","🚟","🚘","🛬","🛵","🚲","🛴","🏄🏼","🏎","🚅"].shuffled()
            emojiCount=emojis.count
        } label: {
            VStack {
                Text("Autos").font(.body)
                Image(systemName: "car")
            }
        }
        
    }
    var T2: some View {
        Button {
            themePick=2
            emojis=["⚽️","🏀","🏈","⚾️","🥎","🏐","🥏","🎱"].shuffled()
            emojiCount=emojis.count
        } label: {
            VStack {
                Text("Sports").font(.body)
                Image(systemName: "flag")
            }
        }
    }
    var T3: some View {
        Button {
            themePick=3
            emojis=["🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🥝","🍆","🥑","🥦","🌶","🥕","🥐","🧄","🍠"].shuffled()
            emojiCount=emojis.count
        } label: {
            VStack {
                Text("Foods").font(.body)
                //Text("🍌")
                Image(systemName: "scissors")
            }
        }
    }
     */
}

struct CardView: View {
    //var content: String
    //@State var isFaceUp: Bool = true
    let card: MemoryGame<String>.Card
    
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0) //0 is fully transparent, 1 is fully opaque
            }
            
            else {
                shape.fill()
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
