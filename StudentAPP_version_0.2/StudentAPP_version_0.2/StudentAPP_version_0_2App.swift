//
//  StudentAPP_version_0_2App.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 27/04/24.
//

import SwiftUI
import Firebase

@main
struct StudentAPP_version_0_2App: App {
    var body: some Scene {
        WindowGroup {
            ViewFactory.build(.introductionView)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any ]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
