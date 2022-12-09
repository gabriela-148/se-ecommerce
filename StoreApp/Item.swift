//
//  Item.swift
//  StoreApp
//  creates an item and stores items in arrays
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
    Item(name: "Mens Daily Wear Shorts", price: 38, description: "Dress your best everyday with these shorts. Perfect for all occassions and can be dressed up or down.", category: "Mens", size: "S, M, L, XL"),
    Item(name: "Mens First Day of School Shorts", price: 30, description: "Whether its the first day of school or the first day of summer, these shorts will be your go to.", category: "Mens", size: "S, M, L"),
    Item(name: "Mens Sport Shorts", price: 32, description: "Get ready for your next activity with these shorts. The comfort and style will intimidate any competitor.", category: "Mens", size: "S, M, L, XL"),
    Item(name: "Womens Striped Tie Shorts", price: 50, description: "These patterned shorts will elevate any look. Perfect for summer days or date nights.", category: "Womens", size: "S, M, L"),
    Item(name: "Womens White Long Shorts", price: 45, description: "The cutest shorts and a must have for your closet. Belt included.", category: "Womens", size: "XS, S, M, L"),
    Item(name: "Mens Dress Shoes", price: 35, description: "Complete the look with these dress shoes. Perfect for work, weddings, and date nights.", category: "Mens", size: "S, M, L, XL"),
    Item(name: "Mens Walking Shoes", price: 30, description: "The comfiest shoes for your everyday needs. Enjoy the outdoors or get your errands done in these sneakers.", category: "Mens", size: "S, M, L"),
    Item(name: "Mens Work Shoes", price: 32, description: "Don't be afraid to get some work done with these hand boots. Designed for comfort and to withstand any environment.", category: "Mens", size: "S, M, L, XL"),
    Item(name: "Womens Classic Heel Shoes", price: 50, description: "The perfect shoe for work, nights out, or any other event. Will go with any outfit.", category: "Womens", size: "S, M, L"),
    Item(name: "Womens Hightop Shoes", price: 45, description: "Bring back past fashion with these black hightop sneakers. They go with any outfit and are a must have.", category: "Womens", size: "XS, S, M, L"),
    Item(name: "Womens Wedding Night Shoes", price: 65, description: "Whether it is your wedding, you're in one, you're attending, or just looking for a stylish heel, these are for you.", category: "Womens", size: "XS, S, M, L, XL"),
    Item(name: "Mens Sunday Best Pants", price: 45, description: "Look your best with these pants. Whether you have dinner in a nice restaurant or going for a walk in the park, these pants will complete the look.", category: "Mens", size: "S, M, L, XL"),
    Item(name: "Mens Distressed Cuff Jeans", price: 54, description: "A great pair of jeans with any shirt or jacket.", category: "Mens", size: "S, M, L"),
    Item(name: "Womens Skinny Jeans", price: 64, description: "Super cute jeans for the fall.", category: "Womens", size: "S, M, L"),
    Item(name: "Womens Straight Leg Jeans", price: 80, description: "The perfect pair of jeans for any occassion. Add them to your wadrobe today.", category: "Womens", size: "XS, S, M, L, XL"),
    Item(name: "Womens Baggy Jeans", price: 65, description: "Spruce up your look with these trendy jeans. These jeans have oversized look with a dark wash.", category: "Womens", size: "XS, S, M, L, XL"),
    Item(name: "Womens Professional Joggers", price: 50, description: "A casual friday inspired look. Look professional while still being comfortable.", category: "Womens", size: "S, M, L, XL"),
    Item(name: "Mens Button Up Shirt", price: 45, description: "A versatile shirt, perfect for work and any special occassion.", category: "Mens", size: "S, M, L, XL"),
    Item(name: "Mens Plain White Tee", price: 25, description: "A closet staple. This tee can be dressed up or down and is a must have.", category: "Mens", size: "S, M, L"),
    Item(name: "Mens Patterned Shirt", price: 30, description: "Spruce up your look with this fun shirt.", category: "Mens", size: "XS, S, M, L, XL"),
    Item(name: "Womens Green Chunky Knit", price: 40, description: "The best sweater for the changing seasons. Get in the holiday spirit with this green oversized sweater.", category: "Womens", size: "S, M, L"),
    Item(name: "Womens Puffy Sleeved Shirt", price: 50, description: "Elevate your outfit with this stylish shirt.", category: "Womens", size: "S, M, L, XL")

]

