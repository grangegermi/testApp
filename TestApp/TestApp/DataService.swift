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
    
    func addToCart(product: ModelProducts, context: ModelContext) {
        let descriptor = FetchDescriptor<CartProduct>(
            predicate: #Predicate { $0.idCart == product.id }
        )
        
        if let existing = try? context.fetch(descriptor).first {
            
            existing.quantity += 1
        } else {
            
            let item = CartProduct(
                idCart: product.id,
                title: product.title,
                price: product.price,
                quantity: 1
            )
            context.insert(item)
        }
        try? context.save()
    }
    
    func deleteFromCart(product: CartProduct, context: ModelContext){
        if product.quantity > 1 {
            product.quantity -= 1
        } else {
            context.delete(product)
        }
        try? context.save()
    }
    
    func deleteAllCart(context: ModelContext){
        let descriptor = FetchDescriptor<CartProduct>()
        if let existing = try? context.fetch(descriptor).first {
            context.delete(existing)
        }
        try? context.save()
    }
}
