//
//  CategoryItems.swift
//  StoreApp
//  displays all the shorts sold by the store
//  Created by lauren boyle on 11/11/22.
//

import SwiftUI

struct ShortsCategory: View {
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var test = AppViewModel()
    
    let short: Item
    var body: some View {
        NavigationView {
            List {
                ForEach(shorts) {short in
                    NavigationLink(destination: ItemDetail(itemDetail: short)) {
                        VStack {
                            Image(short.mainImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text(short.name)
                            Text("$\(short.price)")
                        }
                    }
                }
            }
            .navigationTitle("Shorts")
        }
    
    }
}

struct ShortsCategory_Previews: PreviewProvider {
    static var previews: some View {
        ShortsCategory(short: Item.example)
    }
}
