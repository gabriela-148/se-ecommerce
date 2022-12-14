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
    //var for order
    @Published var order = [Item]()
    
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
    
    func changePass(password: String) {
        auth.currentUser?.updatePassword(to: password) { error in
          return
        }
    }
    
    func changeEmail(email: String) {
        auth.currentUser?.updateEmail(to: email) { error in
            return
        }
    }
    
    //total price of order
    var total: Int {
        if order.count > 0 {
            return order.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    
    //adds an item to an order
    func add(item: Item) {
        //viewModel.signedIn = true;
        order.append(item)
    }

    //removes an item from an order
    func remove(item: Item) {
        if let index = order.firstIndex(of: item) {
            //viewModel.signedIn = true;
            order.remove(at: index)
        }
    }
    
    //saves an order to db
    func saveOrder(customer: String, totalPrice: String, paymentType: String) {
        let db = Firestore.firestore()
        db.collection("orders").addDocument(data:["customer": customer, "totalPrice": totalPrice, "paymentType": paymentType]) { error in
            if error == nil {
                //No errors
                print("No errors")
            } else {
                
            }
        }
    }
    
    //delete all items after purchase
    func deleteAll() {
        order.removeAll()
    }
}

    

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            // checks if user is signed in and changes view to homescreen at open
            if viewModel.signedIn {
                TabView {
                    HomeScreen(screenName: "Home", shirt:Item.example)
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    SearchScreen()
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                    CategoriesScreen(screenName: "Categories", item: Item.example)
                        .environmentObject(viewModel)
                        .tabItem {
                            Label("Categories", systemImage: "list.bullet")
                        }
                    AccountScreen()
                        .tabItem {
                            Label("Account", systemImage: "person.fill")
                        }
                    
                    OrderView()
                        .tabItem {
                            Label("Cart", systemImage: "cart.circle")
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
