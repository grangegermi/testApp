//
//  ApiService.swift
//  TestApp
//
//  Created by Даша Суворова on 4.10.25.
//

enum AppError: Error {
    case networkError
    case decodingError
}

import Foundation

@MainActor
class ApiService: ObservableObject {
    private let url = "https://fakestoreapi.com/products"
        
    @Published var products: [ModelProducts] = []
    
     func getData() async throws ->  [ModelProducts] {
         
         guard let url = URL(string: url) else {
              throw AppError.networkError
         }
         
         do {
             let (data, _) =  try await URLSession.shared.data(from: url)
             let decoder = JSONDecoder()
             let productsData = try decoder.decode([ModelProducts].self, from: data)
             self.products = productsData
              print(products)
         } catch {
             throw AppError.decodingError
         }
        
        return products
    }
}
