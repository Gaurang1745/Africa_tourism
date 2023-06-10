//
//  InsetFactView.swift
//  Africa
//
//  Created by Gaurang on 3/30/23.
//

import SwiftUI

struct InsetFactView: View {
    var animal : Animal
    var body: some View {
        GroupBox{
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 160, maxHeight: 180)
        }
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
