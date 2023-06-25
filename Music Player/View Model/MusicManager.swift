//
//  MusicManager.swift
//  Music Player
//
//  Created by Tursunpulat Orolov on 6/13/23.
//

import Foundation
import AVKit
import MediaPlayer

class MusicManager: ObservableObject{
    @Published var music: Music = Music.standard
    @Published var player: AVAudioPlayer?
    @Published var isPlaying: Bool = false
    @Published var isLooping: Bool = false
    
    init(){}
    
    func stripFileExtension ( _ filename: String ) -> String {
        var components = filename.components(separatedBy: ".")
        guard components.count > 1 else { return filename }
        components.removeLast()
        return components.joined(separator: ".")
    }
    
    func startPlayer(track: URL, isPreview: Bool = false) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: track)
            
            if isPreview{
                player?.prepareToPlay()
            }else{
                player?.play()
                isPlaying = true
            }
        } catch{
            print("Failed to initialize player", error)
        }
    }
    
    func playPause(){
        guard let player = player else {
            print("Instance of player not found")
            return
        }
        
        if player.isPlaying{
            player.pause()
            isPlaying = false
        }else{
            player.play()
            isPlaying = true
        }
    }
    
    func stop(){
        guard let player = player else { return }
        
        if player.isPlaying{
            player.stop()
            isPlaying = false
        }
    }
    
    func toggleLoop(){
        guard let player = player else { return }
        
        player.numberOfLoops = player.numberOfLoops == 0 ? -1 : 0
        isLooping = player.numberOfLoops != 0
    }
    
    func test(url: [URL]){
        let fileManager = FileManager.default
        
        do{
            let appDir = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let newDirURL = appDir.appendingPathComponent("Songs")
            
            var isDir: ObjCBool = false
            if fileManager.fileExists(atPath: newDirURL.path, isDirectory: &isDir) {
                if isDir.boolValue {
                    // file exists and is a directory
                } else {
                    // file exists and is not a directory
                    print("File exists and is not a directory.")
                }
            } else {
                // Create directory 'songs'
                try fileManager.createDirectory(at: newDirURL, withIntermediateDirectories: true, attributes: nil)
            }
            
            for i in url{
                let destinationURL = newDirURL.appendingPathComponent(i.lastPathComponent)
                try fileManager.moveItem(at: i, to: destinationURL)
            }
        }catch{
            print("Error: ", error)
        }
    }
}
