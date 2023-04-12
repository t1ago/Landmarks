//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Tiago Henrique Piantavinha on 04/04/23.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showProfile = false
    
    var favorites: [Landmark] {
        modelData.landmarks.filter { $0.isFavorite }
    }
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(height: 200)
                    .listRowInsets(EdgeInsets())
                
                if favorites.count > 0 {
                    CategoryRow(categoryName: "Favorites", items: favorites)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .padding(.bottom, 20)
                }
                
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowSeparator(.hidden)
                .padding(.bottom, 20)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Features")
            .toolbar {
                Button {
                    showProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }

            }
            .sheet(isPresented: $showProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
