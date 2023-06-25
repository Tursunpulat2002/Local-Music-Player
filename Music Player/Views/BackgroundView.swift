//
//  BackgroundView.swift
//  Music Player
//
//  Created by Tursunpulat Orolov on 6/22/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            // Blue patch
            Ellipse()
                .fill(Color.blue.opacity(0.25))
                .blur(radius: 50)
                .frame(width: 450, height: 800)
                .offset(x: -50, y: 150)
            
            // Red patch
            Ellipse()
                .fill(Color.red.opacity(0.25))
                .blur(radius: 50)
                .frame(width: 400, height: 800)
                .offset(x: 200, y: 120)
            
            // Green patch
            Ellipse()
                .fill(Color.green.opacity(0.25))
                .blur(radius: 50)
                .frame(width: 800, height: 500)
                .offset(x: 0, y: -270)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