let shorts = [
    Item(name: "Mens Daily Wear Shorts", price: 38, description: "Dress your best everyday with these shorts. Perfect for all occassions and can be dressed up or down.", category: "Mens", size: "S, M, L, XL"),
    Item(name: "Mens First Day of School Shorts", price: 30, description: "Whether its the first day of school or the first day of summer, these shorts will be your go to.", category: "Mens", size: "S, M, L"),
    Item(name: "Mens Sport Shorts", price: 32, description: "Get ready for your next activity with these shorts. The comfort and style will intimidate any competitor.", category: "Mens", size: "S, M, L, XL"),
    Item(name: "Womens Striped Tie Shorts", price: 50, description: "These patterned shorts will elevate any look. Perfect for summer days or date nights.", category: "Womens", size: "S, M, L"),
    Item(name: "Womens White Long Shorts", price: 45, description: "The cutest shorts and a must have for your closet. Belt included.", category: "Womens", size: "XS, S, M, L")
]
let shoes = [
    Item(name: "Mens Dress Shoes", price: 35, description: "Complete the look with these dress shoes. Perfect for work, weddings, and date nights.", category: "Mens", size: "S, M, L, XL"),
    Item(name: "Mens Walking Shoes", price: 30, description: "The comfiest shoes for your everyday needs. Enjoy the outdoors or get your errands done in these sneakers.", category: "Mens", size: "S, M, L"),
    Item(name: "Mens Work Shoes", price: 32, description: "Don't be afraid to get some work done with these hand boots. Designed for comfort and to withstand any environment.", category: "Mens", size: "S, M, L, XL"),
    Item(name: "Womens Classic Heel Shoes", price: 50, description: "The perfect shoe for work, nights out, or any other event. Will go with any outfit.", category: "Womens", size: "S, M, L"),
    Item(name: "Womens Hightop Shoes", price: 45, description: "Bring back past fashion with these black hightop sneakers. They go with any outfit and are a must have.", category: "Womens", size: "XS, S, M, L"),
    Item(name: "Womens Wedding Night Shoes", price: 65, description: "Whether it is your wedding, you're in one, you're attending, or just looking for a stylish heel, these are for you.", category: "Womens", size: "XS, S, M, L, XL")
]
let pants = [
    Item(name: "Mens Sunday Best Pants", price: 45, description: "Look your best with these pants. Whether you have dinner in a nice restaurant or going for a walk in the park, these pants will complete the look.", category: "Mens", size: "S, M, L, XL"),
    Item(name: "Mens Distressed Cuff Jeans", price: 54, description: "A great pair of jeans with any shirt or jacket.", category: "Mens", size: "S, M, L"),
    Item(name: "Womens Skinny Jeans", price: 64, description: "Super cute jeans for the fall.", category: "Womens", size: "S, M, L"),
    Item(name: "Womens Straight Leg Jeans", price: 80, description: "The perfect pair of jeans for any occassion. Add them to your wadrobe today.", category: "Womens", size: "XS, S, M, L, XL"),
    Item(name: "Womens Baggy Jeans", price: 65, description: "Spruce up your look with these trendy jeans. These jeans have oversized look with a dark wash.", category: "Womens", size: "XS, S, M, L, XL"),
    Item(name: "Womens Professional Joggers", price: 50, description: "A casual friday inspired look. Look professional while still being comfortable.", category: "Womens", size: "S, M, L, XL")
]

let shirts = [
    Item(name: "Mens Button Up Shirt", price: 45, description: "A versatile shirt, perfect for work and any special occassion.", category: "Mens", size: "S, M, L, XL"),
    Item(name: "Mens Plain White Tee", price: 25, description: "A closet staple. This tee can be dressed up or down and is a must have.", category: "Mens", size: "S, M, L"),
    Item(name: "Mens Patterned Shirt", price: 30, description: "Spruce up your look with this fun shirt.", category: "Mens", size: "XS, S, M, L, XL"),
    Item(name: "Womens Green Chunky Knit", price: 40, description: "The best sweater for the changing seasons. Get in the holiday spirit with this green oversized sweater.", category: "Womens", size: "S, M, L"),
    Item(name: "Womens Puffy Sleeved Shirt", price: 50, description: "Elevate your outfit with this stylish shirt.", category: "Womens", size: "S, M, L, XL")
]

