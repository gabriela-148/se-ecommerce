//
//  OrderView.swift
//  StoreApp
//  displays the items a customer has added to their cart
//  Created by lauren boyle on 12/4/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var viewModel: AppViewModel
    //@EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(viewModel.order) { item in
                        VStack {
                            Text(item.name)
                            HStack {
                                Image(item.mainImage)
                                    .resizable()
                                    .scaledToFit()
                                Spacer()
                                Text("$\(item.price)")
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place order")
                    }
                }
                .disabled(viewModel.order.isEmpty)
            }
            .navigationTitle("Cart")
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                EditButton()
            }
        }
    }
    func deleteItem(at offsets: IndexSet) {
        viewModel.order.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(AppViewModel())
    }
}
