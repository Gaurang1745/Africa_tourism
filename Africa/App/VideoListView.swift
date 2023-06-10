//
//  VideoListView.swift
//  Africa
//
//  Created by Gaurang on 3/29/23.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videos : [Video] = Bundle.main.decode("videos.json")
    
    var body: some View {
        NavigationView {
            List{
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical,8)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
