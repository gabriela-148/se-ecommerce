//
//  ViewModel.swift
//  StoreApp
//
//  Created by Gabriella Huegel on 11/28/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseCore
import SwiftUI

class ViewModel: ObservableObject {
    @EnvironmentObject var viewModel: AppViewModel
    
    @Published var userList = [UserData]()
        
    // Returns user information for current user signed in
    func getUser(id: String) -> UserData {
        var currUser: UserData = UserData(id: "", name: "", points: 0)
        self.userList.forEach { item in
            if item.id == Auth.auth().currentUser?.uid ?? "" {
                currUser = item
            }
        }
        return currUser
    } // end of getUser
    
    
    // Initializes the userList of all the UserData in the database
    func getData() {
        
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments { snapshot, error in
            // Check for errors
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update list property in main thread
                    DispatchQueue.main.async {
                        
                        // Get all documents and create UserData items
                        self.userList = snapshot.documents.map { d in
                            
                            // Create new UserData item for each document returned
                            return UserData(id: d.documentID,
                                            name: d["firstName"] as? String ?? "Cannot find",
                                            points: d["points"] as? Int ?? 0)
                        }
                        
                    }
                    // Get all the documents and create UserData objects
                    
                }
            }
            else {
                // Handle the error
            }
        }
    } // getData method
}
