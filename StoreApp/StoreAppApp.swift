//
//  StoreAppApp.swift
//  StoreApp
//
//  Makes sure Simulator/Previews run properly and connects to the Firebase properly
// 
//  Created by Gabriella Huegel on 10/27/22.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct StoreAppApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationView {
                let viewModel = AppViewModel()
                ContentView()
                    .environmentObject(viewModel)
            }
        }
    }
}
