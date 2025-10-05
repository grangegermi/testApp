//
//  Favorites.swift
//  TestApp
//
//  Created by Даша Суворова on 5.10.25.
//

import SwiftUI
import SwiftData

struct Favorites: View {
    var dataService = DataService()
    @State var searchText: String = ""
    @Environment(\.modelContext) var modelContext
    @Query(sort: \FavoriteProduct.title) private var favorites: [FavoriteProduct]
    
    var  searchFavorites: [FavoriteProduct] {
        if searchText.isEmpty {
            favorites
        }
        else {
            favorites.filter{$0.title.localizedStandardContains(searchText)}
        }
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.appBackround.ignoresSafeArea()
                List(searchFavorites) { favorite in
                    Text(favorite.title)
                        .listRowBackground(Color.appBackround)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                dataService.deleteFavorite(product: favorite, context: modelContext)
                            }
                        }
                }
                .listStyle(.plain)
            }
            .searchable(text: $searchText)
            .navigationTitle("Favorites")
        }
        
    }
}

#Preview {
    Favorites()
}
