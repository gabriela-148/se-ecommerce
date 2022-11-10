//
//  Item.swift
//  StoreApp
//
//  Created by lauren boyle on 11/9/22.
//

import SwiftUI

struct Item: Identifiable {
    var id: UUID
    var name: String
    var price: Int
    var description: String
    var category: String
    var size: String
    
    var mainImage: String {
        name
    }
    
    
    #if DEBUG
    static let example = Item(id: UUID(), name: "Mens Daily Wear Shorts", price: 30, description: "The best shorts to lounge in or run errands. They are versatile and a must have.", category: "Mens", size: "S, M, L, XL")
    #endif
}
