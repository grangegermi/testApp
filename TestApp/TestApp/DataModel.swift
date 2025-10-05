//
//  DataModel.swift
//  TestApp
//
//  Created by Даша Суворова on 5.10.25.
//

import Foundation
import SwiftData

@Model
class FavoriteProduct {
    @Attribute(.unique) var id: Int
    var title: String
    var details: String
    var price: Double
    var image: String?
    
    init(id: Int, title: String, details: String, price: Double, image: String? = nil) {
        self.id = id
        self.title = title
        self.details = details
        self.price = price
        self.image = image
    }
}
