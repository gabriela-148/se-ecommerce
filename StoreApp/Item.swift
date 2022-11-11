//
//  Item.swift
//  StoreApp
//
//  Created by lauren boyle on 11/9/22.
//

import SwiftUI

struct Item: Codable, Equatable, Identifiable {
    let id = UUID()
    var name: String
    var price: Int
    var description: String
    var category: String
    var size: String
    
    var mainImage: String {
        name
    }
    
    
    #if DEBUG
    static let example = Item(name: "Mens Daily Wear Shorts", price: 30, description: "The best shorts to lounge in or run errands. They are versatile and a must have.", category: "Mens", size: "S, M, L, XL")
    #endif
}

let items = [
    Item(name: "Mens Sunday Best Pants", price: 45, description: "Look your best with these pants. Whether you have dinner in a nice restaurant or going for a walk in the park, these pants will complete the look.", category: "Mens", size: "S, M, L, XL"),
    Item(name: "Mens Plain White Tee", price: 25, description: "A closet staple. This tee can be dressed up or down and is a must have.", category: "Mens", size: "S, M, L"),
    Item(name: "Womens Baggy Jeans", price: 65, description: "Spruce up your look with these trendy jeans. These jeans have oversized look with a dark wash.", category: "Womens", size: "XS, S, M, L, XL"),
    Item(name: "Womens Green Chunky Knit", price: 40, description: "The best sweater for the changing seasons. Get in the holiday spirit with this green oversized sweater.", category: "Womens", size: "S, M, L"),
    Item(name: "Womens Professional Joggers", price: 50, description: "A casual friday inspired look. Look professional while still being comfortable.", category: "Womens", size: "S, M, L, XL")
]
