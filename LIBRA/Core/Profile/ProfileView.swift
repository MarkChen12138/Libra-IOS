//
//  ProfileViewModel.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/10/8.
//


import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @Binding var showSignInView: Bool
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var url: URL? = nil
    
    let preferenceOptions: [String] = ["Sports", "Movies", "Books"]
    
                                       
    var body: some View {
        List {
            if let user = viewModel.user {
                Text("UserId: \(user.userId)")
                
                if let isAuthencated = user.isAuthencated {
                    Text("Is Authencated: \(isAuthencated.description.capitalized)")
                }
                
                Button {
                    viewModel.togglePremiumStatus()
                } label: {
                    Text("User is premium: \((user.isPremium ?? false).description.capitalized)")
                }
                
                
                Button {
                    if user.company == nil {
                        viewModel.addCompany()
                    } else {
                        viewModel.removeCompany()
                    }
                } label: {
                    Text("Company: \((user.company?.title ?? ""))" + " \nisVerified: \(String(describing: (user.company?.isVerified)))")
                }
                
                
                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                    Text("Select a photo")
                }
                
                
                if let urlString = viewModel.user?.profileImagePathUrl, let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 150, height: 150)
                    }
                }
                
                if viewModel.user?.profileImagePath != nil {
                    Button("Delete image") {
                        viewModel.deleteProfileImage()
                    }
                }
            }
        }
        .task {
            try? await viewModel.loadCurrentUser()
        }
        .onChange(of: selectedItem, perform: { newValue in
            if let newValue {
                viewModel.saveProfileImage(item: newValue)
            }
        })
        .navigationTitle("Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    SettingsView(showSignInView: $showSignInView)
                } label: {
                    Image(systemName: "gear")
                        .font(.headline)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
