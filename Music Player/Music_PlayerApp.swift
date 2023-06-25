//
//  Music_PlayerApp.swift
//  Music Player
//
//  Created by Tursunpulat Orolov on 6/13/23.
//

import SwiftUI

@main
struct Music_PlayerApp: App {
    @EnvironmentObject var manager: MusicManager
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MusicManager())
        }
    }
}
