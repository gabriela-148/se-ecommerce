//
//  PantsCategory.swift
//  StoreApp
//  displays all the pants sold by the store
//  Created by lauren boyle on 11/16/22.
//

import SwiftUI

struct PantsCategory: View {
    //test git commit
    let pant: Item
    var body: some View {
        NavigationView {
            List {
                ForEach(pants) {pant in
                    NavigationLink(destination: ItemDetail(itemDetail: pant)) {
                        VStack {
                            Image(pant.mainImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text(pant.name)
                            Text("$\(pant.price)")
                        }
                    }
                }
            }
            .navigationTitle("Pants")
        }
    }
}

struct PantsCategory_Previews: PreviewProvider {
    static var previews: some View {
        PantsCategory(pant: Item.example)
    }
}
