//
//  ProducktView.swift
//  TestApp
//
//  Created by Даша Суворова on 5.10.25.
//

import Foundation
import SwiftUI
import SwiftData

struct ProductView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var favorites: [FavoriteProduct]
    var dataService: DataService = DataService()
    var product: ModelProducts
    private var isFavorite: Bool {
        favorites.contains { $0.id == product.id }
    }
    
    var body: some View {
        ZStack{
            Color.appBackround.ignoresSafeArea()
            VStack {
                AsyncImage(url: URL(string: product.image ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 300, height: 300)
                .cornerRadius(10)
                .padding()
                VStack(alignment: .leading, spacing: 20){
                    Text(product.title)
                        .font(Font.system(size: 20, weight: .bold))
                    Text(product.description)
                        .font(Font.system(size: 16, weight: .regular))
                }
                .padding(.bottom, 20)
                HStack(spacing: 10) {
                    Button {
                        
                    } label: {
                        Image(systemName:"trash")
                            .tint(Color.black)
                    }
                    Button {
                        dataService.saveFavorite(product: product, context: modelContext)
                        
                    } label: {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .tint(Color.black)
                    }
                }
            }
        }
    }
}
