//
//  HomeScreen.swift
//  StoreApp
//
//  UI for the HomeScreen
// 
//  Created by Gabriella Huegel on 10/29/22.
//

import SwiftUI

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
