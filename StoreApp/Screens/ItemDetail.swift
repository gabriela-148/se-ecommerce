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
        NavigationView {
            VStack {
                VStack {
                   //Text(itemDetail.name)
                      //  .font(.headline)
                      //  .fontWeight(.black)
                      //  .padding()
                    Image(itemDetail.mainImage)
                        .resizable()
                        .scaledToFit()
                    Text("$\(itemDetail.price)")
                        .fontWeight(.black)
                    Spacer()
                }
                VStack {
                    Text(itemDetail.description)
                        .padding()
                    Text(itemDetail.size)
                    Spacer()
                }
            }
            .navigationTitle(itemDetail.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(itemDetail: Item.example)
    }
}
