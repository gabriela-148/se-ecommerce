//
//  ItemDetail.swift
//  StoreApp
//  Shows the details of an item when user clicks on it
//  Created by lauren boyle on 11/9/22.
//

import SwiftUI

struct ItemDetail: View {
   // @EnvironmentObject var order: Order
    @EnvironmentObject var viewModel: AppViewModel
    
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
                    //Button("Add to Cart") {
                    //NavigationLink(destination: OrderView()){
                    Button("Add to Cart") {
                            viewModel.add(item: itemDetail)
                        }
                        //order.add(item: itemDetail)
                   // }
                        //viewModel.signedIn
                    //}
                    .font(.headline)
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
        NavigationView {
            ItemDetail(itemDetail: Item.example)
                .environmentObject(AppViewModel())
        }
    }
}
