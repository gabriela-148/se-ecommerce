//
//  HomeScreen.swift
//  StoreApp
//
//  UI for the HomeScreen
// 
//  Created by Gabriella Huegel on 10/29/22.
//

import SwiftUI

//This is Jordan testing whether he can push; will get rid of later
struct HomeScreen: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        Button {
            viewModel.signOut()
        } label: {
            Image(systemName: "arrow.up.left")
                .foregroundColor(Color.red)
        }
        Text("Home Screen")
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
