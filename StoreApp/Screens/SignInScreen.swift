//
//  SignInScreen.swift
//  StoreApp
//
//  This file is the UI for the SignInScreen, any changes made in here will only affect sign in
//  Uses methods from class made in ContentView and StoreAppApp files to handle checking sign in/sign up
// 
//  Created by Gabriella Huegel on 10/29/22.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var tan = Color(red: 255/255, green: 247/255, blue: 229/255)
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                //Background
                Rectangle()
                    .foregroundColor(tan)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Image("180")
                        .frame(width: 350, height: 350, alignment: .center)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                        .padding()
                                        
                    TextField("Email Address", text: $email)
                        .foregroundColor(Color.black)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .background(tan)
                        .padding()
                        .cornerRadius(10)
                    SecureField("Password", text: $password)
                        .foregroundColor(Color.black)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .background(tan)
                        .padding()
                        .cornerRadius(10)
                                        
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                        
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    })
                    
                    NavigationLink("Create Account", destination: SignUpScreen().environmentObject(viewModel))
                        .padding()
                    
                    Spacer()
                    
                }
                .padding()
                
            }// v stack
            
        }// z stack
        .animation(.easeIn, value: true)
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
