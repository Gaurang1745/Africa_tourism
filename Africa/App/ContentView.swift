//
//  ContentView.swift
//  Africa
//
//  Created by Gaurang on 3/29/23.
//

import SwiftUI

struct ContentView: View {
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive = false
    @State private var gridColumn : Int = 1
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var toolbarIcon = "square.grid.2x2"
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count

        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }

//    init() {
//            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.preferredFont(forTextStyle: .largeTitle)]
//        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont.preferredFont(forTextStyle: .largeTitle)]
//        }
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailedView(animal: animal)
                            } label: {
                                AnimalListViewItem(animal: animal)
                            }
                            
                        }
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailedView(animal: animal)
                                } label: {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                        .animation(.easeIn)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Africa")
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(alignment: .center, spacing: 16) {
//                        Text("Africa")
//                            .multilineTextAlignment(.leading)
                        
                        Button {
                            isGridViewActive=false
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        Button {
                            isGridViewActive=true
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
