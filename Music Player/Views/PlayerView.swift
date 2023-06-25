//
//  PlayerView.swift
//  Music Player
//
//  Created by Tursunpulat Orolov on 6/13/23.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var manager: MusicManager
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    var isPreview: Bool = false
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack{
//            Image("Background")
//                .resizable()
//                .scaledToFill()
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                .ignoresSafeArea()
            BackgroundView()
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 32){
                HStack{
                    Button {
                        manager.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                Text(manager.music.title)
                    .padding(.vertical, -20)
                    .font(.title)
                    .foregroundColor(.white)
                
                Text(manager.music.artist)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                if let player = manager.player {
                    VStack(spacing: 5){
                        Slider(value: $value, in: 0...player.duration){editing in
                            isEditing = editing
                            if !editing {
                                player.currentTime = value
                            }
                        }
                        .accentColor(.white)
                        .shadow(color: .blue, radius: 3)
                        
                        HStack{
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            
                            Spacer()
                            
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                        }
                        .font(.caption)
                        .foregroundColor(.white)
                    }.padding()
                    
                    HStack{
                        let color: Color = manager.isLooping ? .indigo : .white
                        PlaybackControlButtonView(systemName: "repeat", color: color){
                            manager.toggleLoop()
                        }
                        
                        Spacer()
                        
                        PlaybackControlButtonView(systemName: "gobackward.10"){
                            player.currentTime -= 10
                        }
                        
                        Spacer()
                        
                        PlaybackControlButtonView(systemName: manager.isPlaying ? "pause.circle.fill"  : "play.circle.fill", fontSize: 44){
                            manager.playPause()
                        }
                        
                        Spacer()
                        
                        PlaybackControlButtonView(systemName: "goforward.10"){
                            player.currentTime += 10
                        }
                        
                        Spacer()
                        
                        PlaybackControlButtonView(systemName: "stop.fill"){
                            manager.stop()
                            dismiss()
                        }
                    }
                    .padding(.vertical, 50)
                }
            }
            .padding(20)
        }
        .onAppear{
            manager.startPlayer(track: manager.music.track, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = manager.player, !isEditing else { return }
            value = player.currentTime
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(isPreview: true)
            .environmentObject(MusicManager())
    }
}
