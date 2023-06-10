//
//  CoverImageView.swift
//  Africa
//
//  Created by Gaurang on 3/29/23.
//

import SwiftUI

struct CoverImageView: View {
    
    let coverImages : [CoverImage] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
    }
}
