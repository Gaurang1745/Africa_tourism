//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Gaurang on 3/30/23.
//

import SwiftUI

struct InsetGalleryView: View {
    var animal :Animal
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            }
        }
        
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetGalleryView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
