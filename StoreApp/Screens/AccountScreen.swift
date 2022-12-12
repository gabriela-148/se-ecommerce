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

struct AccountScreen: View {
    // Access to Firebase methods
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var test = AppViewModel()
    @ObservedObject var model = AppViewModel()

    @State private var isPrivate: Bool = true
    @State private var notifsEnable: Bool = false
    @State private var showAlert = true
    
    @State private var previewIndex = 0
    var previewOptions = ["Always", "When Unlocked", "Never"]
    
    var userEmail = Auth.auth().currentUser?.email
    
    var body: some View {
        Form {
            
            // Displays User information
            Section(header: Text("Email")) {
                HStack {
                    Image(systemName: "mail")
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    Text(userEmail ?? "example@gmail.com")
                }
                // takes user to screen to update email
                // does not function properly yet
                NavigationLink(destination: UpdateEmail().environmentObject(viewModel)) {
                    Text("Update Email")
                        .foregroundColor(Color.blue)
                }
                // takes user to screen to update password
                NavigationLink(destination: UpdatePassword().environmentObject(viewModel)) {
                    Text("Update Password")
                        .foregroundColor(Color.blue)
                }
                
            }// first section
            
            // Displays user's payment info
            Section(header: Text("Payment Info")) {
                HStack {
                    Image(systemName: "creditcard.circle.fill")
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    Text("Card Info")
                }
            }// second section
            
            Section(header: Text("Notifications")) {
                Toggle(isOn: $notifsEnable) {
                    Text("Enabled")
                }
                Picker(selection: $previewIndex, label: Text("Show Previews")) {
                    ForEach(0..<previewOptions.count) {
                        Text(self.previewOptions[$0])
                    }
                }
            }// third section
            
            // sign out button
            Button {
                viewModel.signOut()
            } label: {
                Text("Sign Out")
                    .foregroundColor(Color.red)
            }
        }// form
    }// body
}
   
struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
