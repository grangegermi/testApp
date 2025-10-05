//
//  ContentView.swift
//  TestApp
//
//  Created by Даша Суворова on 4.10.25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var apiService = ApiService()
    @State private var searchText: String = ""
    
    var  searchTitles: [ModelProducts] {
        if searchText.isEmpty {
            apiService.products
        }
        else {
            apiService.products.filter{$0.title.localizedStandardContains(searchText)}
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.appBackround.ignoresSafeArea()
                ScrollView{
                    ForEach(searchTitles, id: \.id) { product in
                        NavigationLink(value: product) {
                            CellView(product: product)
                                .cornerRadius(8)
                        }
                        .tint(.black)
                    }
                }
                .searchable(text: $searchText)
                .navigationTitle("Products")
                .navigationDestination(for: ModelProducts.self) {product in
                    ProductView(product: product)
                }
            }
        }
        .padding()
        .background(Color.appBackround)
        .task {
            do {
                try await apiService.getData()
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
}

//MARK: - CellView
struct CellView: View {
    var product: ModelProducts
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 6) {
                Text(product.title)
                    .font(Font.system(size: 16, weight: .bold))
                    .lineLimit(1)
                Text(product.description)
                    .font(Font.system(size: 14))
                    .lineLimit(2)
                Text(String(format: "%.2f$", product.price))
                    .font(Font.system(size: 12, weight: .bold))
            }
            .padding()
            .background(Color.white)
        }
    }
}

#Preview {
    ContentView()
}
