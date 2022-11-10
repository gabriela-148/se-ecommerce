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
    var body: some View {
        NavigationView {
            VStack {
                Text(screenName)
            }
            
        }
        .navigationBarTitle("Categories")
    }
}

struct CategoriesScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesScreen(screenName: "Screen")
    }
}
