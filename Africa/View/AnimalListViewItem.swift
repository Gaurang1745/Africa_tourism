//
//  AnimalListViewItem.swift
//  Africa
//
//  Created by Gaurang on 3/30/23.
//

import SwiftUI

struct AnimalListViewItem: View {
    
    let animal : Animal
    
    var body: some View {
        HStack (alignment: .center, spacing: 16){
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack (alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .fontWeight(.heavy)
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
        
    }
}

struct AnimalListViewItem_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalListViewItem(animal: animals[1])
            .previewLayout(.sizeThatFits).padding()
    }
}
