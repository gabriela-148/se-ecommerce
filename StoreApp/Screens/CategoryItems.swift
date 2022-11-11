//
//  CategoryItems.swift
//  StoreApp
//
//  Created by lauren boyle on 11/11/22.
//

import SwiftUI

struct CategoryItems: View {
    var item: Item
    var body: some View {
        NavigationView {
            List {
                ForEach(items) {_item in
                    NavigationLink(destination: ItemDetail(itemDetail: item)) {
                        VStack {
                            Image(item.mainImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text(item.name)
                            Text("$\(item.price)")
                        }
                    }
                }
            }
        .navigationTitle("Clothes")
        }
    }
}

struct CategoryItems_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItems(item: Item.example)
    }
}
