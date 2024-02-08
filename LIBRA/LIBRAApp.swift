//
//  LIBRAApp.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/8/22.
//


import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

@main
struct YourApp: App {

    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }

    // ...

}
