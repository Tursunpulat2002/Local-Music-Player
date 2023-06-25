//
//  PlaybackControlButtonView.swift
//  Music Player
//
//  Created by Tursunpulat Orolov on 6/13/23.
//

import SwiftUI

struct PlaybackControlButtonView: View {
    var systemName: String = "play"
    var fontSize: CGFloat = 24
    var color: Color = .white
    var action: () -> Void
    
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundColor(color)
        }

    }
}

struct PlaybackControlButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackControlButtonView(action: {})
    }
}
