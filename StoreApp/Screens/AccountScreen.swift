//
//  AccountScreen.swift
//  StoreApp
//
//  Created by Gabriella Huegel on 11/10/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import Firebase
import FirebaseCore

class AccountViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var currUser: User?
    
    //var auth = Auth.auth()
    
    init() {
        fetchCurrentUser()
    }
    
    private func fetchCurrentUser() {
        
        let db = Firestore.firestore()
        
        guard let uid =
                Auth.auth().currentUser?.uid else {
                    self.errorMessage = "Could not find uid"
                    return
                    
                }
                
        db.collection("users").document(uid).getDocument { snapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch current user: \(error)"
                    return
                }
                
            guard let data = snapshot?.data() else {
                self.errorMessage = "no data found"
                return
            }
               
                
                let uid = data["uid"] as? String ?? ""
                let name = data["firstName"] as? String ?? ""
                self.currUser = User(id: uid, name: name)
                
                
            }
    }
}
struct AccountScreen: View {
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject private var vm = AccountViewModel()
    
    // get user information in either this screen/hoome/content view then pass information into screen
    // where it is needed
    
    let screenName: String
    var body: some View {
        NavigationView {
            VStack {
                Text(screenName)
                Text(vm.currUser?.name ?? "\(vm.errorMessage)")
                Button {
                    viewModel.signOut()
                } label: {
                    Text("Sign Out")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarTitle(screenName)
    }
    
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen(screenName: "Screen")
    }
}
