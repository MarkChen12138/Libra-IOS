//
//  SettingsView.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/10/11.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List {
            Button("Log out") {
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button(role: .destructive) {
                Task {
                    do {
                        try await viewModel.deleteAccount()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Delete account")
            }

            
//            if viewModel.authProviders.contains(.email) {
//                emailSection
//            }
//            
//            if viewModel.authUser?.isAnonymous == true {
//                anonymousSection
//            }
        }
        .onAppear {
//            viewModel.loadAuthProviders()
            viewModel.loadAuthUser()
        }
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(showSignInView: .constant(false))
        }
    }
}
