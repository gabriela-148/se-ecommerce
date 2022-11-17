//
//  UpdatePassword.swift
//  StoreApp
//
//  Created by Gabriella Huegel on 11/17/22.
//

import SwiftUI

struct UpdatePassword: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State private var newPassword: String = ""
    @State private var showAlert = false
    
    var body: some View {
        SecureField("Password", text: $newPassword)
            .foregroundColor(Color.black)
            .frame(width: 300, height: 50, alignment: .center)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .background(Color.white)
            .padding()
            .cornerRadius(10)
        Button {
            viewModel.changePass(password: newPassword)
            showAlert = true
        } label: {
            Text("Save")
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(""),
                message: Text("Password changed!")
            )
        }//alert
        
    }
}

struct UpdatePassword_Previews: PreviewProvider {
    static var previews: some View {
        UpdatePassword()
    }
}
