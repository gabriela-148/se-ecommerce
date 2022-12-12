//
//  CategoriesScreen.swift
//  StoreApp
//
//  Created by Gabriella Huegel on 11/10/22.
//

import SwiftUI

struct CategoriesScreen: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    let screenName: String
    let item: Item
    var body: some View {
        //NavigationView {
            VStack {
                NavigationLink(destination: ShoesCategory(shoe: item).environmentObject(viewModel)){
                    Text("Shoes")
                }
                .padding()
                NavigationLink(destination: ShirtsCategory(shirt: item).environmentObject(viewModel)){
                    Text("Shirts")
                }
                .padding()
                NavigationLink(destination: PantsCategory(pant: item).environmentObject(viewModel)){
                    Text("Pants")
                }
                .padding()
                NavigationLink(destination: ShortsCategory(short: item).environmentObject(viewModel)){
                    Text("Shorts")
                }
                .padding()
            }
            .navigationTitle("Categories")
        }
    //}
}


struct CategoriesScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesScreen(screenName: "Screen", item: Item.example)
    //.environmentObject(Order())
    }
}
