//
//  ShoesCategory.swift
//  StoreApp
//  displays all the shoes sold by the store
//  Created by lauren boyle on 11/16/22.
//

import SwiftUI

struct ShoesCategory: View {
    let shoe: Item
    var body: some View {
        NavigationView {
            List {
                ForEach(shoes) {shoe in
                    NavigationLink(destination: ItemDetail(itemDetail: shoe)) {
                        VStack {
                            Image(shoe.mainImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text(shoe.name)
                            Text("$\(shoe.price)")
                        }
                    }
                }
            }
            .navigationTitle("Shoes")
        }
    }
}

struct ShoesCategory_Previews: PreviewProvider {
    static var previews: some View {
        ShoesCategory(shoe: Item.example)
    }
}
