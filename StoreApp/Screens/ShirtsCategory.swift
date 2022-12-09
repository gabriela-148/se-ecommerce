//
//  ShirtsCategory.swift
//  StoreApp
//  displays all the shirts sold by the store
//  Created by lauren boyle on 11/16/22.
//

import SwiftUI

struct ShirtsCategory: View {
    let shirt: Item
    var body: some View {
        NavigationView {
            List {
                ForEach(shirts) {shirt in
                    NavigationLink(destination: ItemDetail(itemDetail: shirt)) {
                        VStack {
                            Image(shirt.mainImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text(shirt.name)
                            Text("$\(shirt.price)")
                        }
                    }
                }
            }
            .navigationTitle("Shirts")
        }
    }
}

struct ShirtsCategory_Previews: PreviewProvider {
    static var previews: some View {
        ShirtsCategory(shirt: Item.example)
    }
}
