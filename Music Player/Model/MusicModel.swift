//
//  MusicModel.swift
//  Music Player
//
//  Created by Tursunpulat Orolov on 6/13/23.
//

import Foundation

struct Music {
    let id = UUID()
    let title: String
    let duration: TimeInterval
    let track: URL
    let image: String
    let artist: String
    var isFavorited: Bool
    
    static let standard = Music(title: "Blood Water", duration: 141, track: URL(string: "Blood_Water.mp3")!, image: "Drop img", artist: "IDK", isFavorited: true)
}
