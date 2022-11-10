//
//  ItemDetail.swift
//  StoreApp
//
//  Created by lauren boyle on 11/9/22.
//

import SwiftUI

struct ItemDetail: View {
    let itemDetail: Item
    
    var body: some View {
        HStack {
            VStack {
               Text(itemDetail.name)
                    .font(.headline)
                    .fontWeight(.black)
                    .padding()
                Image(itemDetail.mainImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("$\(itemDetail.price)")
                    .fontWeight(.black)
                }
            VStack {
                Text(itemDetail.description)
                Text(itemDetail.size)
            }
        }
        .navigationTitle(itemDetail.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(itemDetail: Item.example)
    }
}
