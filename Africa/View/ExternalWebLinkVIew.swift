//
//  ExternalWebLinkVIew.swift
//  Africa
//
//  Created by Gaurang on 3/30/23.
//

import SwiftUI

struct ExternalWebLinkVIew: View {
    
    var animal : Animal
    var body: some View {
        HStack{
            Image(systemName: "globe")
                
            Text("Wikipedia")
            Spacer()
            
            Group{
                Image(systemName: "arrow.up.right.square")
                Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://www.google.com")!)
                
            }
            .foregroundColor(.accentColor)
        }
    }
}

struct ExternalWebLinkVIew_Previews: PreviewProvider {
    
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebLinkVIew(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
