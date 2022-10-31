//
//  SignUpScreen.swift
//  StoreApp
//
//  This file is the UI for the SignUpScreen, any changes made in here will only affect sign up
//  Uses methods from class made in ContentView and StoreAppApp files to create new users
//
//  Created by Gabriella Huegel on 10/29/22.
//

import SwiftUI
import FirebaseAuth

struct SignUpScreen: View {
    @State var email = ""
    @State var password = ""
    
    @State var firstName = ""
    
    var tan = Color(red: 255/255, green: 247/255, blue: 229/255)
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack {
            //Background
            Rectangle()
                .foregroundColor(tan)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                TextField("First Name", text: $firstName)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .background(tan)
                    .padding()
                    .cornerRadius(8)
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .background(tan)
                    .padding()
                    .cornerRadius(8)
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .background(tan)
                    .padding()
                    .cornerRadius(8)
                
                Button(action: {
                    guard !firstName.isEmpty, !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.signUp(email: email, password: password, name: firstName)
                    
                }, label: {
                    Text("Create Account")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                
                Spacer()
                
            }
            .padding()
            
           // Spacer()
        }
        .navigationTitle("Create Account")
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}

