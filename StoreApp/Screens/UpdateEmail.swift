//
//  UpdateEmail.swift
//  StoreApp
//
//  Created by Gabriella Huegel on 11/17/22.
//

import SwiftUI

struct UpdateEmail: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State private var newEmail: String = ""
    @State private var showAlert = false
    
    var body: some View {
        TextField("New Email", text: $newEmail)
            .foregroundColor(Color.black)
            .frame(width: 300, height: 50, alignment: .center)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .background(Color.white)
            .padding()
            .cornerRadius(10)
        Button {
            viewModel.changeEmail(email: newEmail)
            showAlert = true
        } label: {
            Text("Save")
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(""),
                message: Text("Email changed!")
            )
        }//alert
        
    }
}

struct UpdateEmail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateEmail()
    }
}
