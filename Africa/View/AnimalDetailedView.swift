//
//  AnimalDetailedView.swift
//  Africa
//
//  Created by Gaurang on 3/30/23.
//

import SwiftUI

struct AnimalDetailedView: View {
    var animal : Animal
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical,8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                        .frame(height: 6)
                        .offset(y: 24)
                    )
                
                Text(animal.headline)
                    .padding(.horizontal)
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .multilineTextAlignment(.leading)
                
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalWebLinkVIew(animal: animal)
                }
                .padding(.horizontal)
                
            }
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AnimalDetailedView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            AnimalDetailedView(animal: animals[1])
        }
    }
}
