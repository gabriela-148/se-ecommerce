//
//  AccountScreen.swift
//  StoreApp
//
//  Created by Gabriella Huegel on 11/9/22.
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
    @ObservedObject var model = ViewModel()
    

    @State private var isPrivate: Bool = true
    @State private var notifsEnable: Bool = false
    @State private var showAlert = true
    @State private var newPassword: String = ""
    
    @State private var previewIndex = 0
    var previewOptions = ["Always", "When Unlocked", "Never"]
        
    var userEmail = Auth.auth().currentUser?.email
    
    var body: some View {
        
        let userName = model.getUser(id: Auth.auth().currentUser?.uid ?? "").name
        
        ZStack {
            // Background color
            Rectangle()
                .foregroundColor(Color.clear)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Hi, \(userName)!")
                    .foregroundColor(Color.black)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Form {
                    // Displays User information
                    Section(header: Text("Account")) {
                        HStack {
                            Image(systemName: "mail")
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                            Text(userEmail ?? "example@gmail.com")
                        }

                        // Alert to change email
                        Button {
                            alertTF(title: "Change Email", message: "", hintText: "New Email", primaryTitle: "Confirm", secondaryTitle: "Cancel") { text in
                                viewModel.changeEmail(email: text)
                            } secondaryAction: {
                                print("Cancelled")
                            }

                        } label: {
                            Text("Update Email")
                                .foregroundColor(Color.blue)
                        }
                        // Alert to change password
                        Button {
                            alertTF(title: "Change Password", message: "", hintText: "New Password", primaryTitle: "Confirm", secondaryTitle: "Cancel") { text in
                                viewModel.changePass(password: text)
                            } secondaryAction: {
                                print("Cancelled")
                            }

                        } label: {
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
            }// v stack frist
        }// z stack
        

        
    }// body
    
    init() {
        model.getData()
    }
    
}// struct


// Creates a new Alert with text fields
extension View {
    // MARK: Alert TF
    func alertTF(title: String, message: String, hintText: String, primaryTitle: String, secondaryTitle: String, primaryAction: @escaping(String)->(), secondaryAction: @escaping ()->()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = hintText
        }
        
        alert.addAction(.init(title: secondaryTitle, style: .cancel, handler: { _ in
            secondaryAction()
        }))
        
        alert.addAction(.init(title: primaryTitle, style: .default, handler: { _ in
            if let text = alert.textFields?[0].text {
                primaryAction(text)
            } else {
                primaryAction("")
            }
        }))
        
        // MARK: Presenting Alert
        rootController().present(alert, animated: true, completion: nil)
    }
    
    // MARK: Root View Controller
    func rootController()->UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return.init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return.init()
        }
        
        return root
    }
    
}
