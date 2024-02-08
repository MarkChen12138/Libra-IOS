//
//  HomePageView.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/8/25.
//

import SwiftUI

struct HomePageView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @State private var showeEditView = false
    @State private var isWriting = false

    var body: some View {
        NavigationView {
            VStack(spacing: 70) {
                Text("选择一项以开始")
                HStack(spacing: 50) {
                    VStack {
                        Button {
                            isWriting.toggle() // Toggle the flag
                            showeEditView.toggle() // Show the popup
                        } label: {
                            Image("write")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .padding()
                        }
                        Text(isWriting ? "已编写" : "编写")
                    }

                    VStack {
                        NavigationLink(destination: StartContractView()) {
                            Image("upload")
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .padding()
                        }
                        Text("上传")
                    }

                }
                HStack(spacing: 35) {
                    VStack {
                        Button {
                            // Handle button action
                        } label: {
                            Image("file")
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width:100, height:100)
                                .padding()
                        }
                        Text("我的")
                    }

                    VStack {
                        Button {
                            // Handle button action
                        } label: {
                            Image("libra")
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width:120, height:120)
                                .padding()
                        }
                        Text("探索")
                    }
                }
            }
            .padding()
            .frame(height: 800)
        }
        .task {
            try? await viewModel.loadCurrentUser()
        }
    }
}

        
    



struct ContentView_Previews1: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
