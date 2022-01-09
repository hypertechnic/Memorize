//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Joe Burdge on 12/26/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
