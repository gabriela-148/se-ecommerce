//
//  ContentView.swift
//  StoreApp
//  This file creates all necessary objects for user log in authentication
//  And automatically checks if the user is already signed in once opening the app
//
//  Created by Gabriella Huegel on 10/27/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import Firebase
import FirebaseFirestore


class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false // changes view in real time
    
    // changes variable in real time
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    // function called to check if user is in database
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            //Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    // the function that is called to create a user in the database
    func signUp(email: String, password: String, name: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            let db = Firestore.firestore()
            
            db.collection("users").addDocument(data: ["firstName": name, "uid": result!.user.uid, "points": 0]) { error in
                if error == nil {
                    //No errors
                    print("No errors")
                } else {
                    
                }
            }
            guard result != nil, error == nil else {
                
                return
            }
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    
    // function that signs out user once button is clicked
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
    
}

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            // checks if user is signed in and changes view to homescreen at open
            if viewModel.signedIn {
                TabView {
                    HomeScreen(screenName: "Home")
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    SearchScreen(screenName: "Search")
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                    CategoriesScreen(screenName: "Categories")
                        .tabItem {
                            Label("Categories", systemImage: "list.bullet")
                        }
                    AccountScreen(screenName: "Account")
                        .tabItem {
                            Label("Account", systemImage: "person.fill")
                        }
                }

            }
            else {
                SignInView()
            }
        }.navigationBarHidden(true).onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
