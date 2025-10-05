//
//  DataService.swift
//  TestApp
//
//  Created by Даша Суворова on 5.10.25.
//

import Foundation
import SwiftData

class DataService {

    func saveFavorite(product: ModelProducts, context: ModelContext) {
        let favorite = FavoriteProduct(id: product.id,
                                       title: product.title,
                                       details: product.description,
                                       price: Double(product.price))
        context.insert(favorite)
    }
    
    func deleteFavorite(product: FavoriteProduct, context: ModelContext) {
        context.delete(product)
        try? context.save()
    }
}
