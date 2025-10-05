//
//  ModelProduckts.swift
//  TestApp
//
//  Created by Даша Суворова on 4.10.25.
//

import Foundation

struct ModelProducts: Codable, Hashable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let image: String
    let category: String
    let rating: Rating
}

struct Rating: Codable, Hashable {
    let rate: Double
    let count: Int
}
