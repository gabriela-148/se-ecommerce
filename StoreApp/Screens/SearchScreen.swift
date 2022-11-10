//
//  SearchScreen.swift
//  StoreApp
//
//  Created by Gabriella Huegel on 11/10/22.
//

import SwiftUI

struct SearchScreen: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    let screenName: String
    var body: some View {
        NavigationView {
            VStack {
                Text(screenName)
            }
        }
        .navigationBarTitle(screenName)

    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen(screenName: "Screen")
    }
}
