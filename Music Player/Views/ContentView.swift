//
//  ContentView.swift
//  Music Player
//
//  Created by Tursunpulat Orolov on 6/13/23.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    @EnvironmentObject var manager: MusicManager
    @State private var showPlayer: Bool = false
    @State var openFile: Bool = true
    @State private var selectedTab: Tabs = .house
    
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                Button{
                    openFile.toggle()
                }label: {
                    Label("Import", systemImage: "square.and.arrow.down.fill")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }
                
                Text(manager.music.title)
                    .frame(minWidth: UIScreen.main.bounds.width * 9/10)
                    .font(.title)
                    .foregroundColor(.red)
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(20)
                
                Button {
                    showPlayer.toggle()
                } label: {
                    Label("Play", systemImage: "play.fill")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }
            }
            
            VStack{
                Spacer()
                CustomTabBarView(selectedTab: $selectedTab)
                    .frame(width: UIScreen.main.bounds.width*1.08)
                    .offset(y: 15)
            }.ignoresSafeArea()
            
        }.fullScreenCover(isPresented: $showPlayer) {
            PlayerView()
        }
//        .fileImporter(isPresented: $openFile, allowedContentTypes: [.audio]) { result in
//            do{
//                let fileUrl = try result.get()
//
//                manager.music = Music(title: manager.stripFileExtension(fileUrl.lastPathComponent), duration: 60, track: fileUrl, image: "")
//            }catch{
//                print("Eroor 1", error)
//            }
//
//        }
//        .fileImporter(isPresented: $isOpen, allowedContentTypes: [.audio], allowsMultipleSelection: true) { result in
//            switch result {
//            case .success(let urls):
//                // Process the selected files' URLs
//                manager.test(url: urls)
//            case .failure(let error):
//                // Handle failure
//                print("Error importing files: \(error)")
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MusicManager())
    }
}
