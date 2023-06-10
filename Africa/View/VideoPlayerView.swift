//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Gaurang on 3/30/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    var videoSelected :String
    var videoTitle : String
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4"))
        }
        .overlay(alignment: .topLeading) {
            Image("logo")
                .resizable()
                .frame(width: 32, height: 32)
                .padding(8)
                .scaledToFit()
            
        }
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
