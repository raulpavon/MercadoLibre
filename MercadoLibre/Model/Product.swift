//
//  Product.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import Foundation

struct Product: Codable {
    let results: [Result]
    
    init() {
        self.results = []
    }
}

struct Result: Codable {
    let id: String
    let title: String
    let price: Double
    let thumbnail: String
    let attributes: [Attribute]
    
    var priceFormatted: String {
        return String(format: "%.2f", price)
    }
}

struct Attribute: Codable {
    let name: String
    let valueName: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case valueName = "value_name"
    }
}
